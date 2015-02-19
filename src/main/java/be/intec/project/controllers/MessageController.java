package be.intec.project.controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.ConstraintViolationException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import be.intec.project.entities.Message;
import be.intec.project.entities.User;
import be.intec.project.services.GameService;
import be.intec.project.services.MessageService;
import be.intec.project.services.PlatformService;
import be.intec.project.services.UserService;

@RequestMapping("/messages")
@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;
	@Autowired
	private UserService userService;
	@Autowired
	private PlatformService platformService;
	@Autowired
	private GameService gameService;
	@Autowired
	private HomeController hc;

	private User originalReceiver;

	private Message originalMessage;

	private SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");

	@RequestMapping(value = "/send", method = RequestMethod.GET, params = "username")
	public String messageForm(Model model, Principal principal, @RequestParam String username) {

		originalReceiver = userService.getUser(username);

		model.addAttribute("message", new Message());
		hc.initialiseSession(principal, model);
		return "messages/messageform";

	}

	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public String messageSubmit(Model model, Principal principal, @ModelAttribute("message") @Valid Message message,
			BindingResult result) {

		User sender = userService.getUser(principal.getName());

		if (!result.hasErrors()) {

			message.setSender(sender);
			message.setReceiver(originalReceiver);
			message.setReadBySender(true);
			message.setReadByReceiver(false);
			message.setFirstMessageInThread(true);
			message.setDate(df.format(new Date()));

			messageService.addMessage(message);

			message.setThreadid(message.getId());

			messageService.update(message);
			hc.initialiseSession(principal, model);
			return "redirect:/messages/inbox";
		}
		hc.initialiseSession(principal, model);
		return "messages/messageform";

	}

	@RequestMapping(value = "/inbox", method = RequestMethod.GET)
	public String yourMessageSubjects(Principal principal, Model model) {

		User user = userService.getUser(principal.getName());
		hc.initialiseSession(principal, model);

		model.addAttribute("yourThreads", messageService.listThreadSubjects(user));

		return "messages/yoursubjects";

	}

	@RequestMapping(value = "/read", method = RequestMethod.GET, params = "id")
	public String yourMessages(Principal principal, Model model, @RequestParam Long id) {

		User user = new User();
		user.setUsername(principal.getName());

		model.addAttribute("message", new Message());

		originalMessage = messageService.getMessage(id);

		Long threadid = originalMessage.getId();

		model.addAttribute("originalMessage", originalMessage);

		List<Message> newMessagesInThread = messageService.listNewMessagesInThread(user, threadid);
		List<Message> oldMessagesInThread = messageService.listOldMessagesInThread(user, threadid);

		model.addAttribute("newMessagesInThread", newMessagesInThread);
		model.addAttribute("oldMessagesInThread", oldMessagesInThread);

		for (Message message : newMessagesInThread) {
			hc.initCountSession(principal, model);
			if (message.getReceiver().getUsername().equals(principal.getName())) {
				message.setReadByReceiver(true);
			} else if (message.getSender().getUsername().equals(principal.getName())) {
				message.setReadBySender(true);

			}

			messageService.update(message);
		}

		hc.initialiseSession(principal, model);
		return "messages/yourmessages";

	}

	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public String replyMessage(Principal principal, Model model, @ModelAttribute("message") @Valid Message message,
			BindingResult result) {

		User currentUser = new User();
		currentUser.setUsername(principal.getName());

		User receiver = new User();
		receiver.setUsername(originalMessage.getReceiver().getUsername());

		if (receiver.getUsername().equals(currentUser.getUsername())) {
			receiver.setUsername(originalMessage.getSender().getUsername());
		}

		try {

			message.setSender(currentUser);
			message.setReceiver(receiver);
			message.setSubject(originalMessage.getSubject());
			message.setThreadid(originalMessage.getThreadid());
			message.setReadBySender(true);
			message.setReadByReceiver(false);
			message.setFirstMessageInThread(false);
			message.setDate(df.format(new Date()));
			messageService.addMessage(message);

		} catch (ConstraintViolationException e) {

			model.addAttribute("originalMessage", originalMessage);
			model.addAttribute("newMessagesInThread",
					messageService.listNewMessagesInThread(currentUser, message.getThreadid()));
			model.addAttribute("oldMessagesInThread",
					messageService.listOldMessagesInThread(currentUser, message.getThreadid()));

			hc.initialiseSession(principal, model);
			return "messages/yourmessages";
		}
		model.addAttribute("messagesInThread", messageService.listThreads(message.getThreadid()));
		model.addAttribute("originalMessage", originalMessage);
		hc.initialiseSession(principal, model);
		return "redirect:/messages/read?id=" + originalMessage.getId();

	}
}
