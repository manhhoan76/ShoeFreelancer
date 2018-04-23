package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CategoryDao;
import dao.ContactDao;
import dao.ImageDao;
import dao.ProductDao;
import entity.Category;
import entity.Image;
import entity.Product;

@Controller
@RequestMapping("/admin")
public class AdminCategoryController {
	@Autowired
	private CategoryDao catDAO;
	@Autowired
	private ContactDao contactDAO;
	@Autowired
	private ProductDao productDAO;
	@Autowired
	private ImageDao imageDAO;

	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("listContactShow", contactDAO.getListContactNotRead());
		modelMap.addAttribute("numberContact", contactDAO.countNumberContact());
		modelMap.addAttribute("activeDM", "active");
	}

	/* SHOW CATEGORY */
	@RequestMapping("/category")
	public String index(ModelMap model, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		ArrayList<Category> listItems = (ArrayList<Category>) catDAO.getItems();
		model.addAttribute("title", "Admin | Quản lý danh mục");
		model.addAttribute("listCat", listItems);
		return "admin.category";
	}

	/* ADD CATEGORY */
	@RequestMapping(value = "/category-add", method = RequestMethod.GET)
	public String add(ModelMap model, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("title", "Admin | Thêm danh mục");
		return "admin.category.add";
	}

	@RequestMapping(value = "/category-add", method = RequestMethod.POST)
	public String add(@ModelAttribute("objCat") Category objCat, ModelMap model, RedirectAttributes ra) {
		model.addAttribute("title", "Admin | Thêm danh mục");
		try {
			Category objCheck = (Category) catDAO.checkNameCategory(objCat.getName());
			if (objCheck != null) {
				ra.addFlashAttribute("msg", 1);
				return "redirect:/admin/category-add";
			}
		} catch (Exception e) {
			if (catDAO.addItem(objCat) > 0) {
				ra.addFlashAttribute("msg", 1);
			} else {
				ra.addFlashAttribute("msg", 0);
			}
		}
		return "redirect:/admin/category";
	}

	/* EDIT CATEGORY */
	@RequestMapping(value = "/category-edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap model, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("title", "Admin | Sửa danh mục");
		Category objCat = (Category) catDAO.getItem(id);
		model.addAttribute("objCat", objCat);
		return "admin.category.edit";
	}

	@RequestMapping(value = "/category-edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("objCat") Category objCat, ModelMap model,
			RedirectAttributes ra) {
		model.addAttribute("title", "Admin | Sửa danh mục");
		try {
			Category objCheck = (Category) catDAO.checkNameCategory(objCat.getName());
			if (objCheck != null && !objCheck.getName().equals(catDAO.getItem(id).getName())) {
				ra.addFlashAttribute("msg", 1);
				return "redirect:/admin/category-edit/" + id;
			}
		} catch (Exception e) {
			if (catDAO.editItem(objCat) > 0) {
				ra.addFlashAttribute("msg", 2);
			} else {
				ra.addFlashAttribute("msg", 3);
			}
		}
		return "redirect:/admin/category";
	}

	/* DELETE CATEGORY */
	@RequestMapping("/category-delete/{id}")
	public String del(@PathVariable("id") int id, ModelMap model, RedirectAttributes ra, HttpServletRequest request) {
		model.addAttribute("title", "Admin | Xóa danh mục");
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + "files";
		List<Product> listProductByIdCat = (List<Product>) productDAO.getItemsByIdCat(id);
		for (Product objProducByIdCat : listProductByIdCat) {
			List<Image> listImageByIdProDuct = (List<Image>) imageDAO.getItems(objProducByIdCat.getId());
			for (Image objImageByIdProduct : listImageByIdProDuct) {
				String urlImageProductDel = dirPath + File.separator + objImageByIdProduct.getName();
				File delFileImage = new File(urlImageProductDel);
				delFileImage.delete();
				imageDAO.delItem(objImageByIdProduct.getId());
			}
			String urlProductDel = dirPath + File.separator + objProducByIdCat.getName();
			File delFile = new File(urlProductDel);
			delFile.delete();
			productDAO.delItem(objProducByIdCat.getId());
		}
		if (catDAO.delItem(id) > 0) {
			ra.addFlashAttribute("msg", 4);
		} else {
			ra.addAttribute("msg", 5);
		}
		return "redirect:/admin/category";
	}

}
