package services;

import java.util.Collection;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Comment;
import domain.User;
import repositories.CommentRepository;

@Service
@Transactional
public class CommentService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private CommentRepository commentRepository;

	// Supporting services 
	@Autowired
	private UserService userService;


	// Constructor ----------------------------------------------------------
	public CommentService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Comment create() {

		final Comment result;

		result = new Comment();

		return result;
	}

	public Collection<Comment> findAll() {

		Collection<Comment> result;

		result = this.commentRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Collection<Comment> findAllByUser(final int userId) {

		Collection<Comment> result;

		result = this.commentRepository.findAllByUser(userId);
		Assert.notNull(result);

		return result;
	}

	public Comment findOne(final int commentId) {
		Comment result;

		result = this.commentRepository.findOne(commentId);
		Assert.notNull(result);

		return result;
	}

	public Comment save(final Comment comment) {
		Assert.notNull(comment);
		Comment saved;

		saved = this.commentRepository.save(comment);

		return saved;
	}

	public void delete(final Comment comment) {
		Assert.notNull(comment);

		this.commentRepository.delete(comment);
	}

}
