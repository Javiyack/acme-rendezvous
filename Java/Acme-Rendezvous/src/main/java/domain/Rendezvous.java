
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.URL;

@Entity
@Access(AccessType.PROPERTY)
public class Rendezvous extends DomainEntity {

	private String		name;

	private String		description;

	private Date		moment;

	private String		picture;		// Optional	

	private Coordinate	location;		// Optional	

	private Boolean		draft;

	private User		user;


	@NotNull
	public String getName() {
		return this.name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	@NotNull
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	@NotNull
	public Date getMoment() {
		return this.moment;
	}

	public void setMoment(final Date moment) {
		this.moment = moment;
	}

	// Optional
	@URL
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(final String picture) {
		this.picture = picture;
	}
	// Optional
	public Coordinate getLocation() {
		return this.location;
	}

	public void setLocation(final Coordinate location) {
		this.location = location;
	}

	@NotNull
	public Boolean getDraft() {
		return this.draft;
	}

	public void setDraft(final Boolean draft) {
		this.draft = draft;
	}

	@NotNull
	@ManyToOne(optional = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(final User user) {
		this.user = user;
	}

}
