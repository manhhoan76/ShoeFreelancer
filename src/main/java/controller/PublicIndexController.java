package controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.BannerDao;
import dao.CategoryDao;
import dao.ContactDao;
import dao.ImageDao;
import dao.InfoShopDao;
import dao.ProductDao;
import entity.Category;
import entity.Contact;
import entity.Product;
import util.FormatNumber;
import util.SlugUtil;

@Controller
public class PublicIndexController {
	@Autowired
	private SlugUtil slug;
	@Autowired
	private CategoryDao catDAO;
	@Autowired
	private ProductDao productDAO;
	@Autowired
	private ImageDao imageDAO;
	@Autowired
	private InfoShopDao infoShopDao;
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private FormatNumber format;
	@Autowired
	private ContactDao contactDao;

	@ModelAttribute
	public void Addcommond(ModelMap model) {
		model.addAttribute("slug", slug);
		model.addAttribute("infoShop", infoShopDao.getInfo());
		model.addAttribute("listCatHeader", catDAO.getItems());
	}

	/* PUBLIC INDEX */
	@RequestMapping(value = { "", "trang-chu" })
	public String index(ModelMap modelMap, HttpServletRequest request) {
		try {
			modelMap.addAttribute("title", "Trang chủ shop");
			modelMap.addAttribute("listImageBanner", bannerDao.getItemsForPublic());
			modelMap.addAttribute("listProductMostView", productDAO.getItemsMostView());
			modelMap.addAttribute("listProductMostSearch", productDAO.getItemsMostSearch());
			modelMap.addAttribute("listProductMostNew", productDAO.getItemsMostNew());
			modelMap.addAttribute("activeTC", "menu-active");
			int numRandom;
			Random rd = new Random();
			numRandom = rd.nextInt(productDAO.countProduct()) - 9;
			if (numRandom < 0) {
				numRandom = 0;
			}
			modelMap.addAttribute("listItemsRandom", productDAO.getItemsRandom(numRandom));
			ArrayList<Category> listCategoryMostView = (ArrayList<Category>) catDAO.getItemsMostView();
			ArrayList<Product> listProductForCatMostView = new ArrayList<>();
			for (Category cat : listCategoryMostView) {
				listProductForCatMostView.add(productDAO.getItemsByIdCatLimit1(cat.getId()));
			}
			String path = request.getServletContext().getRealPath("") + "files";
			modelMap.addAttribute("listProductForCatMostView", listProductForCatMostView);
			return "public.index";
		} catch (Exception e) {
			return "redirect:/";
		}
	}

	/* ACCOUNT */
	@RequestMapping(value = "/account")
	public String account() {
		return "public.account";
	}

	/* PRODUCTS */
	@RequestMapping(value = { "/{slug}/{id}/{page}", "/{slug}/{id}" })
	public String category(@PathVariable("slug") String slug, @PathVariable("id") int id,
			@PathVariable(value = "page", required = false) Integer page, ModelMap model) {
		try {
			model.addAttribute("listCat", catDAO.getItems());
			model.addAttribute("title", slug);
			if (page == null) {
				page = 1;
			}
			int sumProductByID_Cat = productDAO.countNumberProduct(id);
			int sumPage = (int) Math.ceil((float) sumProductByID_Cat / 9);
			model.addAttribute("sumPage", sumPage);
			model.addAttribute("objCat", catDAO.getItem(id));
			model.addAttribute("page", page);
			model.addAttribute("activeDM", "menu-active");
			model.addAttribute("id", id);
			int offset = (page - 1) * 9;
			model.addAttribute("listProductByIDCatPagination", productDAO.getItemsByIdCatLimit9(id, offset));
			return "public.category";
		} catch (Exception e) {
			return "redirect:/";
		}
	}

	/* DETAIL */
	@RequestMapping(value = { "/san-pham/{slug}/{id}", "/san-pham/{slug}/{id}/{s}" })
	public String detail(@PathVariable("slug") String slug, @PathVariable("id") int id,
			@PathVariable(value = "s", required = false) String s, ModelMap model) {
		try {
			if (s != null) {
				int newSearchViewProduct = productDAO.getItemByID(id).getProduct_count_search() + 1;
				productDAO.updateSearchViewProduct(id, newSearchViewProduct);
			}
			model.addAttribute("listCat", catDAO.getItems());
			model.addAttribute("title", slug);
			model.addAttribute("objProduct", productDAO.getItemByID(id));
			Product objProduct = (Product) productDAO.getItemByID(id);
			int viewNumber = objProduct.getProduct_view() + 1;
			productDAO.editViewProduct(viewNumber, id);
			model.addAttribute("listProductSameCat",
					productDAO.getItemsSameCatByIdCat(objProduct.getId_category(), id));
			model.addAttribute("listImageByIdProduct", imageDAO.getItems(id));
			return "public.detail";
		} catch (Exception e) {
			return "redirect:/";
		}

	}

