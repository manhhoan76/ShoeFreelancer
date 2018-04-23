package controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.UserDao;
import entity.User;
import util.StringUtil;

@Controller
@RequestMapping("login")
public class AdminLoginController {
	@Autowired
	private UserDao userDao;

	// ---------INDEX---------
	@RequestMapping(value = "")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("title", "Admin | Login");
		return "auth.login";
	}

	@RequestMapping(value = "forget-password")
	public String forgetPass(ModelMap modelMap, @RequestParam("username") String username, RedirectAttributes ra) {
		User user = userDao.getItemByUsername(username);
		if (user == null) {
			ra.addFlashAttribute("msg1", username + " không tồn tại trong hệ thống!");
			return "redirect:/login";
		}

		String saltString = getSaltString();
		String saltMd5 = StringUtil.md5(saltString);

		if (userDao.changePassByUsername(username, saltMd5) > 0) {
			if (sendMail("solutionweb188@gmail.com", "Hung1996", user.getEmail(), saltString) == 1) {
				ra.addFlashAttribute("msg", "Mật khẩu mới vừa được gửi đến email: " + user.getEmail());
			} else {
				ra.addFlashAttribute("msg1", "Lỗi sự cố mạng!");
			}
		} else {
			ra.addFlashAttribute("msg1", "Lỗi sự cố mạng!");
		}
		return "redirect:/login";
	}

	public int sendMail(final String emailFrom, final String passEmail, String emailTo, String newPass) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emailFrom, passEmail);
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(emailFrom));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
			message.setSubject("RESET PASSWORD");
			message.setContent(
					"Đây là mật khẩu mới của bạn: " + newPass + "\nHãy thay đổi mật khẩu sau khi đăng nhập thành công!"
							+ "\n\n Email đến từ hệ thống website," + "\n Vui lòng không trả lời email này!",
					"text/plain; charset=UTF-8");
			Transport.send(message);
			return 1;
		} catch (MessagingException e) {
			return 0;
		}
	}

	private String getSaltString() {
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		StringBuilder salt = new StringBuilder();
		Random rnd = new Random();
		while (salt.length() < 18) { // length of the random string.
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.charAt(index));
		}
		String saltStr = salt.toString();
		return saltStr;
	}
}
