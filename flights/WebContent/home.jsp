<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.service.CityService"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.User"%>
<%@page import="com.model.City"%>
<%@page import="com.model.Flight"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.service.FlightService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <link rel="stylesheet"	href='<c:url value="/css/pure-0.4.2.css"/>'>
	 <link rel="stylesheet"	href='<c:url value="/css/font-awesome-4.0.3/css/font-awesome.css"/>'>
	 <link rel="stylesheet"	href='<c:url value="/css/jquery-ui-1.10.4.custom.css"/>'>
	 <link rel="stylesheet"	href='<c:url value="/css/jquery-ui-timepicker-addon.css"/>'>
	 <link rel="stylesheet" type="text/css" href="css/flights.css" />
	 <script src='<c:url value="/js/lib/jquery-1.10.2.js"/>'> </script>
	 <script src='<c:url value="/js/lib/jquery-ui-1.10.4.custom.js"/>'> </script>
	 <script src='<c:url value="/js/lib/jquery.ui.datepicker.js"/>'> </script>
	 <script src='<c:url value="/js/lib/jquery-ui-timepicker-addon.js"/>'> </script>
	 <script src='<c:url value="/js/flights.js"/>'> </script> 
	 <title>Admin Page</title>	
</head>
<body>
	<div id="page">	 
			
			 <% User user = (User) session.getAttribute("user");%>
			<h1>Welcome <%= user.getFirstName() + " " + user.getLastName()%></h1>	
		<p>
		<div id="flightDialog" style="display: none;">
			<%@ include file="flightForm.jsp"%>
		</div>
		<div id="cityDialog" style="display: none;">
			<%@ include file="cityForm.jsp"%>
		</div>
		<div id="confirmDeleteDialog" style="display: none;">
			<%@ include file="confirmDelete.jsp"%>
		</div>
		<div id="confirmDeleteCity" style="display: none;">
			<%@ include file="confirmDeleteCity.jsp"%>
		</div>
		<c:if test= "${user.getType()=='admin'}">
		<button class="pure-button" onclick="addFlight()">
			<i class="fa fa-plus"></i> Add Flight
		</button>
		</c:if>
	
		<table class="pure-table pure-table-striped" style="width:100%;">
			 <thead>
				 <tr>			 	 
					 <th>Airplane</th>	
					 <th>Departure</th>	
					 <th>Arrival</th>	
					 <th>Departure Date Hour</th>	
					 <th>Arrival Date Hour</th>	
					 <th width="20%;"></th>		
				 </tr>
			 </thead>
			 <tbody>
				 <%
					 FlightService flightService = new FlightService();
					 List<Flight> flights = flightService.getListOfFlights();
					 for (Flight f : flights) {
				 %>
				 <tr>
					 <td><%=f.getAirplaneType()%></td>
					 <td><%=f.getDepartureCity()%></td>
					 <td><%=f.getArrivalCity()%></td>	
					 <td><%=f.getDepartureDateHour()%></td>
					 <td><%=f.getArrivalDateHour()%></td>
					 <td>
					 <c:choose>	
					 <c:when test= "${user.getType()=='admin'}">				 
					 <button class="pure-button grid" 
					 		 onclick="editFlight(<%=f.getId()%>,
					 							 '<%=f.getAirplaneType()%>',
					 							 '<%=f.getDepartureCity()%>',
					 							 '<%=f.getArrivalCity()%>',
					 							 '<%=f.getDepartureDateHour()%>',
					 							 '<%=f.getArrivalDateHour()%>'
					 							 )">
						<i class="fa fa-pencil"></i> Edit
					 </button>
					 			 
					 <button class="pure-button grid" 
					 		 onclick="deleteFlight(<%=f.getId()%>)">
						<i class="fa fa-cog"></i> Delete
					 </button>
					 </c:when>
					 <c:otherwise>		 
					 			 
					 <button class="pure-button grid" 
					 		 onclick="deleteFlight(<%=f.getId()%>)">
						<i class="fa fa-cog"></i> Details
					 </button>
					 </c:otherwise>
					 </c:choose>
					 </td>	
				 </tr>
				 <%}%>
			 <tbody>
		 </table>
		 <br>	
		 <c:if test= "${user.getType()=='admin'}">
		<button class="pure-button" onclick="addCity()">
			<i class="fa fa-plus"></i> Add City
		</button>
		</c:if>
		<table class="pure-table pure-table-striped pure-table-bordered" style="width:100%;">
			 <thead>
				 <tr>			 	 
					 <th>Name</th>	
					 <th>Latitude</th>	
					 <th>Longitude</th>	
					 <th width="20%"></th>		
				 </tr>
			 </thead>
			 <tbody>
				 <%
				 	 CityService cityService = new CityService();
					 List<City> city = cityService.getListOfCities();
					 for (City c : city) {
				 %>
				 <tr>
					 <td><%=c.getName()%></td>
					 <td><%=c.getLatitude()%></td>
					 <td><%=c.getLongitude()%></td>	
					 <td>		
					 <c:choose>
					 <c:when test= "${user.getType()=='admin'}">			 
					 <button class="pure-button grid" 
					 		 onclick="editCity('<%=c.getName()%>',
					 							 '<%=c.getLatitude()%>',
					 							 '<%=c.getLongitude()%>'
					 							 )">
						<i class="fa fa-pencil"></i> Edit
					 </button>
					 			 
					 <button class="pure-button grid" 
					 		 onclick="deleteCity(<%=c.getId()%>)">
						<i class="fa fa-cog"></i> Delete
					 </button>
					 </c:when>
					    <c:otherwise>
    					     
					 <button class="pure-button grid" 
					 		 onclick="getLocalTime(<%=c.getId()%>)">
						<i class="fa fa-cog"></i> Local
					 </button>
    					</c:otherwise>
					 </c:choose>
			
					 </td>	
				 </tr>
				 <%}%>
			 <tbody>
		 </table>	
		<br>
		 <a href="logout.jsp" class="pure-button" >Logout</a>
</div>
</body>
</html>
