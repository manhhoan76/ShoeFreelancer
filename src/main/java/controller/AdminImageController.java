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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ContactDao;
import dao.ImageDao;
import entity.Image;
import util.FilenameUtil;

@Controller
@RequestMapping(value = "admin")
public class AdminImageController {
	@Autowired
	private ImageDao imageDao;
	@Autowired
	private FilenameUtil filenameUtil;
	@Autowired
	private ContactDao contactDAO;

	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("listContactShow", contactDAO.getListContactNotRead());
		modelMap.addAttribute("numberContact", contactDAO.countNumberContact());
	}

	// ---------------DELETE---------------
	@SuppressWarnings("static-access")
	@ResponseBody
	@RequestMapping(value = "product/{id_product}/del-img/{id_image}", method = RequestMethod.POST)
	public String editCtrl(@PathVariable(value = "id_product") int id_product,
			@PathVariable(value = "id_image") int id_image, HttpServletRequest request) {

		Image objImage = imageDao.getItemById(id_image);

		// real path
		String appPath = request.getServletContext().getRealPath("files");
		String delfile = appPath + File.separator + objImage.getName();
		// delete file if exit
		File delPath = new File(delfile);
		if (delPath.exists()) {
			delPath.delete();
		}
		StringBuffer data = new StringBuffer("");
		// del image
		if (imageDao.delItem(id_image) > 0) {
			ArrayList<Image> listImage = (ArrayList<Image>) imageDao.getItems(id_product);
			for (Image image : listImage) {
				if (listImage.indexOf(image) % 3 == 0) {
					data.append("<div class=\"col-md-12 listImage\">");
				}
				data.append("<div class=\"col-md-4\">" + "				                        <div class=\"card\">"
						+ "				                            <div class=\"card-body\">"
						+ "												<a onclick=\"return delImage(" + image.getId()
						+ "," + image.getId_product() + ")\" href=\"javascript:void(0)\">"
						+ "													<small><span class=\"badge badge-danger float-right mt-1\"><i class = \"fa fa-remove\"></i></span></small>"
						+ "												</a>"
						+ "				                                <img style=\"width: 250px; height: 175px;\" class=\"card-img-top\" src=\""
						+ request.getContextPath() + "/files/" + image.getName() + "\" alt=\"" + image.getName() + "\">"
						+ "				                            </div>"
						+ "				                        </div>" + "				                    </div>");
				if (listImage.indexOf(image) % 3 == 2 || listImage.indexOf(image) == (listImage.size() - 1)) {
					data.append("</div>");
				}
			}

		} else {
			data.append("ERROR");
		}

		return data.toString();
	}

	// ---------------IMAGES ADD---------------
	@SuppressWarnings("static-access")
	@RequestMapping(value = "product/{id_product}/add-img", method = RequestMethod.POST)
	public String addCtrl(@PathVariable(value = "id_product") int id_product, RedirectAttributes ra,
			@RequestParam("image") CommonsMultipartFile[] cmf, HttpServletRequest request, HttpSession session) {

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
			try {
				file.transferTo(new File(filePath));
				imageDao.addItem(new Image(0, newFilename, id_product));
			} catch (IllegalStateException | IOException e) {
				System.out.println("Lổi mạng khi tải ảnh");
			}
		}

		return "redirect:/admin/product-edit/" + id_product;
	}

}
