
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.Rendezvous;
import domain.Reservation;
import domain.User;
import services.RendezvousService;
import services.ReservationService;
import services.UserService;

@Controller
@RequestMapping("/rendezvous")
public class RendezvousController {

	public RendezvousController() {
		super();
	}


	//Services ---------------------------------------------------------------

	@Autowired
	private RendezvousService	rendezvousService;
	
	
	@Autowired
	private UserService userService;


	//List ---------------------------------------------------------------		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		ModelAndView result;
		
		final Collection<Rendezvous> rendezvouses = this.rendezvousService.findAll();
		User principal;
		principal = this.userService.findByPrincipal();
		Collection<Rendezvous> reserved = this.rendezvousService.findReservedByUser(principal.getId());
		result = new ModelAndView("rendezvous/list");
		result.addObject("rendezvouses", rendezvouses);
		result.addObject("requestUri", "rendezvous/list.do");
		result.addObject("reserved",reserved);

		return result;
	}

}
