package controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ContactDao;
import dao.UserDao;

@Controller
@RequestMapping(value = { "admin", "admin/{abc}" })
public class AdminIndexController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private ContactDao contactDAO;

	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("listContactShow", contactDAO.getListContactNotRead());
		modelMap.addAttribute("numberContact", contactDAO.countNumberContact());
	}

	@RequestMapping(value = "")
	public String index(HttpSession session, Principal principal) {
		String username = principal.getName();
		session.setAttribute("userInfo", userDao.getItemByUsername(username));
		return "redirect:/admin/contact";
	}
}
