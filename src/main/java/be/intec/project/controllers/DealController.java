package be.intec.project.controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import be.intec.project.entities.CompletedDeal;
import be.intec.project.entities.Deal;
import be.intec.project.entities.User;
import be.intec.project.services.CompletedDealService;
import be.intec.project.services.DealService;
import be.intec.project.services.GameService;
import be.intec.project.services.PlatformService;
import be.intec.project.services.UserService;

@Controller
public class DealController {

	@Autowired
	private GameService gameService;
	@Autowired
	private PlatformService platformService;
	@Autowired
	private DealService dealService;
	@Autowired
	private UserService userService;
	@Autowired
	private CompletedDealService completedDealService;
	@Autowired
	private HomeController hc;

	private User receiver;

	private SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");

	@RequestMapping(value = "/games/user", method = RequestMethod.GET, params = "username")
	public String newDealForm(Principal principal, @RequestParam String username, Model model) {

		if (!model.containsAttribute("deal")) {
			model.addAttribute("deal", new Deal());
		}

		if (username.equals(principal.getName())) {
			return "redirect:/games/yourgames";
		}

		receiver = userService.getUser(username);

		User sender = userService.getUser(principal.getName());

		model.addAttribute("dealsByYou", dealService.listMadeDeals(sender));
		model.addAttribute("theirGameList", gameService.listGame(username));
		model.addAttribute("yourGameList", gameService.listGame(principal.getName()));
		hc.initialiseSession(principal, model);

		return "user/gamesperuser";

	}

	@RequestMapping(value = "/games/user", method = RequestMethod.POST)
	public String newDealSubmit(@ModelAttribute("deal") @Valid Deal deal, BindingResult result, Principal principal,
			Model model, RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {

			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.deal", result);
			redirectAttributes.addFlashAttribute("deal", deal);
			return "redirect:/games/user?username=" + receiver.getUsername();
		}

		User sender = userService.getUser(principal.getName());

		model.addAttribute("theirGameList", gameService.listGame(receiver.getUsername()));
		model.addAttribute("yourGameList", gameService.listGame(principal.getName()));

		deal.setReceiver(receiver);
		deal.setSender(sender);
		deal.setUnread(true);
		deal.setActionTaken(false);
		deal.setConfirmedDealViewed(false);
		deal.setStatus("Te behandelen");
		deal.setDate(df.format(new Date()));

		if (deal.getMessage().trim().length() == 0) {
			deal.setMessage("-");
		}

		dealService.addDeal(deal);
		hc.initialiseSession(principal, model);
		return "redirect:/games/user?username=" + receiver.getUsername();

	}

	@RequestMapping(value = "/yourdeals", method = RequestMethod.GET)
	public String yourDeals(Principal principal, Model model) {

		if (!model.containsAttribute("deal")) {
			model.addAttribute("deal", new Deal());
		}

		User user = userService.getUser(principal.getName());

		hc.initCountSession(principal, model);

		model.addAttribute("allDeals", dealService.listAllDealsForUser(user));
		model.addAttribute("newDeals", dealService.listNewDealsForUser(user));
		model.addAttribute("doneDeals", completedDealService.listDoneDealsForUser(user));
		model.addAttribute("madeDeals", dealService.listMadeDeals(user));
		model.addAttribute("confirmedDeals", dealService.listConfirmedDealsForUser(user));
		model.addAttribute("doneDealsNotYetConfirmed", dealService.listAllDoneDealsNotYetConfirmed(user));

		return "deals/yourdeals";

	}

	@RequestMapping(value = "/yourdeals", method = RequestMethod.POST)
	public String acceptDeal(@ModelAttribute("deal") Deal deal, Model model,
			@RequestParam(required = false, value = "action") String action,
			@RequestParam(required = false, value = "dealid") Long dealid, BindingResult result,
			RedirectAttributes redirectAttributes, Principal principal) {

		User sender = userService.getUser(principal.getName());

		model.addAttribute("newDeals", dealService.listNewDealsForUser(receiver));

		model.addAttribute("confirmedDeals", dealService.listConfirmedDealsForUser(sender));

		hc.initialiseSession(principal, model);

		if (dealid != null && action.equals("Markeer als voltooid")) {

			deal = dealService.getDeal(dealid);
			deal.setConfirmedDealViewed(true);

			completedDealService.addCompletedDeal(new CompletedDeal(deal));

			dealService.removeDeal(dealid);
			hc.initialiseSession(principal, model);
			return "redirect:/yourdeals";
		}

		if (dealid != null && action.equals("Accepteer aanbod")) {

			deal = dealService.getDeal(dealid);
			deal.setUnread(false);
			deal.setStatus("Aangenomen");
			deal.setActionTaken(true);
			deal.setConfirmedDealViewed(false);
			dealService.update(deal);
			hc.initialiseSession(principal, model);
			return "redirect:/yourdeals";
		}

		if (dealid != null && action.equals("Weiger aanbod")) {

			deal = dealService.getDeal(dealid);
			deal.setUnread(false);
			deal.setStatus("Geweigerd");
			deal.setActionTaken(true);
			deal.setConfirmedDealViewed(true);

			completedDealService.addCompletedDeal(new CompletedDeal(deal));

			dealService.removeDeal(dealid);
			hc.initialiseSession(principal, model);
			return "redirect:/yourdeals";

		}
		result.rejectValue("dealid", "dealid.notnull");
		redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.deal", result);
		redirectAttributes.addFlashAttribute("deal", deal);
		hc.initialiseSession(principal, model);
		return "redirect:/yourdeals";

	}
}
