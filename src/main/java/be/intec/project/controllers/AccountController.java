package be.intec.project.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import be.intec.project.entities.Authority;
import be.intec.project.entities.User;
import be.intec.project.exceptions.EmailExistsException;
import be.intec.project.exceptions.UserExistsException;
import be.intec.project.services.AuthorityService;
import be.intec.project.services.MailService;
import be.intec.project.services.UserService;

@Controller
@RequestMapping("/user")
public class AccountController {
	
	//

	@Autowired
	private UserService userService;
	@Autowired
	private AuthorityService authorityService;
	@Autowired
	private MailService mailService;

	private ShaPasswordEncoder encoder = new ShaPasswordEncoder();

	private SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");

	@RequestMapping(value = "/nieuwaccount", method = RequestMethod.GET)
	public String createAccountForm(Model model) {

		model.addAttribute("user", new User());
		return "nieuwaccount";
	}

	@RequestMapping(value = "/nieuwaccount", method = RequestMethod.POST)
	public String createAccount(@ModelAttribute("user") @Valid User user, BindingResult bindingResult) {

		if (!user.getPassword().equals(user.getConfirmPassword())) {
			bindingResult.rejectValue("confirmPassword", "ConfirmPasswordFail.user.confirmPassword");
		}

		if (!bindingResult.hasErrors()) {

			user.setPassword(encoder.encodePassword(user.getPassword(), user.getUsername()));
			user.setEnabled(true);
			user.setRegDate(df.format(new Date()));

			try {
				mailService.addMail(user.getMail());
			} catch (EmailExistsException e) {
				bindingResult.rejectValue("mail.mail", "EmailExists.mail.mail");
				return "nieuwaccount";
			}

			user.setMail(user.getMail());

			try {
				userService.addUser(user);
			} catch (UserExistsException e) {
				bindingResult.rejectValue("username", "UserExists.user.username");
				mailService.removeMail(user.getMail().getMail());
				return "nieuwaccount";
			}

			Authority authority = new Authority();
			authority.setUser(user);
			authority.setAuthority("user");
			authorityService.addAuthority(authority);

			return "login";

		}
		return "nieuwaccount";
	}
}
