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

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Rendezvous;

@Repository
public interface RendezvousRepository extends JpaRepository<Rendezvous, Integer> {

	@Query("select r from Rendezvous r where r.user.id = ?1")
	Collection<Rendezvous> findCreatedByUserId(int userId);

	@Query("select rendezvous from Reservation r join r.rendezvous rendezvous where r.user.id = ?1")
	Collection<Rendezvous> findReservedByUserId(int userId);

}
