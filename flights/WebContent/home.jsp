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
	 <c:choose>
	 <c:when test= "${user.getType()=='admin'}">
	 <title>Admin Page</title>
	 </c:when>
	 <c:otherwise>
	 <title>User Page</title>
	 </c:otherwise>
	 </c:choose>	
</head>
<body>
	<div id="page">	 
			
			 <% User user = (User) session.getAttribute("user");%>
			 <%if (user != null) {%>
			 <h1>Welcome <%= user.getFirstName() + " " + user.getLastName()%></h1>
			 <% }%>
			 <%if (!(user != null)) {%>
			 <%session.setAttribute("message","You do not have access!"); %>	
			 <%response.sendRedirect("http://localhost:8080/MVCApplication/login.jsp"); %>
			 <% }%>
			
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
		<h2>List of flights:</h2>
		<c:if test= "${user.getType()=='admin'}">
		<button class="pure-button" onclick="addFlight()">
			<i class="fa fa-plus"></i> Add Flight
		</button>
		</c:if>
	
		<table class="pure-table pure-table-striped" style="width:100%;">
			 <thead>
				 <tr>			 	 
					 <th height="46px">Airplane</th>	
					 <th>Departure</th>	
					 <th>Arrival</th>	
					 <th>Departure Date Hour</th>	
					 <th>Arrival Date Hour</th>	
					 <c:if test= "${user.getType()=='admin'}">
					 <th width="20%;"></th>		
					 </c:if>
				 </tr>
			 </thead>
			 <tbody>
				 <%
					 FlightService flightService = new FlightService();
					 List<Flight> flights = flightService.getListOfFlights();
					 for (Flight f : flights) {
				 %>
				 <tr>
					 <td height="46px"><%=f.getAirplaneType()%></td>
					 <td><%=f.getDepartureCity()%></td>
					 <td><%=f.getArrivalCity()%></td>	
					 <td><%=f.getDepartureDateHour()%></td>
					 <td><%=f.getArrivalDateHour()%></td>
					 <c:choose>	
					 <c:when test= "${user.getType()=='admin'}">				 
					 <td>
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
					 </td>
					 </c:when>
					 </c:choose>
					 	
				 </tr>
				 <%}%>
			 <tbody>
		 </table>
		 <br>	
		<h2>List of cities:</h2>
		 <c:if test= "${user.getType()=='admin'}">
		<button class="pure-button" onclick="addCity()">
			<i class="fa fa-plus"></i> Add City
		</button>
		</c:if>
		
		<table class="pure-table pure-table-striped pure-table-bordered" style="width:100%;">
			 <thead>
				 <tr>			 	 
					 <th height="46px">Name</th>	
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
					 		 onclick="editCity('<%=c.getId()%>',
					 		 					'<%=c.getName()%>',
					 							 '<%=c.getLatitude()%>',
					 							 '<%=c.getLongitude()%>',
					 							 'edit'
					 							 )">
						<i class="fa fa-pencil"></i> Edit
					 </button>
					 			 
					 <button class="pure-button grid" 
					 		 onclick="deleteCity(<%=c.getId()%>)">
						<i class="fa fa-cog"></i> Delete
					 </button>
					 </c:when>
					    <c:otherwise>
    					     
					 <button class="pure-button grid" style="width:210px;" 
					 		 onclick="getTimeZone('<%=c.getId()%>',
					 		 					'<%=c.getName()%>',
					 							 '<%=c.getLatitude()%>',
					 							 '<%=c.getLongitude()%>',
					 							 'timezone'
					 							 )">
						<i class="fa fa-map-marker"></i> Local
					 </button>
    					</c:otherwise>
					 </c:choose>
			
					 </td>	
				 </tr>
				 <%}%>
			 <tbody>
		 </table>
		 <c:if test="${not empty country}">
		 <h2>For <c:out value="${country}"></c:out> the time is: <c:out value="${timezone}"></c:out></h2>
		</c:if>
		<br>
		 <a href="logout.jsp" class="pure-button" ><i class="fa fa-lock"></i> Logout</a>
</div>
</body>
</html>
