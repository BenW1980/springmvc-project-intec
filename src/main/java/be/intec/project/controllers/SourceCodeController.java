package be.intec.project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SourceCodeController {
	
	

	@RequestMapping(value = "/code", method = RequestMethod.GET)
	public String sourceCode(Model model) {
		return "source";
	}

}
