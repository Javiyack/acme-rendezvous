
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

import services.RendezvousService;
import services.ReservationService;
import services.UserService;
import domain.Rendezvous;
import domain.Reservation;
import domain.User;

@Controller
@RequestMapping("/rendezvous/user")
public class RendezvousUserController {

	public RendezvousUserController() {
		super();
	}


	// Services ---------------------------------------------------------------

	@Autowired
	private RendezvousService	rendezvousService;

	@Autowired
	private UserService			userService;

	@Autowired
	private ReservationService	reservationService;


	// List ---------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		ModelAndView result;
		final User user = this.userService.findByPrincipal();

		final Collection<Rendezvous> rendezvouses = this.rendezvousService.findCreatedByUser(user.getId());

		result = new ModelAndView("rendezvous/user/list");
		result.addObject("rendezvouses", rendezvouses);
		result.addObject("requestUri", "rendezvous/user/list.do");
		result.addObject("user", user);

		return result;
	}
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public ModelAndView listAll() {

		ModelAndView result;

		final Collection<Rendezvous> rendezvouses = this.rendezvousService.findAll();
		final User user;
		user = this.userService.findByPrincipal();
		final Collection<Rendezvous> reserved = this.rendezvousService.findReservedAndNotCanceledByUserId(user.getId());
		result = new ModelAndView("rendezvous/list");
		result.addObject("rendezvouses", rendezvouses);
		result.addObject("requestUri", "rendezvous/user/listAll.do");
		result.addObject("reserved", reserved);
		result.addObject("user", user);

		return result;
	}

	// Create ---------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Rendezvous rendezvous;
		rendezvous = this.rendezvousService.create();

		result = this.createEditModelAndView(rendezvous);
		return result;
	}

	// Edit ---------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int rendezvousId) {
		ModelAndView result;
		Rendezvous rendezvous;
		rendezvous = this.rendezvousService.findOneToEdit(rendezvousId);

		result = new ModelAndView("rendezvous/user/edit");
		result.addObject("rendezvous", rendezvous);

		return result;
	}

	// Save ---------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Rendezvous rendezvous, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(rendezvous);
		else
			try {
				this.rendezvousService.save(rendezvous);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable ooops) {
				result = this.createEditModelAndView(rendezvous, "rendezvous.commit.error");
			}
		return result;
	}

	// Delete ---------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(@Valid final Rendezvous rendezvous, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(rendezvous);
		else
			try {
				this.rendezvousService.deleteByUser(rendezvous);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable ooops) {
				result = this.createEditModelAndView(rendezvous, "rendezvous.commit.error");
			}
		return result;
	}

	// Reserve

	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public ModelAndView reserve(@RequestParam final int rendezvousId) {

		ModelAndView result;

		Rendezvous rendezvous;
		rendezvous = this.rendezvousService.findOne(rendezvousId);
		Assert.notNull(rendezvous);

		Reservation reservation;
		reservation = this.reservationService.create();
		Assert.notNull(reservation);

		Reservation done;
		done = this.rendezvousService.reserveRendezvous(reservation, rendezvous);
		Assert.notNull(done);

		this.reservationService.save(done);

		result = new ModelAndView("redirect:/");

		return result;
	}

	// Cancel

	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public ModelAndView cancel(@RequestParam final int rendezvousId) {
		ModelAndView result;

		Rendezvous rendezvous;
		rendezvous = this.rendezvousService.findOne(rendezvousId);
		Assert.notNull(rendezvous);

		User user;
		user = this.userService.findByPrincipal();
		Assert.notNull(user);

		Reservation reservation;
		reservation = this.reservationService.findReservationByUserAndRendezvous(user, rendezvous);

		final Reservation canceled = this.rendezvousService.cancelRendezvous(reservation);
		this.reservationService.save(canceled);

		result = new ModelAndView("redirect:/");

		return result;
	}

	// Auxiliary methods
	// ---------------------------------------------------------------
	protected ModelAndView createEditModelAndView(final Rendezvous rendezvous) {
		final ModelAndView result;
		result = this.createEditModelAndView(rendezvous, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Rendezvous rendezvous, final String message) {
		final ModelAndView result;
		result = new ModelAndView("rendezvous/user/create");
		result.addObject("rendezvous", rendezvous);
		result.addObject("message", message);

		return result;
	}

}
