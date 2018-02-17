/*
 * AnnouncementRepository.java
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package repositories;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Rendezvous;
import domain.User;

@Repository
public interface RendezvousRepository extends JpaRepository<Rendezvous, Integer> {

	@Query("select r from Rendezvous r where r.startingDate > ?1")
	Collection<Rendezvous> findAllActive(Date currentMoment);

	@Query("select r from Rendezvous r where r.endingDate < ?1")
	Collection<Rendezvous> findAllOver(Date currentMoment);

	@Query("select r from Rendezvous r where r.manager.id = ?1")
	Collection<Rendezvous> findByUserId(int userId);

	@Query("select r from Rendezvous r where r.id = ?1")
	Rendezvous findOne(int id);

	//10.2
	@Query("select r from Rendezvous r")
	Collection<Rendezvous> findAllTrips();

	//10.3
	@Query("select r from Rendezvous r where r.ticker like %?1% or r.title  like %?1% or r.description like %?1%")
	Collection<Rendezvous> findByKeyWord(String keyWord);

	//	@Rendezvousy("select t from Trip t where t.ticker = ?1")
	//	List<Trip> findByTicker(String tiker);
	//
	//	@Query("select t from Trip t where t.title = ?1")
	//	List<Trip> findByTitle(String title);
	//
	//	@Query("select t from Trip t where t.description = ?1")
	//	List<Trip> findByDescription(String description);

	//10.4
	@Query("select t from Trip t where t.category.id = ?1")
	Collection<Rendezvous> findByCategory(int category);

	@Query("select t from Rendezvous t where t.manager = ?1")
	Collection<Rendezvous> findByManager(User manager);

	//30.1
	@Query("select t from Rendezvous t where t.ranger = ?1")
	Collection<Rendezvous> findByRanger(User ranger);

	//30.2 TODO
	//@Query("select t from Trip t where t.auditRecords = ?1")
	//Collection<Trip> findByAuditRecord(AuditRecord auditRecord);

//	@Query("select avg(t.requests.size), min(t.requests.size), max(t.requests.size), " + "sqrt(sum(t.requests.size * t.requests.size) /count(t.requests.size) - (avg(t.requests.size) * avg(t.requests.size))) from Trip t")
//	String tripStatistics();

	@Query("select avg(t.price),min(t.price),max(t.price),sqrt(sum(t.price *t.price) / count(t.price) - (avg(t.price) * avg(t.price))) from Trip t")
	String priceStatistics();

	@Query("Select count(t) from Trip t")
	String getCount();

	@Query("select count(tr) from Trip tr where tr.cancelled =TRUE")
	String getCancelled();

	//@Query("select t from Trip t group by t having t.requests.size > avg(t.requests.size) order by t.requests.size")
	//Collection<Trip> getMostAppliedTrips();
}
