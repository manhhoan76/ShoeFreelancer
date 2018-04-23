package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CategoryDao;
import dao.ContactDao;
import dao.ImageDao;
import dao.ProductDao;
import entity.Image;
import entity.Product;
import entity.User;
import util.FilenameUtil;

@Controller
@RequestMapping(value = "admin")
public class AdminProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private FilenameUtil filenameUtil;
	@Autowired
	private ImageDao imageDao;
	@Autowired
	private ContactDao contactDAO;

	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("listContactShow", contactDAO.getListContactNotRead());
		modelMap.addAttribute("numberContact", contactDAO.countNumberContact());
		modelMap.addAttribute("activeSP", "active");
	}

	// ---------------HOME---------------
	@RequestMapping(value = "product")
	public String index(ModelMap modelMap, HttpSession session) {
		try {
			if (session.getAttribute("userInfo") == null) {
				return "redirect:/logout";
			}
			modelMap.addAttribute("title", "Admin | Quản lí sản phẩm");
			modelMap.addAttribute("listProduct", productDao.getItems());
			return "admin.product";
		} catch (Exception e) {
			return "redirect:/admin/product";
		}
	}

	// ---------------SHOW ADD---------------
	@RequestMapping(value = "product-add")
	public String addShow(ModelMap modelMap, HttpSession session) {
		try {
			if (session.getAttribute("userInfo") == null) {
				return "redirect:/logout";
			}
			modelMap.addAttribute("title", "Admin | Thêm sản phẩm");
			modelMap.addAttribute("listCat", categoryDao.getItems());
			return "admin.product.add";
		} catch (Exception e) {
			return "redirect:/admin/product-add";
		}
	}

	// ---------------CONTR ADD---------------
	@SuppressWarnings("static-access")
	@RequestMapping(value = "product-add", method = RequestMethod.POST)
	public String addCtrl(@ModelAttribute(value = "product") Product product, RedirectAttributes ra,
			@RequestParam("image") CommonsMultipartFile[] cmf, HttpServletRequest request, HttpSession session) {
		try {

			if (productDao.checkNameProductForAdd(product.getName()) > 0) {
				ra.addFlashAttribute("msg1", "Tên mặt hàng này đã tồn tại. Hãy chọn tên mặt hàng khác");
				return "redirect:/admin/product-add";
			}

			@SuppressWarnings("unused")
			ArrayList<String> listPicture = new ArrayList<>();
			// real path
			String appPath = request.getServletContext().getRealPath("files");
			// create forlder for save file
			File dirappPath = new File(appPath);
			if (!dirappPath.exists()) {
				dirappPath.mkdir();
			}
			String filePath = "";
			String newFilename;
			// upload file enter server
			for (CommonsMultipartFile file : cmf) {
				newFilename = filenameUtil.renameFile(file.getOriginalFilename());
				filePath = appPath + File.separator + newFilename;
				listPicture.add(newFilename);
				try {
					file.transferTo(new File(filePath));
				} catch (IllegalStateException | IOException e) {
					System.out.println("Lổi mạng khi tải ảnh");
				}
			}
			String namePicture = listPicture.get(0);
			product.setPicture(namePicture);
			User userInfo = (User) session.getAttribute("userInfo");
			product.setId_user(userInfo.getId());
			// add product
			if (productDao.addItem(product) > 0) {
				ra.addFlashAttribute("msg", "Đã thêm một mặt hàng: " + product.getName());
				Product objProduct = productDao.getItemByImage(namePicture);
				for (String string : listPicture) {
					if (!string.equals(namePicture)) {
						Image objImage = new Image(0, string, objProduct.getId());
						imageDao.addItem(objImage);
					}
				}
			} else {
				ra.addFlashAttribute("msg1", "Lỗi sự cố mạng");
			}

			return "redirect:/admin/product";
		} catch (Exception e) {
			return "redirect:/admin/product-add";
		}
	}

	// lay list anh gui qua ben kia
	// in table
	// them sua xoa anh
	// ---------------SHOW EDIT---------------
	@RequestMapping(value = "product-edit/{id}")
	public String addShow(ModelMap modelMap, @PathVariable(value = "id") int id, HttpSession session) {
		try {

			if (session.getAttribute("userInfo") == null) {
				return "redirect:/logout";
			}
			modelMap.addAttribute("title", "Admin | Sửa sản phẩm");
			modelMap.addAttribute("listCat", categoryDao.getItems());
			modelMap.addAttribute("product", productDao.getItemByID(id));
			modelMap.addAttribute("listPicture", imageDao.getItems(id));
			return "admin.product.edit";
		} catch (Exception e) {
			return "redirect:/admin/product";
		}
	}

	// ---------------CONTR EDIT---------------
	@SuppressWarnings("static-access")
	@RequestMapping(value = "product-edit", method = RequestMethod.POST)
	public String editCtrl(@ModelAttribute(value = "product") Product product, RedirectAttributes ra,
			@RequestParam("image") CommonsMultipartFile cmf, HttpServletRequest request, HttpSession session) {
		try {

			if (productDao.checkNameProductForEdit(product) > 0) {
				ra.addFlashAttribute("msg1", "Tên mặt hàng này đã tồn tại. Hãy chọn tên mặt hàng khác");
				return "redirect:/admin/product-edit/" + product.getId();
			}

			String oldFilename = productDao.getItemByID(product.getId()).getPicture();
			if (cmf.getOriginalFilename().isEmpty()) {
				product.setPicture(oldFilename);
			} else {
				// real path
				String appPath = request.getServletContext().getRealPath("files");
				String delfile = appPath + File.separator + oldFilename;
				// delete file old if exit
				File delPath = new File(delfile);
				if (delPath.exists()) {
					delPath.delete();
				}

				String newFilename = filenameUtil.renameFile(cmf.getOriginalFilename());
				String filePath = appPath + File.separator + newFilename;
				try {
					cmf.transferTo(new File(filePath));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				product.setPicture(newFilename);
			}

			// edit product
			if (productDao.editItem(product) > 0) {
				ra.addFlashAttribute("msg", "Đã sửa mặt hàng: " + product.getName());
			} else {
				ra.addFlashAttribute("msg1", "Lỗi sự cố mạng");
			}
			return "redirect:/admin/product";
		} catch (Exception e) {
			return "redirect:/admin/product";
		}
	}

	// ---------------DELETE EDIT---------------
	@RequestMapping(value = "product-del/{id}")
	public String ctrlDel(@PathVariable(value = "id") int id_product, RedirectAttributes ra,
			HttpServletRequest request) {
		try {

			Product product = productDao.getItemByID(id_product);
			String appPath = request.getServletContext().getRealPath("files");
			File delFilePath = new File(appPath + File.separator + product.getPicture());
			if (delFilePath.exists()) {
				delFilePath.delete();
			}

			if (productDao.delItem(id_product) > 0) {
				ArrayList<Image> listImage = (ArrayList<Image>) imageDao.getItems(id_product);
				for (Image image : listImage) {
					File delImagePath = new File(appPath + File.separator + image.getName());
					if (delImagePath.exists()) {
						delImagePath.delete();
					}
				}
				ra.addFlashAttribute("msg", "Đã xóa mặt hàng: " + product.getName());
			} else {
				ra.addFlashAttribute("msg1", "Có lổi sự cố mạng");
			}

			return "redirect:/admin/product";
		} catch (Exception e) {
			return "redirect:/admin/product";
		}
	}
}
