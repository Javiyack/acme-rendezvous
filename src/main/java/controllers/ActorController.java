
package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.AdministratorService;
import services.RendezvousService;
import services.UserService;
import domain.Actor;
import domain.Administrator;
import domain.Rendezvous;
import domain.User;

@Controller
@RequestMapping("/actor")
public class ActorController extends AbstractController {

	// Supporting services -----------------------------------------------------
	@Autowired
	ActorService			actorService;
	@Autowired
	UserService				userService;
	@Autowired
	RendezvousService		rendezvousService;
	@Autowired
	AdministratorService	administratorService;


	// Constructors -----------------------------------------------------------

	public ActorController() {
		super();
	}

	// list user ---------------------------------------------------------------		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		ModelAndView result;

		final Collection<Actor> actors = this.actorService.findAll();

		result = new ModelAndView("actor/list");
		result.addObject("actors", actors);
		result.addObject("requestUri", "actor/list.do");

		return result;
	}

	// list attendants ---------------------------------------------------------------		
	@RequestMapping(value = "/listAttendants", method = RequestMethod.GET)
	public ModelAndView listAttendants(@RequestParam final int rendezvousId) {

		ModelAndView result;

		final Collection<User> attendants = this.userService.findAttendantsByRendezvous(rendezvousId);

		result = new ModelAndView("actor/list");
		result.addObject("actors", attendants);
		result.addObject("requestUri", "actor/list.do");

		return result;
	}

	// Edition -----------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {
		final Actor actor = this.actorService.findByPrincipal();
		ModelAndView result;

		result = this.createEditModelAndView(actor);
		return result;
	}

	// SaveAdmin -----------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "saveAdmin")
	public ModelAndView saveAdmin(@Valid final Administrator admin, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(admin);
		else
			try {
				this.administratorService.save(admin);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable ooops) {
				result = this.createEditModelAndView(admin, "actor.commit.error");
			}
		return result;
	}

	// SaveUser -----------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "saveUser")
	public ModelAndView saveUser(@Valid final User user, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(user);
		else
			try {
				this.userService.save(user);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable ooops) {
				result = this.createEditModelAndView(user, "actor.commit.error");
			}
		return result;
	}

	// Display actor -----------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int actorId) {
		final ModelAndView result;
		final User actor;
		final Collection<Rendezvous> rendezvouses;

		actor = (User) this.actorService.findOne(actorId);

		rendezvouses = this.rendezvousService.findReservedByUser(actor.getId());

		result = new ModelAndView("actor/display");

		result.addObject("actor", actor);
		result.addObject("rendezvouses", rendezvouses);
		;

		return result;
	}

	// Ancillary Methods -----------------------------------------------------------
	protected ModelAndView createEditModelAndView(final Actor actor) {
		assert actor != null;
		ModelAndView result;

		result = this.createEditModelAndView(actor, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Actor actor, final String message) {
		ModelAndView result;
		assert actor != null;
		String actorType = "";

		result = new ModelAndView("actor/edit");

		if (actor.getClass().equals(Administrator.class)) {
			final Administrator administrator = (Administrator) actor;
			actorType = "administrator";
			result.addObject(actorType, administrator);
			result.addObject("actorType", actorType);
		} else if (actor.getClass().equals(User.class)) {
			final User user = (User) actor;
			actorType = "user";
			result.addObject(actorType, user);
			result.addObject("actorType", actorType);
		}

		result.addObject("message", message);

		return result;
	}

}
