<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.service.AdminService"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.User"%>
<%@page import="com.model.Flight"%>
<%@page import="java.text.DateFormat"%>
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
			 
			 <%
				 User user = (User) session.getAttribute("user");
			 	%>
			 <% if (user!=null && user.getType().equals("admin")) { %>
			<h1>Welcome <%= user.getFirstName() + " " + user.getLastName()%></h1>	
			<% } else { response.sendRedirect("http://localhost:8080/MVCApplication/user.jsp");} %>	
		<p>
		<div id="flightDialog" style="display: none;">
			<%@ include file="flightForm.jsp"%>
		</div>
		<div id="confirmDeleteDialog" style="display: none;">
			<%@ include file="confirmDelete.jsp"%>
		</div>

		<button class="pure-button" onclick="addFlight()">
			<i class="fa fa-plus"></i> Add Flight
		</button>
		<P>
		<table class="pure-table" style="width:100%;">
			 <thead>
				 <tr>			 	 
					 <th>Airplane</th>	
					 <th>Departure</th>	
					 <th>Arrival</th>	
					 <th>Departure Date Hour</th>	
					 <th>Arrival Date Hour</th>	
					 <th width="19%"></th>		
				 </tr>
			 </thead>
			 <tbody>
				 <%
					 AdminService adminService = new AdminService();
					 List<Flight> list = adminService.getListOfFlights();
					 for (Flight f : list) {
				 %>
				 <tr>
					 <td><%=f.getAirplaneType()%></td>
					 <td><%=f.getDepartureCity()%></td>
					 <td><%=f.getArrivalCity()%></td>	
					 <td><%=f.getDepartureDateHour()%></td>
					 <td><%=f.getArrivalDateHour()%></td>
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
				 </tr>
				 <%}%>
			 <tbody>
		 </table>		
		 <p><a href="logout.jsp" class="pure-button" >Logout</a>
</div>
</body>
</html>