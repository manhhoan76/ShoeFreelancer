package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ContactDao;
import dao.InfoShopDao;
import entity.InfoShop;

@Controller
@RequestMapping(value = "admin")
public class AdminInfoShopController {
	@Autowired
	private InfoShopDao infoShopDao;
	@Autowired
	private ContactDao contactDAO;

	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("listContactShow", contactDAO.getListContactNotRead());
		modelMap.addAttribute("numberContact", contactDAO.countNumberContact());
		modelMap.addAttribute("activeIS", "active");
	}

	/* SHOW USERS */
	@RequestMapping(value = "info-shop")
	public String index(ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		modelMap.addAttribute("title", "Admin | Thông tin cửa hàng");
		modelMap.addAttribute("info", infoShopDao.getInfo());
		return "admin.infoShop";
	}

	@RequestMapping(value = "info-shop-edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("objInfo") InfoShop infoShop, ModelMap model, RedirectAttributes ra,
			HttpSession session) {
		if (infoShopDao.editItem(infoShop) > 0) {
			ra.addFlashAttribute("msg", "Cập nhật thành công!");
		} else {
			ra.addFlashAttribute("msg1", "Lỗi sự cố mạng");
		}
		return "redirect:/admin/info-shop";
	}
}
