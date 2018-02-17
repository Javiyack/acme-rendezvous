/*
 * TripService.java
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.RendezvousRepository;
import domain.User;
import domain.Rendezvous;

@Service
@Transactional
public class RendezvousService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private RendezvousRepository	rendezvousRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	private UserService	userService;;


	// Constructors -----------------------------------------------------------

	public RendezvousService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Rendezvous create() {

		final User user;
		user = this.userService.findByPrincipal();
		Assert.notNull(user);

		final Rendezvous res;
		res = new Rendezvous();
		return res;
	}

	public List<Rendezvous> findAll() {
		List<Rendezvous> result;

		Assert.notNull(this.rendezvousRepository);
		result = this.rendezvousRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Rendezvous findOne(final int tripId) {
		Rendezvous result;
		Assert.isTrue(tripId > 0);

		result = this.rendezvousRepository.findOne(tripId);

		return result;
	}

	public Rendezvous save(final Rendezvous rendezvous) {
		assert rendezvous != null;

		Rendezvous result;
		
		final User manager;
		manager = this.userService.findByPrincipal();
		Assert.notNull(manager);
		//TODO Hay que corregir esto
		  
		result = this.rendezvousRepository.save(rendezvous);

		return result;
	}

	public void delete(final Rendezvous rendezvous) {
		// TODO
	}

	// Other business methods -------------------------------------------------

	public Collection<Rendezvous> findAllActive() {
		Collection<Rendezvous> result;
		Date currentMoment;

		currentMoment = new Date();
		result = this.rendezvousRepository.findAllActive(currentMoment);
		Assert.notNull(result);

		return result;
	}
	public Collection<Rendezvous> findRquestedTripByExplorerId(final int explorerId) {
		Collection<Rendezvous> result;
		Date currentMoment;
		currentMoment = new Date();
		result = this.rendezvousRepository.findAllActive(currentMoment);
		Assert.notNull(result);

		return result;
	}
	public List<Rendezvous> findByKeyWord(final String keyWord) {
		final List<Rendezvous> res = new ArrayList<Rendezvous>();
		res.addAll(this.rendezvousRepository.findByKeyWord(keyWord));
		//		res.addAll(this.tripRepository.findByTicker(keyWord));
		//		res.addAll(this.tripRepository.findByTitle(keyWord));
		//		res.addAll(this.tripRepository.findByDescription(keyWord));

		return res;
	}


	public Collection<Rendezvous> findByManager(final User manager) {
		final Collection<Rendezvous> res;
		res = this.rendezvousRepository.findByManager(manager);
		return res;
	}


	public Collection<Rendezvous> findByCategoryId(Integer categoryId) {
		Collection<Rendezvous> res;
		res = rendezvousRepository.findByCategory(categoryId);
		return res;
	}

}
