package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Answer;
import domain.Rendezvous;
import domain.Reservation;
import domain.User;
import repositories.ReservationRepository;

@Service
@Transactional
public class ReservationService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private ReservationRepository reservationRepository;

	// Supporting services 
	@Autowired
	private AnswerService answerService;

	// Constructor ----------------------------------------------------------
	public ReservationService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Reservation create() {

		final Reservation result;

		result = new Reservation();

		return result;
	}

	public Collection<Reservation> findAll() {

		Collection<Reservation> result;

		result = this.reservationRepository.findAll();
		Assert.notNull(result);

		return result;
	}


	public Reservation findOne(final int reservationId) {
		Reservation result;

		result = this.reservationRepository.findOne(reservationId);
		Assert.notNull(result);

		return result;
	}

	public Reservation save(final Reservation reservation) {
		Assert.notNull(reservation);
		Reservation saved;

		saved = this.reservationRepository.save(reservation);

		return saved;
	}

	public void delete(final Reservation reservation) {
		Assert.notNull(reservation);

		this.reservationRepository.delete(reservation);
	}
	
	public Reservation findReservationByUserAndRendezvous(User user, Rendezvous rendezvous) {
		Assert.notNull(user);
		Assert.notNull(rendezvous);
		return this.reservationRepository.findReservationByUserAndRendezvous(user, rendezvous);
	}
	
	public Collection<Reservation> findAllByRendezvousId(final int rendezvousId) {
		
		return this.reservationRepository.findReservationsByRendezvous(rendezvousId);
	}

	public void deleteInBatch(Collection<Reservation> reservations) {
		// TOASK ¿habria que comprobar aqui tambien que en usuario logado es admin?
		
		Assert.notEmpty(reservations);
		
		for (Reservation reservation : reservations) {
			Collection<Answer> answers = answerService.findByReservation(reservation);
			answerService.deleteInBatch(answers);
		}

		this.reservationRepository.deleteInBatch(reservations);
	}

}
