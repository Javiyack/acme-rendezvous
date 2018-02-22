
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AnnouncementRepository;
import domain.Announcement;
import domain.Answer;
import domain.Reservation;
import domain.Rendezvous;

@Service
@Transactional
public class AnnouncementService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private AnnouncementRepository	announcementRepository;

	// Supporting services --------------------------------------------------
	@Autowired
	private RendezvousService		rendezvousService;


	// Constructor ----------------------------------------------------------
	public AnnouncementService() {
		super();
	}

	// Methods CRUD ---------------------------------------------------------
	public Announcement create() {

		final Announcement result;

		result = new Announcement();

		return result;
	}

	public Collection<Announcement> findAll() {

		Collection<Announcement> result;

		result = this.announcementRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Announcement findOne(final int announcementId) {
		Announcement result;

		result = this.announcementRepository.findOne(announcementId);
		Assert.notNull(result);

		return result;
	}

	public Announcement save(final Announcement announcement) {
		Assert.notNull(announcement);
		Announcement saved;

		saved = this.announcementRepository.save(announcement);

		return saved;
	}

	public void delete(final Announcement announcement) {
		Assert.notNull(announcement);

		this.announcementRepository.delete(announcement);
	}

	// Other business methods -------------------------------------------------

	public Collection<Announcement> findByRendezvous(final int rendezvousId) {
		final Rendezvous rendezvous = this.rendezvousService.findOne(rendezvousId);
		Assert.notNull(rendezvous);
		final Collection<Announcement> announcements = this.announcementRepository.findByRendezvous(rendezvousId);
		Assert.notNull(announcements);
		return announcements;
	}
	
	public void deleteInBatch(Collection<Announcement> announcements) {
		// TOASK ¿habria que comprobar aqui tambien que en usuario logado es admin?

		Assert.notEmpty(announcements);		

		this.announcementRepository.deleteInBatch(announcements);

	}

}
