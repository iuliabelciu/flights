package com.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.CityService;

import com.model.City;

public class CityServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	 
	 
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		CityService cityService = new CityService();
		
		City city = new City();
		
		if(action.equals("delete")){
			cityService.deleteCity(Integer.parseInt(id));		
			response.sendRedirect("admin.jsp");
		}
		else{
			if(!(action.equals("timezone")))
				action = id==""?"add":"update";
			String name = request.getParameter("name");
			String longitude = request.getParameter("longitude");
			String latitude = request.getParameter("latitude");		

			System.out.println(name);
			System.out.println(latitude);
			System.out.println(longitude);
			
			if(action.equals("add"))
				city.setId(1);
			else
				city.setId(Integer.parseInt(id));
			
			city.setName(name);
			city.setLatitude(Float.parseFloat(latitude));
			city.setLongitude(Float.parseFloat(longitude));			
			
			if(action.equals("add"))
				cityService.saveCity(city);		
			else if(action.equals("update"))
				cityService.updateCity(city);	
			else if(action.equals("timezone"))
			{
				String country = "";
				String timezone = "";
				try
		         {
		             String completeUrl = "http://api.geonames.org/timezone?";
		             completeUrl += "lat=" + city.getLatitude() + "&lng=" + city.getLongitude() + "&username=iuliabelciu";
		             System.out.println(completeUrl);
		             URL yahoo = new URL(completeUrl);
		             URLConnection yc = yahoo.openConnection();
		             BufferedReader in = new BufferedReader(
		                                     new InputStreamReader(
		                                     yc.getInputStream()));
		             String inputLine;
		             int counter = 0;
		             while ((inputLine = in.readLine()) != null) {
		            	 counter++;
		                 System.out.println(inputLine);
		                 if (counter == 5)
		                	 country=inputLine;
		                 if (counter == 12)
		                	 timezone=inputLine;		                	 
		             }
		             in.close();

		 			 timezone = timezone.replace("<time>", " ");
		 			 timezone = timezone.replace("</time>", " ");

		 			 country = country.replace("<countryName>", " ");
		 			 country = country.replace("</countryName>", " ");

		 			 request.getSession().setAttribute("timezone", timezone);
		 			 request.getSession().setAttribute("country", country);
		         }
				finally
				{
				}	
			}
			
			response.sendRedirect("home.jsp");
		}
	}
	
     
 }
