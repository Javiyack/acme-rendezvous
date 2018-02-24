/*
 * ProfileController.java
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers.user;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AnswerService;
import controllers.AbstractController;
import domain.Answer;

@Controller
@RequestMapping("/answer/user")
public class AnswerUserController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private AnswerService	answerService;


	// Creation ---------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int questionId, @RequestParam final int rendezvousId) {
		ModelAndView result;
		Answer answer;

		answer = this.answerService.create(questionId, rendezvousId);
		result = this.createEditModelAndView(answer);

		return result;
	}

	// Save --------------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Answer answer, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(answer);
		else
			try {
				this.answerService.save(answer);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(answer, "answer.commit.error");
			}

		return result;
	}

	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Answer answer) {
		ModelAndView result;

		result = this.createEditModelAndView(answer, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Answer answer, final String message) {
		ModelAndView result;

		result = new ModelAndView("answer/user/create");
		result.addObject("answer", answer);
		result.addObject("message", message);

		return result;
	}

}
