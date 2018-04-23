package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

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

import dao.BannerDao;
import dao.ContactDao;
import entity.Banner;
import util.FilenameUtil;

@Controller
@RequestMapping(value = "admin")
public class AdminBannerController {
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private FilenameUtil filenameUtil;
	@Autowired
	private ContactDao contactDAO;

	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("listContactShow", contactDAO.getListContactNotRead());
		modelMap.addAttribute("numberContact", contactDAO.countNumberContact());
		modelMap.addAttribute("activeBN", "active");
	}

	/* INDEX */
	@RequestMapping(value = "banner")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("title", "Danh sách ảnh banner");
		modelMap.addAttribute("listBanner", bannerDao.getItems());
		return "admin.banner";
	}

	/* ADD */
	@RequestMapping(value = "banner-add")
	public String addShow(ModelMap modelMap) {
		modelMap.addAttribute("title", "Thêm ảnh banner");
		return "admin.banner.add";
	}

	@SuppressWarnings("static-access")
	@RequestMapping(value = "banner-add", method = RequestMethod.POST)
	public String addCtrl(RedirectAttributes ra, @RequestParam("image") CommonsMultipartFile cmf,
			HttpServletRequest request) {
		int count = 0;
		// real path
		String appPath = request.getServletContext().getRealPath("files");
		// create forlder for save file
		File dirappPath = new File(appPath);
		if (!dirappPath.exists()) {
			dirappPath.mkdir();
		}
		String filePath = "";
		String newFilename = "";
		// upload file enter server
		// for (CommonsMultipartFile file : cmf) {
		newFilename = filenameUtil.renameFile(cmf.getOriginalFilename());
		filePath = appPath + File.separator + newFilename;
		try {
			cmf.transferTo(new File(filePath));
			bannerDao.addItem(newFilename);
			count++;
		} catch (IllegalStateException | IOException e) {
			System.out.println("Lổi mạng khi tải ảnh");
			// }
		}
		if (count > 0) {
			ra.addFlashAttribute("msg", "Thêm ảnh thành công");
		} else {
			ra.addFlashAttribute("msg", "Lổi mạng khi thêm ảnh");
		}
		return "redirect:/admin/banner";
	}

	/* EDIT */
	@RequestMapping(value = "banner-edit/{id}")
	public String editShow(@PathVariable(value = "id") int id, ModelMap modelMap) {
		modelMap.addAttribute("banner", bannerDao.getItemByID(id));
		modelMap.addAttribute("title", "Sửa hình ảnh banner");
		return "admin.banner.edit";
	}

	@SuppressWarnings("static-access")
	@RequestMapping(value = "banner-edit", method = RequestMethod.POST)
	public String editCtrl(@ModelAttribute(value = "banner") Banner banner, RedirectAttributes ra,
			@RequestParam("image") CommonsMultipartFile image, HttpServletRequest request) {
		if (image.getOriginalFilename().isEmpty()) {
			banner.setPicture(bannerDao.getItemByID(banner.getId()).getPicture());
		} else {
			// real path
			String appPath = request.getServletContext().getRealPath("files");
			// create forlder for save file if not exist
			File dirappPath = new File(appPath);
			if (!dirappPath.exists()) {
				dirappPath.mkdir();
			}
			// delete old picture
			String oldFilename = bannerDao.getItemByID(banner.getId()).getPicture();
			File filePathOld = new File(appPath + File.separator + oldFilename);
			if (filePathOld.exists()) {
				filePathOld.delete();
			}
			// add new picture
			String newFilename = filenameUtil.renameFile(image.getOriginalFilename());
			String filePath = appPath + File.separator + newFilename;

			// upload file enter server
			try {
				image.transferTo(new File(filePath));
				banner.setPicture(newFilename);
			} catch (IllegalStateException | IOException e) {
				System.out.println("Lổi mạng khi tải ảnh");
			}
		}
		if (bannerDao.editItem(banner) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công");
		} else {
			ra.addFlashAttribute("msg1", "Lổi mạng khi sửa ảnh");
		}
		return "redirect:/admin/banner";
	}

	/* DELETE */
	@RequestMapping(value = "banner-del/{id}")
	public String deleteCtrl(@PathVariable(value = "id") int id, RedirectAttributes ra, HttpServletRequest request) {
		// real path
		String appPath = request.getServletContext().getRealPath("files");
		// create forlder for save file if not exist
		File dirappPath = new File(appPath);
		if (!dirappPath.exists()) {
			dirappPath.mkdir();
		}
		// delete picture
		String oldFilename = bannerDao.getItemByID(id).getPicture();
		File filePathOld = new File(appPath + File.separator + oldFilename);
		if (filePathOld.exists()) {
			filePathOld.delete();
		}

		if (bannerDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", "Xóa thành công");
		} else {
			ra.addFlashAttribute("msg1", "Lổi mạng khi xóa ảnh");
		}
		return "redirect:/admin/banner";
	}

}
