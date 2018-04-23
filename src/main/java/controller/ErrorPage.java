package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CategoryDao;
import dao.InfoShopDao;

@Controller
public class ErrorPage {
	@Autowired
	private InfoShopDao infoShopDao;
	@Autowired
	private CategoryDao catDAO;

	@RequestMapping(value = "error/404")
	public String error404(ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("userInfo") != null) {
			return "redirect:/admin";
		} else {
			modelMap.addAttribute("infoShop", infoShopDao.getInfo());
			modelMap.addAttribute("listCatHeader", catDAO.getItems());
			return "error.public";
		}
	}

}
