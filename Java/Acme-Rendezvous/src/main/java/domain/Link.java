package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Link  extends DomainEntity{

	private Rendezvous rendezvous;

	private Rendezvous linkedToRendezvous;

	@NotNull
	@ManyToOne(optional = false)
	public Rendezvous getRendezvous() {
		return rendezvous;
	}

	public void setRendezvous(Rendezvous rendezvous) {
		this.rendezvous = rendezvous;
	}

	@NotNull
	@ManyToOne(optional = false)
	public Rendezvous getLinkedToRendezvous() {
		return linkedToRendezvous;
	}

	public void setLinkedToRendezvous(Rendezvous linkedRendezvous) {
		this.linkedToRendezvous = linkedRendezvous;
	}

	
}
