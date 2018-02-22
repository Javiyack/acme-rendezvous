package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Actor;
import domain.Administrator;
import domain.Comment;
import domain.Reply;
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
	private ReplyService replyService;

	@Autowired
	private ActorService actorService;

	// Constructor ----------------------------------------------------------
	public CommentService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Comment create() {

		final Actor actor = actorService.findByPrincipal();
		Assert.isTrue(actor instanceof User);

		final Comment result;

		result = new Comment();
		result.setUser((User) actor);

		return result;
	}

	public Collection<Comment> findAll() {

		Collection<Comment> result;
		result = this.commentRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Collection<Comment> findAllByUser(final int userId) {

		// Comprobamos que el actor autenticado es un "User"

		final Actor actor = actorService.findByPrincipal();
		Assert.isTrue(actor instanceof User);

		// Comprobamos que el usuario autenticado coincide con el usario pasado
		Assert.isTrue(((User) actor).getId() == userId);

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

	// TOASK ¿Solo administradores puden borrar comentarios?
	public void delete(final Comment comment) {
		Assert.notNull(comment);
		// Comprobamos que el actor autenticado es un "Administrator"

		final Actor actor = actorService.findByPrincipal();
		Assert.isTrue(actor instanceof Administrator);

		// Buscamos y borramos todos las respuestas si las hubiera

		Collection<Reply> replies = replyService.findAllByCommentId(comment.getId());
		if (!replies.isEmpty())
			replyService.deleteInBatch(replies);

		// Finalmente borramos el comentario

		this.commentRepository.delete(comment);
	}

	public Collection<Comment> findAllByRendezvousId(int id) {
		
		return commentRepository.findAllByRendezvousId(id);
	}

}
