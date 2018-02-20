package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Question;
import repositories.QuestionRepository;

@Service
@Transactional
public class QuestionService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private QuestionRepository questionRepository;

	// Supporting services 


	// Constructor ----------------------------------------------------------
	public QuestionService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Question create() {

		final Question result;

		result = new Question();

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
		Question saved;

		saved = this.questionRepository.save(question);

		return saved;
	}

	public void delete(final Question question) {
		Assert.notNull(question);

		this.questionRepository.delete(question);
	}

}
