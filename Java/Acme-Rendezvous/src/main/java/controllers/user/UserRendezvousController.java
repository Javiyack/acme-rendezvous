
package controllers.user;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.RendezvousService;
import services.UserService;
import controllers.AbstractController;
import domain.Rendezvous;
import domain.User;

@Controller
@RequestMapping("/user/rendezvous")
public class UserRendezvousController extends AbstractController {

	// Supporting services -----------------------------------------------------
	@Autowired
	UserService			userService;
	@Autowired
	RendezvousService	rendezvousService;


	// Constructors -----------------------------------------------------------

	public UserRendezvousController() {
		super();
	}

	// list user ---------------------------------------------------------------		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		ModelAndView result;
		final User user = this.userService.findByPrincipal();

		final Collection<Rendezvous> rendezvouses = this.rendezvousService.findReservedByUser(user.getId());

		result = new ModelAndView("user/rendezvous/list");
		result.addObject("rendezvouses", rendezvouses);
		result.addObject("requestUri", "user/rendezvous/list.do");

		return result;
	}
}
