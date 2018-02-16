
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Embeddable;

@Embeddable
@Access(AccessType.PROPERTY)
public class Coordinate {

	private Double	longitude;
	private Double	latitude;


	public String getLongitude() {
		return this.longitude.toString();
	}
	public void setLongitude(final String longitude) {
		this.longitude = Double.valueOf(longitude);
	}

	public String getLatitude() {
		return this.latitude.toString();
	}
	public void setLatitude(final String latitude) {
		this.latitude = Double.valueOf(latitude);
	}
}
