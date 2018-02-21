/*
 * ProfileController.java
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import controllers.AbstractController;
import domain.Comment;
import domain.Rendezvous;
import services.CommentService;
import services.RendezvousService;

@Controller
@RequestMapping("/comment")
public class CommentController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private CommentService			commetService;
	@Autowired
	private RendezvousService		rendezvousService;
	


	
	// Listing ----------------------------------------------------------------

	@RequestMapping("/list")
	public ModelAndView action1() {
		ModelAndView result;
		Collection<Comment> comments;
		
		comments = this.commetService.findAll();
		result = new ModelAndView("comment/list");
		result.addObject("requestURI", "comment/list.do");
		result.addObject("comments", comments);

		return result;
	}

	
	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Comment commet) {
		ModelAndView result;

		result = this.createEditModelAndView(commet, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Comment comment, final String message) {
		ModelAndView result;
		Rendezvous rendezvous = comment.getRendezvous();
				
		if(comment.getId()== 0){
			result = new ModelAndView("auditor/note/create");
			result.addObject("note", comment);			
			result.addObject("trips", rendezvousService.findAll());
			
		}else{
			result = new ModelAndView("auditor/note/edit");
			result.addObject("note", comment);		
			
			result.addObject("trip", rendezvous);
			result.addObject("moment", comment.getMoment());
			result.addObject("tripId",rendezvous.getId());
			result.addObject("message", message);
			
		}
			

		return result;
	}


}
