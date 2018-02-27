package forms;

import java.util.Map;

import domain.Rendezvous;
import domain.User;

public class FormularioPreguntas {
	

	private Rendezvous rendezvous;
	
	private User user;
	
	private Map<String, String> cuestionario;
	
	
	
	public Rendezvous getRendezvous() {
		return rendezvous;
	}
	public void setRendezvous(Rendezvous rendezvous) {
		this.rendezvous = rendezvous;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Map<String, String> getCuestionario() {
		return cuestionario;
	}
	public void setCuestionario(Map<String, String> cuestionario) {
		this.cuestionario = cuestionario;
	}

	
	

}
