
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AnswerRepository;
import domain.Answer;
import domain.Rendezvous;
import domain.Reservation;
import domain.User;

@Service
@Transactional
public class AnswerService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private AnswerRepository	answerRepository;

	// Supporting services --------------------------------------------------
	@Autowired
	private RendezvousService	rendezvousService;
	@Autowired
	private UserService			userService;
	@Autowired
	private ReservationService	reservationService;


	// Constructor ----------------------------------------------------------
	public AnswerService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Answer create() {

		final Answer result;

		result = new Answer();

		return result;
	}

	public Collection<Answer> findAll() {

		Collection<Answer> result;

		result = this.answerRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Collection<Answer> findByReservation(final Reservation reserva) {
		Assert.notNull(reserva);

		final Collection<Answer> result = this.answerRepository.findByReservation(reserva);

		return result;
	}

	public Collection<Answer> findByUserAndRendezvous(final int userId, final int rendezvousId) {
		final User user = this.userService.findOne(userId);
		final Rendezvous rendezvous = this.rendezvousService.findOne(rendezvousId);
		Assert.notNull(user);
		Assert.notNull(rendezvous);

		final Reservation reservation = this.reservationService.findReservationByUserAndRendezvous(user, rendezvous);

		final Collection<Answer> answers = this.answerRepository.findByReservation(reservation);

		return answers;
	}

	public Answer findOne(final int answerId) {
		Answer result;

		result = this.answerRepository.findOne(answerId);
		Assert.notNull(result);

		return result;
	}

	public Answer save(final Answer answer) {
		Assert.notNull(answer);
		Answer saved;

		saved = this.answerRepository.save(answer);

		return saved;
	}

	public void delete(final Answer answer) {
		Assert.notNull(answer);

		this.answerRepository.delete(answer);
	}

	public void deleteInBatch(final Collection<Answer> answers) {
		// TOASK ¿Habria que comprobar usuario logado?
		this.answerRepository.deleteInBatch(answers);
	}

	public Collection<Answer> findByQuestionId(final int id) {
		// TODO Auto-generated method stub
		return this.answerRepository.findByQuestionId(id);
	}

}
