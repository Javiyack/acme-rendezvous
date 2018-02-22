package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Link;
import repositories.LinkRepository;

@Service
@Transactional
public class LinkService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private LinkRepository linkRepository;

	// Supporting services 


	// Constructor ----------------------------------------------------------
	public LinkService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Link create() {

		final Link result;

		result = new Link();

		return result;
	}

	public Collection<Link> findAll() {

		Collection<Link> result;

		result = this.linkRepository.findAll();
		Assert.notNull(result);

		return result;
	}


	public Link findOne(final int linkId) {
		Link result;

		result = this.linkRepository.findOne(linkId);
		Assert.notNull(result);

		return result;
	}

	public Link save(final Link link) {
		Assert.notNull(link);
		Link saved;

		saved = this.linkRepository.save(link);

		return saved;
	}

	public void delete(final Link link) {
		Assert.notNull(link);

		this.linkRepository.delete(link);
	}

	public Collection<Link> findAllByRendezvousId(int id) {
		
		return 	linkRepository.findAllByRendezvousId(id);
	
	}

	public void deleteInBatch(Collection<Link> links) {
		// TOASK ¿habria que comprobar aqui tambien que en usuario logado es admin?

		Assert.notEmpty(links);

		this.linkRepository.deleteInBatch(links);
	}

}
