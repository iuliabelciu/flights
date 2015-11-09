
package com.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="FLIGHT")
public class Flight implements Serializable {
    
    @Id @GeneratedValue
	private int id;
	private String airplaneType;
	private String departureCity;
	private Date departureDateHour;
	private String arrivalCity;
	private Date arrivalDateHour;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAirplaneType() {
		return airplaneType;
	}

	public void setAirplaneType(String airplaneType) {
		this.airplaneType = airplaneType;
	}

	public String getDepartureCity() {
		return departureCity;
	}

	public void setDepartureCity(String departureCity) {
		this.departureCity = departureCity;
	}

	public Date getDepartureDateHour() {
		return departureDateHour;
	}

	public void setDepartureDateHour(Date departureDateHour) {
		this.departureDateHour = departureDateHour;
	}

	public String getArrivalCity() {
		return arrivalCity;
	}

	public void setArrivalCity(String arrivalCity) {
		this.arrivalCity = arrivalCity;
	}
	
	public Date getArrivalDateHour() {
		return arrivalDateHour;
	}

	public void setArrivalDateHour(Date arrivalDateHour) {
		this.arrivalDateHour = arrivalDateHour;
	}

}