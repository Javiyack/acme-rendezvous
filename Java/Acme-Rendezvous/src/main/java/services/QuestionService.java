package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Answer;
import domain.Question;
import repositories.QuestionRepository;

@Service
@Transactional
public class QuestionService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private QuestionRepository questionRepository;

	// Supporting services 
	@Autowired
	private AnswerService answerService;


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

	public Collection<Question> findAllByRendezvousId(final int id) {
		
		return questionRepository.findAllByRendezvousId(id);
	}

	public void deleteInBatch(Collection<Question> questions) {
		// TOASK ¿habria que comprobar aqui tambien que en usuario logado es admin?

		Assert.notEmpty(questions);

		for (Question question : questions) {
			Collection<Answer> answers = answerService.findByQuestionId(question.getId());
			answerService.deleteInBatch(answers);
		}

		this.questionRepository.deleteInBatch(questions);

	}

}
