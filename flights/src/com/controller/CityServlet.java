package com.controller;

import java.io.IOException;

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
			response.sendRedirect("admin.jsp");
		}
	}/*
	 public void requestTimeZone()
     {
         String responseFromServer = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><TimeZoneResponse><status>OK</status> <raw_offset>7200.0000000</raw_offset><dst_offset>0.0000000</dst_offset> <time_zone_id>Europe/Bucharest</time_zone_id> <time_zone_name>Eastern European Standard Time</time_zone_name></TimeZoneResponse>";
         
         try
         {
             String completeUrl = "http://api.geonames.org/timezone?lat=45.01&lng=20.2&username=demo";
             completeUrl += "latitude=" + address1.Latitude + "&longitude=" + address1.Longitude;


             // Create a request for the URL.         
             WebRequest request = WebRequest.Create(completeUrl);

             // If required by the server, set the credentials.
             request.Credentials = CredentialCache.DefaultCredentials;


             // If you have a proxy configured.
             //WebProxy proxyObject = new WebProxy("<a href="http://proxy.com/">http://proxy.com/</a>", true);
             //request.Proxy = proxyObject;


             //Get the response.
             HttpWebResponse response = (HttpWebResponse)request.GetResponse();

             // Get the stream containing content returned by the server.
             Stream dataStream = response.GetResponseStream();


             // Open the stream using a StreamReader for easy access.
             StreamReader reader = new StreamReader(dataStream);
             // Read the content.
             responseFromServer = reader.ReadToEnd();



             // Cleanup the streams and the response.

             reader.Close();
             dataStream.Close();
             response.Close();
         }
         catch (Exception e)
         {//TODO
         }
         tz = parse.processXML(responseFromServer);
     }
 }
*/

}