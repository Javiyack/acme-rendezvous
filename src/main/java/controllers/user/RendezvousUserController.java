package controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.Rendezvous;
import services.RendezvousService;

@Controller
@RequestMapping("/rendezvous/user")
public class RendezvousUserController {
	
	
	public RendezvousUserController() {
		super();
	}
	
	//Services
	
	@Autowired 
	private RendezvousService rendezvousService;
	
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Rendezvous rendezvous;
		rendezvous = rendezvousService.create();
		result = this.createEditModelAndView(rendezvous);
		return result;
	}
	
	
	
	// Auxiliary methods ---------------------------------------------------------------
		protected ModelAndView createEditModelAndView(final Rendezvous rendezvous) {
			final ModelAndView result;
			result = this.createEditModelAndView(rendezvous, null);
			return result;
		}
		protected ModelAndView createEditModelAndView(final Rendezvous rendezvous, final String message) {
			final ModelAndView result;

			result = new ModelAndView("rendezvous/create");
			result.addObject("rendezvous", rendezvous);
			result.addObject("message", message);

			return result;
		}

}
