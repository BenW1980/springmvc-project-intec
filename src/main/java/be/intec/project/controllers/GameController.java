package be.intec.project.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import be.intec.project.entities.Deal;
import be.intec.project.entities.Game;
import be.intec.project.entities.User;
import be.intec.project.services.DealService;
import be.intec.project.services.GameService;
import be.intec.project.services.MessageService;
import be.intec.project.services.PlatformService;
import be.intec.project.services.UserService;

@Controller
public class GameController {

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
	@Autowired
	private HomeController hc;

	@RequestMapping(value = "/games/addgame", method = RequestMethod.GET)
	public String addGameForm(Principal principal, Model model) {

		model.addAttribute("game", new Game());
		hc.initialiseSession(principal, model);
		model.addAttribute("platformList", platformService.listPlatform());
		model.addAttribute("gameList", gameService.listGame(principal.getName()));

		return "user/addgame";
	}

	@RequestMapping(value = "/games/addgame", method = RequestMethod.POST)
	public String addGameSubmit(@ModelAttribute("game") @Valid Game game, BindingResult result, Principal principal,
			Model model) {

		hc.initialiseSession(principal, model);

		if (!result.hasErrors()) {

			User user = userService.getUser(principal.getName());

			game.setUser(user);

			gameService.addGame(game);

			return "redirect:/games/addgame";
		}

		model.addAttribute("platformList", platformService.listPlatform());
		model.addAttribute("gameList", gameService.listGame(principal.getName()));
		return "user/addgame";
	}

	@RequestMapping(value = "/games/yourgames", method = RequestMethod.GET)
	public String viewUserGames(Principal principal, Model model) {

		model.addAttribute("gameList", gameService.listGame(principal.getName()));
		hc.initialiseSession(principal, model);
		return "user/yourgames";
	}

	@RequestMapping(value = "/games/yourgames", method = RequestMethod.POST, params = "id")
	public String deleteUserGames(@RequestParam Long id, Model model, Principal principal) {

		List<Deal> senderGamesInDeal = dealService.findAllSenderGamesInDeals(id);
		List<Deal> receiverGamesInDeal = dealService.findAllReceiverGamesInDeals(id);
		hc.initialiseSession(principal, model);

		if (senderGamesInDeal.isEmpty() && receiverGamesInDeal.isEmpty()) {

			gameService.removeGame(id);
			return "redirect:/games/yourgames";
		}

		model.addAttribute("error",
				"Deze game maakt deel uit van een actieve deal en kan daarom nog niet worden verwijderd.");
		return "redirect:/games/yourgames";

	}

	@RequestMapping(value = "/games/platform", method = RequestMethod.GET, params = "platformName")
	public String gamesPerPlatform(@RequestParam String platformName, Model model, Principal principal) {

		model.addAttribute("gameListPerPlatform", gameService.listGamePerPlatform(platformName));
		hc.initialiseSession(principal, model);

		return "user/gamesperplatform";
	}

}
