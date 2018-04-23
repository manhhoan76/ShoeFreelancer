package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ContactDao;
import entity.Contact;
import util.CutString;

@Controller
@RequestMapping("/admin")
public class AdminContactController {
	@Autowired
	private ContactDao contactDAO;
	@Autowired
	private CutString cutString;

	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("listContactShow", contactDAO.getListContactNotRead());
		modelMap.addAttribute("numberContact", contactDAO.countNumberContact());
		modelMap.addAttribute("cutString", cutString);
		modelMap.addAttribute("activeLH", "active");
	}

	/* INDEX CONTACT */
	@RequestMapping("/contact")
	public String index(ModelMap model, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		ArrayList<Contact> listContact = (ArrayList<Contact>) contactDAO.getItems();
		model.addAttribute("title", "Admin | Quản lý liên hệ");
		model.addAttribute("listContact", listContact);
		return "admin.contact";
	}

	/* DETAIL CONTACT */
	@RequestMapping("/contact-detail/{id}")
	public String detail(@PathVariable("id") int id, ModelMap model, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("objContact", contactDAO.getItem(id));
		contactDAO.readed(id);
		return "admin.contact.detail";
	}

	/* UPDATE NUMBER CONTACT */
	@RequestMapping(value = "/contact-updateNumberContact", method = RequestMethod.POST)
	public @ResponseBody Integer updateNumber() {
		contactDAO.setReadedForAll();
		return contactDAO.countNumberContact();
	}

	/* CHANGE STATUS ALL */
	@RequestMapping(value = "/contact-changeStatus", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String changeStatus() {
		return "Đã đọc";
	}

	/* DELETE CONTACT */
	@RequestMapping("/contact-delete/{id}")
	public String delete(ModelMap model, @PathVariable("id") int id, RedirectAttributes ra) {
		if (contactDAO.deleteItem(id) > 0) {
			ra.addFlashAttribute("msg", 1);
		} else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/contact";
	}
}
