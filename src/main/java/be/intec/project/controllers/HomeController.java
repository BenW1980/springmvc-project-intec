package be.intec.project.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import be.intec.project.entities.User;
import be.intec.project.services.DealService;
import be.intec.project.services.GameService;
import be.intec.project.services.MessageService;
import be.intec.project.services.PlatformService;
import be.intec.project.services.UserService;

@Controller
@SessionAttributes({ "currentUser", "platformsMenu", "dealCount", "messageCount" })
public class HomeController {

	@Autowired
	private PlatformService platformService;
	@Autowired
	private GameService gameService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private DealService dealService;
	@Autowired
	private UserService userService;

	public void initCountSession(Principal principal, Model model) {

		User user = userService.getUser(principal.getName());
		int countNewDeal = dealService.listNewDealsForUser(user).size();
		int countConfirmedDeal = dealService.listConfirmedDealsForUser(user).size();
		model.addAttribute("dealCount", countNewDeal + countConfirmedDeal);

	}

	public void messageCount(Principal principal, Model model) {

		User user = userService.getUser(principal.getName());
		int countNewMessages = messageService.listNewMessagesForReceiver(user).size();
		model.addAttribute("messageCount", countNewMessages);

	}

	public void getCurrentUser(Principal principal, Model model) {
		model.addAttribute("currentUser", principal.getName());
	}

	public void initialiseSession(Principal principal, Model model) {
		if (principal != null) {
			initCountSession(principal, model);
			messageCount(principal, model);
			getCurrentUser(principal, model);

		}
	}

	@RequestMapping(value = "/")
	public String home(Model model, Principal principal) {
		model.addAttribute("gameList", gameService.listGame());
		model.addAttribute("platformsMenu", platformService.listPlatform());

		initialiseSession(principal, model);

		return "user/welkom";
	}

}
