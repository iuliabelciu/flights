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

import com.service.RegisterService;

import com.model.Flight;


public class RegisterServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	 
	 
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		RegisterService registerService = new RegisterService();
		
		if(action.equals("delete")){
			registerService.deleteFlight(Integer.parseInt(id));		
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
				registerService.saveFlight(flight);		
			else if(action.equals("update"))
				registerService.updateFlight(flight);				 
			response.sendRedirect("admin.jsp");
		}
	}

	public void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		System.out.println("o intrat in delete");
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		
		System.out.println("o intrat in get");
	}
}