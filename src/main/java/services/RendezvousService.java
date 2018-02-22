/*
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package services;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Actor;
import domain.Administrator;
import domain.Rendezvous;
import domain.Reservation;
import domain.User;
import repositories.RendezvousRepository;

@Service
@Transactional
public class RendezvousService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private RendezvousRepository	rendezvousRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	private UserService				userService;
	@Autowired
	private ActorService			actorService;
	@Autowired
	private AdministratorService	adminService;
	@Autowired
	private ReservationService		reservationService;


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

		res.setUser(user);
		res.setDeleted(false);

		return res;
	}

	public List<Rendezvous> findAll() {
		List<Rendezvous> result;

		Assert.notNull(this.rendezvousRepository);
		result = this.rendezvousRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Rendezvous findOne(final int rendezvousId) {

		Rendezvous result;
		Assert.isTrue(rendezvousId > 0);

		result = this.rendezvousRepository.findOne(rendezvousId);

		return result;
	}

	// TODO ERN: añadido método findOneToEdit de Rendezvous
	public Rendezvous findOneToEdit(final int rendezvousId) {
		Rendezvous result;
		Assert.isTrue(rendezvousId != 0);
		result = this.rendezvousRepository.findOne(rendezvousId);
		this.checkPrincipal(result);
		Assert.isTrue(result.getDraft().equals(true));
		Assert.isTrue(result.getDeleted().equals(false), "Cannot edit a deleted Rendezvous");
		return result;
	}

	public Rendezvous save(final Rendezvous rendezvous) {
		assert rendezvous != null;

		final int id = rendezvous.getId();
		Rendezvous result;
		
		Assert.isTrue(!rendezvous.getDeleted(), "deleted value is /True/");
		if(rendezvous.getId()!=0) {
			Assert.isTrue(rendezvous.getDraft().equals(true),"Cannot edit a Rendezvous in final mode");
		}

		result = this.rendezvousRepository.save(rendezvous);

		if (id == 0) {

			Reservation reservation;
			reservation = this.reservationService.create();
			Assert.notNull(reservation);

			User user;
			user = this.userService.findByPrincipal();
			Assert.notNull(user);

			reservation.setUser(user);
			reservation.setRendezvous(result);

			this.reservationService.save(reservation);

		}

		return result;
	}

	public void delete(final Rendezvous rendezvous) {
		Assert.isTrue(rendezvous.getId() != 0);
		final Administrator admin = this.adminService.findByPrincipal();
		Assert.notNull(admin);
		this.rendezvousRepository.delete(rendezvous);
	}

	
	// Requisito funcional 6.2 ADMIN can remove a rendezvous that he or she thinks is inappropriate.
	// El borrado ha de hacerlo un admnistrador y es real, no virtual como el del usuario.
	public void remove(final Rendezvous rendezvous) {
		Assert.notNull(rendezvous);
		// Comprobamos que el actor autenticado es un "Administrator"

		final Actor actor = actorService.findByPrincipal();
		Assert.isTrue(actor instanceof Administrator);
		// Antes de borrar el rendezvous hay que borrar todos los objetos que lo referencien
		
		// Buscamos y borramos todas las reservas si las hubiera

		Collection<Reservation> reservations = reservationService.findReservationsByRendezvous(rendezvous);
		if (!reservations.isEmpty())
			reservationService.deleteInBatch(reservations);

//		// Buscamos y borramos todos las Reservations si las hubiera
//
//		Collection<Reply> replies = replyService.findAllByCommentId(comment.getId());
//		if (!replies.isEmpty())
//			replyService.deleteInBatch(replies);
//
//		// Buscamos y borramos todos las Questions si las hubiera
//
//		Collection<Reply> replies = replyService.findAllByCommentId(comment.getId());
//		if (!replies.isEmpty())
//			replyService.deleteInBatch(replies);
//
//		// Buscamos y borramos todos los Announcements si los hubiera
//
//		Collection<Reply> replies = replyService.findAllByCommentId(comment.getId());
//		if (!replies.isEmpty())
//			replyService.deleteInBatch(replies);
//
//		// Buscamos y borramos todos los Links si los hubiera
//
//		Collection<Reply> replies = replyService.findAllByCommentId(comment.getId());
//		if (!replies.isEmpty())
//			replyService.deleteInBatch(replies);
//
//		// Buscamos y borramos todos los Comments si los hubiera
//
//		Collection<Reply> replies = replyService.findAllByCommentId(comment.getId());
//		if (!replies.isEmpty())
//			replyService.deleteInBatch(replies);

		// Finalmente borramos el comentario

		this.rendezvousRepository.delete(rendezvous);
		
	}
	// Other business methods -------------------------------------------------

	public Collection<Rendezvous> findCreatedByUser(final int userId) {
		Collection<Rendezvous> result;
		result = this.rendezvousRepository.findCreatedByUserId(userId);
		Assert.notNull(result);

		return result;
	}

	public Collection<Rendezvous> findReservedByUser(final int userId) {

		Collection<Rendezvous> result;
		result = this.rendezvousRepository.findReservedByUserId(userId);
		Assert.notNull(result);

		return result;
	}

	//Requisito 5.3
	public Rendezvous deleteByUser(final Rendezvous rendezvous) {
		Assert.isTrue(rendezvous.getId() != 0);
		this.checkPrincipal(rendezvous);
		Rendezvous result;
		Assert.isTrue(rendezvous.getDraft(), "Final mode is /True/");
		Assert.isTrue(!rendezvous.getDeleted(), "deleted value is /True/");
		rendezvous.setDeleted(true);
		result = this.rendezvousRepository.save(rendezvous);
		return result;
	}

	public Reservation reserveRendezvous(final Reservation reservation, final Rendezvous rendezvous) {

		Assert.notNull(reservation);
		Assert.notNull(rendezvous);

		final User principal = this.userService.findByPrincipal();
		Assert.notNull(principal);
		Assert.isTrue(!rendezvous.getUser().equals(principal), "Cannot reserve this rendezvous");
		if (rendezvous.getAdult().equals(true))
			Assert.isTrue(principal.getAdult().equals(true));

		reservation.setRendezvous(rendezvous);
		reservation.setUser(principal);
		reservation.setCanceled(false);

		return reservation;

	}

	public Reservation cancelRendezvous(final Reservation reservation) {

		Assert.notNull(reservation);
		reservation.setCanceled(true);
		return reservation;

	}

	// TODO ERN: añadido método checkPrincipal para checkear que el que modifica o
	// borra un Rendezvous es el que lo creó
	public void checkPrincipal(final Rendezvous rendezvous) {
		User creator;
		User principal;

		creator = rendezvous.getUser();
		principal = this.userService.findByPrincipal();

		Assert.isTrue(creator.equals(principal));
	}

}
