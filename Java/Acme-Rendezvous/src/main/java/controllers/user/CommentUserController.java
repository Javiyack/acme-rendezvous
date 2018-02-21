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

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import controllers.AbstractController;
import domain.Comment;
import domain.Rendezvous;
import services.CommentService;
import services.RendezvousService;

@Controller
@RequestMapping("/comment/user")
public class CommentUserController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private CommentService commentService;
	@Autowired
	private RendezvousService rendezvousService;

	// Listing ----------------------------------------------------------------

	@RequestMapping("/list")
	public ModelAndView action1() {
		ModelAndView result;
		Collection<Comment> comments;

		comments = this.commentService.findAll();
		result = new ModelAndView("comment/user/list");
		result.addObject("requestURI", "comment/user/list.do");
		result.addObject("comments", comments);

		return result;
	}

	// Creation ---------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Comment comment;

		comment = this.commentService.create();
		result = this.createEditModelAndView(comment);

		result.addObject("requestURI", "comment/user/edit.do");

		return result;
	}
	
	
	// Save --------------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Comment comment, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(comment);
		else
			try {
				this.commentService.save(comment);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(comment, "msg.commit.error");
			}

		return result;
	}

	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Comment comment) {
		ModelAndView result;

		result = this.createEditModelAndView(comment, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Comment comment, final String message) {
		ModelAndView result;
		Rendezvous rendezvous = comment.getRendezvous();

		if (comment.getId() == 0) {
			result = new ModelAndView("administrator/comment/create");
			result.addObject("note", comment);
			result.addObject("rendezvouses", rendezvousService.findAll());

		} else {
			result = new ModelAndView("administrator/comment/edit");
			result.addObject("comment", comment);
			result.addObject("rendezvous", rendezvous);
			result.addObject("moment", comment.getMoment());
			result.addObject("rendezvousId", rendezvous.getId());
			result.addObject("message", message);

		}

		return result;
	}

}
