
package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.UserService;
import domain.User;

@Controller
@RequestMapping("/user")
public class UserController extends AbstractController {

	// Supporting services -----------------------------------------------------
	@Autowired
	UserService	userService;


	// Constructors -----------------------------------------------------------

	public UserController() {
		super();
	}

	// Create user ---------------------------------------------------------------	
	@RequestMapping("/create")
	public ModelAndView create() {
		ModelAndView result;
		final User user = this.userService.create();

		result = this.createEditModelAndView(user);

		return result;
	}

	// Create user ---------------------------------------------------------------	
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final User user, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(user);
		else
			try {
				this.userService.save(user);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(user, "user.commit.error");
			}
		return result;
	}

	// Auxiliary methods ---------------------------------------------------------------
	protected ModelAndView createEditModelAndView(final User user) {
		final ModelAndView result;
		result = this.createEditModelAndView(user, null);
		return result;
	}
	protected ModelAndView createEditModelAndView(final User user, final String message) {
		final ModelAndView result;

		result = new ModelAndView("user/create");
		result.addObject("user", user);
		result.addObject("message", message);

		return result;
	}

}
