package org.sciencegateway.dataingestor.POJO;

import java.util.Date;

public class URLObjects 
{
	
	private Date date;
	private String stationName;
	private String time;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public URLObjects() {
		
	}
	
	public URLObjects(Date date, String stationName, String time) {
		super();
		this.date = date;
		this.stationName = stationName;
		this.time = time;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((stationName == null) ? 0 : stationName.hashCode());
		result = prime * result + ((time == null) ? 0 : time.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		URLObjects other = (URLObjects) obj;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (stationName == null) {
			if (other.stationName != null)
				return false;
		} else if (!stationName.equals(other.stationName))
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		return true;
	}
}

