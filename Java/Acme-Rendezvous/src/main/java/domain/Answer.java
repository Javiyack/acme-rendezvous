package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Answer extends DomainEntity{

	private String answer;

	private Reservation reservation;
	
	private Question question;

	@NotBlank
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@NotNull
	@ManyToOne(optional = false)
	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation rSVP) {
		this.reservation = rSVP;
	}

	@NotNull
	@ManyToOne(optional = false)
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	
}
