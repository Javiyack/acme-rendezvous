
package controllers.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import services.AdministratorService;
import controllers.AbstractController;

@Controller
@RequestMapping("/dashboard/administrator")
public class DashboardAdministratorController extends AbstractController {

	@Autowired
	AdministratorService	administratorService;


	// Constructors -----------------------------------------------------------

	public DashboardAdministratorController() {
		super();
	}

	//	@RequestMapping(value = "/display", method = RequestMethod.GET)
	//	public ModelAndView display() {
	//		ModelAndView result;
	//
	//		result = new ModelAndView("dashboard/display");
	//
	//		final Object statistics1 = this.administratorService.dashboardRendezvousesByUser();
	//		result.addObject("dashboard.rendezvouses.by.user", statistics1);
	//
	//		final Object statistics2 = this.administratorService.dashboardRendezvousesRatioCreation();
	//		result.addObject("dashboard.rendezvouses.ratio.creation", statistics2);
	//
	//		final Object statistics3 = this.administratorService.dashboardUsersPerRendezvous();
	//		result.addObject("dashboard.users.per.rendezvous", statistics3);
	//
	//		final Object statistics4 = this.administratorService.dashboardRendezvousesRsvp();
	//		result.addObject("dashboard.rendezvouses.rsvp", statistics4);
	//
	//		final Collection<Object> statistics5 = this.administratorService.dashboardRendezvousesTop10();
	//		result.addObject("dashboard.rendezvouses.top10", statistics5);
	//
	//		final Object statistics6 = this.administratorService.dashboardAnnouncementsRatio();
	//		result.addObject("dashboard.announcements.ratio", statistics6);
	//
	//		final Collection<Object> statistics7 = this.administratorService.dashboardAnnouncementsAbove75();
	//		result.addObject("dashboard.announcements.above.75", statistics7);
	//
	//		final Collection<Object> statistics8 = this.administratorService.dashboardRendezvousesLinked();
	//		result.addObject("dashboard.rendezvouses.linked", statistics8);
	//
	//		final Object statistics9 = this.administratorService.dashboardQuestionsPerRendezvous();
	//		result.addObject("dashboard.questions.rendezvous", statistics9);
	//
	//		final Object statistics10 = this.administratorService.dashboardAnswersPerRendezvous();
	//		result.addObject("dashboard.answers.rendezvous", statistics10);
	//
	//		final Object statistics11 = this.administratorService.dashboardRepliesPerComment();
	//		result.addObject("dashboard.replies.comment", statistics11);
	//
	//		return result;

	//}

}
