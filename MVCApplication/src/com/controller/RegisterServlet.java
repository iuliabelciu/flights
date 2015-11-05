package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.User;
import com.service.RegisterService;

import com.model.Flight;


public class RegisterServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	 response.setContentType("text/html;charset=UTF-8");
	 PrintWriter out = response.getWriter();
		String id = null;
		id = request.getParameter("id");
		String airplaneType = request.getParameter("airplane_type");
		String departureCity = request.getParameter("departure_city");
		String departureTime = request.getParameter("departure_time");
		String arrivalCity = request.getParameter("arrival_city");
		String arrivalTime = request.getParameter("arrival_time");
		Date departureDate = null;
		Date arrivalDate = null; 
		Flight flight = new Flight();
			departureTime = departureTime.replace("T", " ");
			arrivalTime = arrivalTime.replace("T", " ");		
			DateFormat formatter; 
			formatter = new SimpleDateFormat("yyyy-MM-dd");
			try {
				departureDate = formatter.parse(departureTime);
				arrivalDate = formatter.parse(arrivalTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			flight.setId(Integer.parseInt(id));
			flight.setAirplaneType(airplaneType);
			flight.setArrivalCity(arrivalCity);
			flight.setDepartureCity(departureCity);
			flight.setArrivalDateHour(arrivalDate);
			flight.setDepartureDateHour(departureDate);		
		
	 try {	
		 RegisterService registerService = new RegisterService();
		 boolean result = registerService.register(flight);		
		 out.println("<html>");
		 out.println("<head>");		
		 out.println("<title>Registration Successful</title>");		
		 out.println("</head>");
		 out.println("<body>");
		 out.println("<center>");
		 if(result){
			 out.println("<h1>Thanks for Registering with us :</h1>");
			 out.println("To login with new Username and Password<a href=login.jsp>Click here</a>");
		 }else{
			 out.println("<h1>Registration Failed</h1>");
			 out.println("To try again<a href=register.jsp>Click here</a>");
		 }
		 out.println("</center>");
		 out.println("</body>");
		 out.println("</html>");
	 } finally {		
		 out.close();
	 }
}

}