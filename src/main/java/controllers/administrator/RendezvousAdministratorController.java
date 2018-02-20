
package controllers.administrator;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.RendezvousService;
import domain.Rendezvous;

@Controller
@RequestMapping("/rendezvous/administrator")
public class RendezvousAdministratorController {

	public RendezvousAdministratorController() {
		super();
	}


	//Services

	@Autowired
	private RendezvousService	rendezvousService;


	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(@Valid final Rendezvous rendezvous, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(rendezvous);
		else
			try {
				this.rendezvousService.delete(rendezvous);
				result = new ModelAndView("redirect:../list.do");
			} catch (final Throwable ooops) {
				result = this.createEditModelAndView(rendezvous, "rendezvous.commit.error");
			}
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
		result = new ModelAndView("rendezvous/user/create");
		result.addObject("rendezvous", rendezvous);
		result.addObject("message", message);

		return result;
	}
}