	/* SORT LIST PRODUCT */
	@RequestMapping(value = "/sap-xep-danh-muc", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String sort(@RequestParam("choise") int choise, @RequestParam("id") int idCat,
			@RequestParam("npage") int page, ModelMap model, HttpServletRequest request) {
		int offset = (page - 1) * 9;
		ArrayList<Product> listProduct = new ArrayList<>();
		switch (choise) {
		case 1:
			listProduct = (ArrayList<Product>) productDAO.getItemsByIdCatLimit9(idCat, offset);
			break;
		case 2:
			listProduct = (ArrayList<Product>) productDAO.getItemsByIdCatLimit9PriceASC(idCat, offset);
			break;
		case 3:
			listProduct = (ArrayList<Product>) productDAO.getItemsByIdCatLimit9PriceDESC(idCat, offset);
			break;
		case 4:
			listProduct = (ArrayList<Product>) productDAO.getItemsByIdCatLimit9NameAsc(idCat, offset);
			break;
		case 5:
			listProduct = (ArrayList<Product>) productDAO.getItemsByIdCatLimit9NameDESC(idCat, offset);
			break;
		case 6:
			listProduct = (ArrayList<Product>) productDAO.getItemsByIdCatLimit9IdDESC(idCat, offset);
			break;
		}
		String result = "";
		for (Product objProduct : listProduct) {
			result += "<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-6 product-wrapper product-resize mb30\">\r\n"
					+ "	<div class=\"product-information\">\r\n" + "		<div class=\"product-detail clearfix\">\r\n"
					+ "			<div class=\"product-image image-resize\">\r\n" + "				<a href=\""
					+ request.getContextPath() + "/san-pham/" + slug.makeSlug(objProduct.getName()) + "/"
					+ objProduct.getId() + "\" title=\"" + objProduct.getName() + "\">\r\n"
					+ "					<picture>\r\n"
					+ "						<source media=\"(max-width: 991px)\" srcset=\"" + request.getContextPath()
					+ "/files/" + objProduct.getPicture() + "\">\r\n"
					+ "						<source media=\"(min-width: 992px)\" srcset=\"" + request.getContextPath()
					+ "/files/" + objProduct.getPicture() + "\">\r\n"
					+ "						<img style=\"width: 100%; height: 40%;\" src=\"" + request.getContextPath()
					+ "/files/" + objProduct.getPicture() + "\" alt=\"" + objProduct.getName() + "\" />\r\n"
					+ "					</picture>\r\n" + "				</a>\r\n"
					+ "				<!-- <div class=\"product-pricesale-percent\">-10%</div> -->\r\n"
					+ "				<div class=\"product-icon-new countdown_7680117\" style=\"display: none;\">\r\n"
					+ "					<svg class=\"svg-next-icon svg-next-icon-size-36\" style=\"fill:#d80027\">\r\n"
					+ "						<use xmlns:xlink=\"http://www.w3.org/1999/xlink\" xlink:href=\"#icon-new-product\"></use>\r\n"
					+ "					</svg>\r\n" + "				</div>\r\n"
					+ "<div class=\"box-position-quickview\">\r\n"
					+ "					<div class=\"wrap-btn-quickview\">\r\n"
					+ "					<button class=\"btn-style-buynow addnow btn-success\"  data-toggle=\"modal\" data-target=\"#myModal-"
					+ objProduct.getId() + "\"><span class='text-btn' >Mua ngay</span></button>\r\n"
					+ "					</div>\r\n" + "				</div>\r\n"
					+ "				<div class=\"modal fade\" id=\"myModal-" + objProduct.getId()
					+ "\" role=\"dialog\">\r\n"
					+ "									    <div class=\"modal-dialog\">\r\n"
					+ "									      <!-- Modal content-->\r\n"
					+ "									      <div class=\"modal-content\">\r\n"
					+ "									        <div class=\"modal-header\">\r\n"
					+ "									        	<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\r\n"
					+ "									        	<h2 style=\"text-align: center; color: #0c4da1;\">Thông tin liên hệ mua hàng</h2>\r\n"
					+ "									        </div>\r\n"
					+ "									        <div class=\"modal-body\">\r\n"
					+ "									        <div>\r\n"
					+ "									        	<div  class=\"col-sm-9 col-xs-12\">\r\n"
					+ "								        			<img  class=\"img-rounded\" alt=\""
					+ objProduct.getName() + "\" src=\"" + request.getContextPath() + "/files/"
					+ objProduct.getPicture() + "\"> \r\n" + "								        		</div>\r\n"
					+ "									        	<div  class=\" col-sm-3 col-xs-12\" style=\"text-align: center;\" >\r\n"
					+ "									        		<h5 style=\"color: #f46f22;\" ><i class=\"fa fa-facebook-square\"></i></h5> <a href=\""
					+ infoShopDao.getInfo().getLink_fb() + "\">The SaiGon</a>\r\n"
					+ "										        	<h5 style=\"color: #f46f22;\" ><i class=\"fa fa-phone\"></i></h5>"
					+ infoShopDao.getInfo().getPhone() + " \r\n"
					+ "									        		<h5 style=\"color: #f46f22;\" ><i class=\"fa  fa-info-circle\"></i></h5>"
					+ infoShopDao.getInfo().getAddress() + "\r\n"
					+ "									        		<h5></h5>\r\n"
					+ "									        	</div>\r\n"
					+ "									        </div>\r\n"
					+ "									        <div class=\"clearboth\"></div>\r\n"
					+ "										        <div style=\"margin-top: 20px;\" >\r\n"
					+ "										        	<form accept-charset='UTF-8' action='"
					+ request.getContextPath() + "/lien-he-mua-hang-danh-muc/" + objProduct.getId_category() + "/"
					+ page + "' id='contact' method='post'>\r\n"
					+ "														<input name='FormType' type='hidden' value='contact' />\r\n"
					+ "														<input name='utf8' type='hidden' value='true' />\r\n"
					+ "														<div class=\"contact-form page-form-contact\">\r\n"
					+ "															<div class=\"row\">\r\n"
					+ "																<div class=\"col-sm-6 col-xs-12\">\r\n"
					+ "																	<div class=\"form-group\">\r\n"
					+ "																		<div class=\"input-group\">\r\n"
					+ "																			<span class=\"input-group-addon\"><i class=\"fa fa-user\"></i></span>\r\n"
					+ "																			<input type=\"text\" name=\"name_customer\" class=\"form-control\" autocapitalize=\"off\" required placeholder=\"Họ và tên\" />\r\n"
					+ "																		</div>\r\n"
					+ "																		<p class=\"error-contact\">Không được để trống.</p>\r\n"
					+ "																	</div>\r\n"
					+ "																	<div class=\"form-group\">\r\n"
					+ "																		<div class=\"input-group\">\r\n"
					+ "																			<span class=\"input-group-addon\"><i class=\"fa fa-envelope-o\"></i></span>\r\n"
					+ "																			<input type=\"text\" name=\"email\" class=\"form-control\" autocapitalize=\"off\" maxlength=\"50\" required=\"\" pattern=\"^[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$\" placeholder=\"Email\" />\r\n"
					+ "																		</div>\r\n"
					+ "																		<p class=\"error-contact\">Email không hợp lệ.</p>\r\n"
					+ "																	</div>\r\n"
					+ "																	<div class=\"form-group\">\r\n"
					+ "																		<div class=\"input-group\">\r\n"
					+ "																			<span class=\"input-group-addon\"><i class=\"fa fa-phone\"></i></span>\r\n"
					+ "																			<input type=\"text\" name=\"phone\" class=\"form-control\" autocapitalize=\"off\" required pattern=\"^\\d{8,11}$\" maxlength=\"15\" placeholder=\"Số điện thoại\" />\r\n"
					+ "																		</div>\r\n"
					+ "																		<p class=\"error-contact\">Điện thoại không hợp lệ,</p>\r\n"
					+ "																	</div>\r\n"
					+ "																</div>\r\n"
					+ "																<div class=\"col-sm-6 col-xs-12\">\r\n"
					+ "																	<div class=\"input-group\">\r\n"
					+ "																		<textarea name=\"message\" required placeholder=\"Viết lời nhắn\"></textarea>\r\n"
					+ "																	</div>\r\n"
					+ "																	<p class=\"error-contact\">Không được để trống.</p>\r\n"
					+ "																</div>\r\n"
					+ "																<div class=\"col-xs-12 text-center\">\r\n"
					+ "																	<button class=\"btn-send-contact\">Gửi thông tin</button>\r\n"
					+ "																</div>\r\n"
					+ "															</div>\r\n"
					+ "														</div>\r\n"
					+ "														</form>\r\n"
					+ "										        </div>\r\n"
					+ "										        	\r\n"
					+ "									        	</div>\r\n"
					+ "									      </div>\r\n"
					+ "									    </div>\r\n" + "									</div>"

					+ "</div>\r\n" + "			<div class=\"product-info\">\r\n" + "				<a href=\""
					+ request.getContextPath() + "/san-pham/" + slug.makeSlug(objProduct.getName()) + "/"
					+ objProduct.getId() + "\" title=\"" + objProduct.getName() + "\">\r\n"
					+ "					<h3 class=\"product-title\">" + objProduct.getName() + "</h3>\r\n"
					+ "				</a>\r\n"
					+ "				<p class=\"product-box-price clearfix flexbox-grid-default\">\r\n"
					+ "					<span class=\"price-new flexbox-content text-left\">"
					+ format.Format(objProduct.getPrice()) + "₫</span>\r\n"
					+ "					<!-- <span class=\"price-old flexbox-content text-right\">3.000.000₫</span> -->\r\n"
					+ "				</p>\r\n" + "			</div>\r\n" + "		</div>\r\n" + "	</div>\r\n" + "</div>";
		}
		return result;
	}

	/* SEARCH */
	@RequestMapping(value = { "/tim-kiem.html", "/tim-kiem/{key}+{page}.html" })
	public String search(@RequestParam(value = "s", required = false) String textSearch,
			@PathVariable(value = "key", required = false) String key,
			@PathVariable(value = "page", required = false) Integer page, ModelMap model) {
		
		if (page == null) {
			page = 1;
		}
		if (key == null) {
			key = textSearch;
		}
		int sumProductSeach = productDAO.countNumberProductSearchByKey(key);
		int sumPage = (int) Math.ceil((float) sumProductSeach / 12);
		model.addAttribute("sumPage", sumPage);
		model.addAttribute("page", page);
		int offset = (page - 1) * 12;
		model.addAttribute("key", key);
		model.addAttribute("items", productDAO.getListItemsSearchByKey(key, offset));
		return "public.search";
	}

	/* INTRODUCTION */
	@RequestMapping(value = "/gioi-thieu")
	public String introduction(ModelMap modelMap) {
		modelMap.addAttribute("title", "Giới thiệu");
		modelMap.addAttribute("activeGT", "menu-active");
		return "public.introduction";
	}

	/* CONTACT */
	@RequestMapping(value = "/lien-he")
	public String contact(ModelMap modelMap) {
		modelMap.addAttribute("title", "Liên hệ");
		modelMap.addAttribute("activeLH", "menu-active");
		return "public.contact";
	}

	@RequestMapping(value = "/lien-he", method = RequestMethod.POST)
	public String contact(ModelMap modelMap, @ModelAttribute(value = "contact") Contact contact) {
		contactDao.addItem(contact);
		return "redirect:/lien-he";
	}
	
	@RequestMapping(value = "/lien-he-mua-hang", method = RequestMethod.POST)
	public String contactForBuy(HttpServletRequest request, ModelMap modelMap, @ModelAttribute(value = "contact") Contact contact, RedirectAttributes ra) {
		System.out.println("aaa");
		contactDao.addItem(contact);
		String urlBack = request.getHeader("Referer");
		System.out.println(urlBack);
		return "redirect:"+urlBack;
	}
	@RequestMapping(value = "/lien-he-mua-hang-1", method = RequestMethod.POST)
	public String contactForBuy1(HttpServletRequest request, ModelMap modelMap, @ModelAttribute(value = "contact") Contact contact, RedirectAttributes ra) {
		System.out.println("aaa");
		contactDao.addItem(contact);
		String urlBack = request.getHeader("Referer");
		System.out.println(urlBack);
		return "redirect:/";
	}
}
