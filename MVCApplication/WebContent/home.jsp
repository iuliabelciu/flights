<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.service.AdminService"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.User"%>
<%@page import="com.model.Flight"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <link rel="stylesheet"	href='<c:url value="/css/pure-0.4.2.css"/>'>
	 <link rel="stylesheet"	href='<c:url value="/css/font-awesome-4.0.3/css/font-awesome.css"/>'>
	 <link rel="stylesheet"	href='<c:url value="/css/jquery-ui-1.10.4.custom.css"/>'>
	 <link rel="stylesheet"	href='<c:url value="/css/jquery.timepicker.css"/>'>
	 <script src='<c:url value="/js/lib/jquery-1.10.2.js"/>'> </script>
	 <script src='<c:url value="/js/lib/jquery-ui-1.10.4.custom.js"/>'> </script>
	 <script src='<c:url value="/js/lib/jquery.ui.datepicker.js"/>'> </script>
	 <script src='<c:url value="/js/lib/jquery.timepicker.js"/>'> </script>
	 <script src='<c:url value="/js/flights.js"/>'> </script>	 
	 <title>Result Page</title>	
</head>
<body style="padding:2%;">
	 <div>
		 <h1>Admin Page</h1>
			 <%=new Date()%>
			 <%
				 User user = (User) session.getAttribute("user");
			 %>		
			 <p>Welcome <%= user.getFirstName() + " " + user.getLastName()%>		
			 <br/>
			 <p><a href="logout.jsp">Logout</a>
		<p>
		<div id="flightDialog" style="display: none;">
			<%@ include file="flightForm.jsp"%>
		</div>

		<button class="pure-button pure-button-primary" onclick="addFlight()">
			<i class="fa fa-plus"></i> Add Flight
		</button>
		<table class="pure-table pure-table-bordered pure-table-striped">
			 <thead>
				 <tr>
				 	 
					 <th>Airplane</th>	
					 <th>Departure</th>	
					 <th>Arrival</th>	
					 <th>Dep. Date Hour</th>	
					 <th>Arr. Date Hour</th>	
					 <th>ID</th>		
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
					 <td><form action="RegisterServlet" method="POST">
					 <input type="hidden" name="id" value="<%=f.getId()%>">
					 <input type="hidden" name="action" value="delete">
					 <input type="submit" class="pure-button pure-button-primary " value="Delete">
					 </form>
					 </td>	
				 </tr>
				 <%}%>
			 <tbody>
		 </table>		
		 <br/>
	 </div>
	
</body>
</html>
