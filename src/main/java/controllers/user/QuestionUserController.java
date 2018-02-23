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

import services.QuestionService;
import services.RendezvousService;
import controllers.AbstractController;
import domain.Question;

@Controller
@RequestMapping("/question/user")
public class QuestionUserController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private QuestionService		questionService;
	@Autowired
	private RendezvousService	rendezvousService;


	// Creation ---------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int rendezvousId) {
		ModelAndView result;
		Question question;

		question = this.questionService.create(rendezvousId);
		result = this.createEditModelAndView(question);

		return result;
	}

	// Save --------------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Question question, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(question);
		else
			try {
				this.questionService.save(question);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(question, "question.commit.error");
			}

		return result;
	}

	// Auxiliary methods ---------------------------------------------------------------
	protected ModelAndView createEditModelAndView(final Question question) {
		final ModelAndView result;
		result = this.createEditModelAndView(question, null);
		return result;
	}
	protected ModelAndView createEditModelAndView(final Question question, final String message) {
		final ModelAndView result;

		result = new ModelAndView("question/user/create");
		result.addObject("question", question);
		result.addObject("message", message);

		return result;
	}

}
