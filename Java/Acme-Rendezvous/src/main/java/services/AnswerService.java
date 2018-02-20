package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Answer;
import repositories.AnswerRepository;

@Service
@Transactional
public class AnswerService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private AnswerRepository answerRepository;

	// Supporting services 


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

}
