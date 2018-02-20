package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Reply;
import repositories.ReplyRepository;

@Service
@Transactional
public class ReplyService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private ReplyRepository replyRepository;

	// Supporting services 


	// Constructor ----------------------------------------------------------
	public ReplyService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Reply create() {

		final Reply result;

		result = new Reply();

		return result;
	}

	public Collection<Reply> findAll() {

		Collection<Reply> result;

		result = this.replyRepository.findAll();
		Assert.notNull(result);

		return result;
	}


	public Reply findOne(final int replyId) {
		Reply result;

		result = this.replyRepository.findOne(replyId);
		Assert.notNull(result);

		return result;
	}

	public Reply save(final Reply reply) {
		Assert.notNull(reply);
		Reply saved;

		saved = this.replyRepository.save(reply);

		return saved;
	}

	public void delete(final Reply reply) {
		Assert.notNull(reply);

		this.replyRepository.delete(reply);
	}

}
