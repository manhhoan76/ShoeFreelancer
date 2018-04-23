package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ContactDao;
import dao.RoleUserDao;
import dao.UserDao;
import entity.Role;
import entity.User;
import util.StringUtil;

@Controller
@RequestMapping(value = "admin")
public class AdminUserController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleUserDao roleUserDao;
	@Autowired
	private ContactDao contactDAO;

	@ModelAttribute
	public void addCommon(ModelMap modelMap,HttpSession session) {
		modelMap.addAttribute("listContactShow", contactDAO.getListContactNotRead());
		modelMap.addAttribute("numberContact", contactDAO.countNumberContact());
		modelMap.addAttribute("activeTK", "active");
		modelMap.addAttribute("session", session.getAttribute("userInfo"));
	}

	/* SHOW USERS */
	@RequestMapping(value = "user")
	public String index(ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		modelMap.addAttribute("title", "Admin | Người dùng");
		modelMap.addAttribute("listUsers", userDao.getItems());
		modelMap.addAttribute("admin", roleUserDao.getItemAdmin());
		return "admin.user";
	}

	/* ADD USER */
	@RequestMapping(value = "user-add", method = RequestMethod.GET)
	public String add(ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		modelMap.addAttribute("title", "Admin | Thêm người dùng");
		modelMap.addAttribute("listRoles", roleUserDao.getItems());
		return "admin.user.add";
	}

	@RequestMapping(value = "user-add", method = RequestMethod.POST)
	public String add(@ModelAttribute("objUser") User objUser, ModelMap model, RedirectAttributes ra) {
		if (userDao.getItemByUsername(objUser.getUsername()) != null) {
			ra.addFlashAttribute("msg1", objUser.getUsername() + " đã tồn tại!");
			return "redirect:/admin/user-add";
		}
		objUser.setPassword(StringUtil.md5(objUser.getPassword()));
		if (userDao.addItem(objUser) > 0) {
			ra.addFlashAttribute("msg", "Đã thêm người dùng thành công!");
		} else {
			ra.addFlashAttribute("msg1", "Lỗi sự cố mạng");
		}
		return "redirect:/admin/user";
	}

	/* EDIT USER */
	@RequestMapping(value = "user-edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap model, HttpSession session, RedirectAttributes ra) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("activeTK", "active");
		User userInfor = (User) session.getAttribute("userInfo");
		Role admin = roleUserDao.getItemAdmin();
		if (userInfor.getId_role() == admin.getId() || userInfor.getId() == id) {
			User objUser = (User) userDao.getItemById(id);
			model.addAttribute("objUser", objUser);
			model.addAttribute("listRoles", roleUserDao.getItems());
			model.addAttribute("title", "Admin | Sửa người dùng");
			return "admin.user.edit";
		} else {
			ra.addFlashAttribute("msg1", "Bạn không có quyền sửa người dùng này!");
			return "redirect:/admin/user";
		}
	}

	@RequestMapping(value = "user-edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("objUser") User objUser, ModelMap model,
			RedirectAttributes ra, HttpSession session) {
		if (objUser.getPassword().length() > 5) {
			objUser.setPassword(StringUtil.md5(objUser.getPassword()));
		} else {
			User userOld = userDao.getItemById(id);
			objUser.setPassword(userOld.getPassword());
		}
		if(objUser.getId_role() == 0){
			User userOld = userDao.getItemById(id);
			objUser.setId_role(userOld.getId_role());
		}
		if (userDao.editItem(objUser) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công!");
		} else {
			ra.addFlashAttribute("msg1", "Lỗi sự cố mạng");
		}

		User userInfo = (User) session.getAttribute("userInfo");
		Role admin = roleUserDao.getItemAdmin();
		if (userInfo.getId_role() == admin.getId()) {
			return "redirect:/admin/user";
		} else {
			return "redirect:/admin/user-edit/" + id;
		}

	}

	/* DELETE USER */
	@RequestMapping("user-del/{id}")
	public String del(@PathVariable("id") int id, ModelMap model, RedirectAttributes ra) {
		if (userDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa người dùng thành công!");
		} else {
			ra.addFlashAttribute("msg1", "Lỗi sự cố mạng");
		}
		return "redirect:/admin/user";
	}
}
