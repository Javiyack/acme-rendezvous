
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.QuestionRepository;
import domain.Actor;
import domain.Answer;
import domain.Question;
import domain.Rendezvous;
import domain.User;

@Service
@Transactional
public class QuestionService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private QuestionRepository	questionRepository;

	// Supporting services 
	@Autowired
	private AnswerService		answerService;
	@Autowired
	private RendezvousService	rendezvousService;
	@Autowired
	private ActorService		actorService;


	// Constructor ----------------------------------------------------------
	public QuestionService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Question create(final int rendezvousId) {

		final Question result;
		final Rendezvous rendezvous = this.rendezvousService.findOne(rendezvousId);
		Assert.notNull(rendezvous);

		result = new Question();
		result.setRendezvous(rendezvous);

		return result;
	}

	public Collection<Question> findAll() {

		Collection<Question> result;

		result = this.questionRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Question findOne(final int questionId) {
		Question result;

		result = this.questionRepository.findOne(questionId);
		Assert.notNull(result);

		return result;
	}

	public Question save(final Question question) {
		Assert.notNull(question);
		final Actor actor = this.actorService.findByPrincipal();
		Assert.isTrue(actor instanceof User);
		Assert.isTrue(question.getRendezvous().getUser().equals(actor));

		Question saved;

		saved = this.questionRepository.save(question);

		return saved;
	}

	public void delete(final Question question) {
		Assert.notNull(question);

		this.questionRepository.delete(question);
	}

	public Collection<Question> findAllByRendezvousId(final int id) {

		return this.questionRepository.findAllByRendezvousId(id);
	}

	public void deleteInBatch(final Collection<Question> questions) {
		// TOASK �habria que comprobar aqui tambien que en usuario logado es admin?

		Assert.notEmpty(questions);

		for (final Question question : questions) {
			final Collection<Answer> answers = this.answerService.findByQuestionId(question.getId());
			this.answerService.deleteInBatch(answers);
		}

		this.questionRepository.deleteInBatch(questions);

	}

}
