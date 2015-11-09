package com.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.FlightService;

import com.model.Flight;


public class FlightServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	 
	 
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		FlightService flightService = new FlightService();
		
		if(action.equals("delete")){
			flightService.deleteFlight(Integer.parseInt(id));		
			response.sendRedirect("admin.jsp");
		}
			else{
			action = id==""?"add":"update";
			String airplaneType = request.getParameter("airplane_type");
			String departureCity = request.getParameter("departure_city");
			String departureTime = request.getParameter("departure_time");
			String arrivalCity = request.getParameter("arrival_city");
			String arrivalTime = request.getParameter("arrival_time");
			Date departureDate = null;
			Date arrivalDate = null; 
			Flight flight = new Flight();
			System.out.println(arrivalTime);
			departureTime = departureTime.replace("T", " ");
			arrivalTime = arrivalTime.replace("T", " ");
			if(action.equals("edit")){
			departureTime = departureTime.substring(0, departureTime.length() - 3);
			arrivalTime = arrivalTime.substring(0, arrivalTime.length() - 3);
			}
			System.out.println(arrivalTime);
			DateFormat formatterDate = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			
			try {
				departureDate = formatterDate.parse(departureTime);
				arrivalDate = formatterDate.parse(arrivalTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(action.equals("add"))
				flight.setId(1);
			else
				flight.setId(Integer.parseInt(id));
			flight.setAirplaneType(airplaneType);
			flight.setArrivalCity(arrivalCity);
			flight.setDepartureCity(departureCity);			
			flight.setArrivalDateHour(arrivalDate);
			flight.setDepartureDateHour(departureDate);		
			
			if(action.equals("add"))
				flightService.saveFlight(flight);		
			else if(action.equals("update"))
				flightService.updateFlight(flight);				 
			response.sendRedirect("home.jsp");
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

	}
}