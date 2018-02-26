
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Embeddable;
import javax.validation.constraints.Pattern;

@Embeddable
@Access(AccessType.PROPERTY)
public class Coordinate {

	private Double	longitude;
	private Double	latitude;


	@Pattern(regexp = "^([0-9]*\\.?[0-9])|([0-9]*\\.?)$")
	public String getLongitude() {
		final String res = (this.longitude == null) ? "" : this.longitude.toString();
		return res;
	}
	public void setLongitude(final String longitude) {
		Double lon = null;
		try {
			final Object res = Double.parseDouble(longitude);
			lon = (res instanceof Double) ? (Double) res : null;
		} catch (final NumberFormatException e) {
		}
		this.longitude = lon;
	}

	@Pattern(regexp = "^([0-9]*\\.?[0-9])|([0-9]*\\.?)$")
	public String getLatitude() {
		final String res = (this.latitude == null) ? "" : this.latitude.toString();
		return res;
	}
	public void setLatitude(final String latitude) {
		Double lat = null;
		try {
			final Object res = Double.valueOf(latitude);
			lat = (res instanceof Double) ? (Double) res : null;
		} catch (final NumberFormatException e) {
		}
		this.latitude = lat;
	}
}
