package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Announcement;
import repositories.AnnouncementRepository;

@Service
@Transactional
public class AnnouncementService {

	// Managed repositories ------------------------------------------------
	@Autowired
	private AnnouncementRepository announcementRepository;

	// Supporting services 


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

}
