/*
 * AdministratorRepository.java
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Administrator;

@Repository
public interface AdministratorRepository extends JpaRepository<Administrator, Integer> {

	//	//The average and the standard deviation of rendezvouses created per user.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Object dashboardRendezvousesByUser();
	//	
	//	//The ratio of users who have ever created a rendezvous versus the users who have never created any rendezvouses
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Object dashboardRendezvousesRatioCreation();
	//
	//	//The average and the standard deviation of users per rendezvous.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Object dashboardUsersPerRendezvous();
	//	
	//	//The average and the standard deviation of rendezvouses that are RSVPd per user.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Object dashboardRendezvousesRsvp();
	//	
	//	//The top-10 rendezvouses in terms of users who have RSVPd them.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Collection<Object> dashboardRendezvousesTop10();
	//	
	//	
	//	
	//	
	//	
	//	//The average and the standard deviation of announcements per rendezvous.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Object dashboardAnnouncementsRatio();
	//	
	//	//The rendezvouses that whose number of announcements is above 75% the average number of announcements per rendezvous.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Collection<Object> dashboardAnnouncementsAbove75();
	//	
	//	//The rendezvouses that are linked to a number of rendezvouses that is greater than the average plus 10%.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Collection<Object> dashboardRendezvousesLinked();
	//	
	//	
	//	
	//	
	//	//The average and the standard deviation of the number of questions per rendezvous.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Object dashboardQuestionsPerRendezvous();
	//	
	//	//The average and the standard deviation of the number of answers to the questions per rendezvous.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Object dashboardAnswersPerRendezvous();
	//	
	//	//The average and the standard deviation of replies per comment.
	//	@Query("select avg(u.myRendezvouses.size), "
	//			+ "sqrt((sum(u.myRendezvouses.size * u.myRendezvouses.size) / " + "count(u.myRendezvouses.size))-avg(u.myRendezvouses.size)*avg(u.myRendezvouses.size)) "
	//			+ "from User u")
	//	Object dashboardRepliesPerComment();
}
