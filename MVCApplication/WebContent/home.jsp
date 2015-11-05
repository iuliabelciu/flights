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
	 <link rel="stylesheet" type="text/css" href="css/style.css"/>
	 <title>Result Page</title>	
</head>
<body>
	 <div>
		 <h1>Result Page</h1>
			 <b>This is Sample Result Page</b><br/>
			 <%=new Date()%>
			 <%
				 User user = (User) session.getAttribute("user");
			 %>		
			 <b>Welcome <%= user.getFirstName() + " " + user.getLastName()%></b>		
			 <br/>
			 <a href="logout.jsp">Logout</a>
		

		 <table>
			 <thead>
				 <tr>
				 	 <th>ID</th>
					 <th>Airplane</th>	
					 <th>Departure</th>	
					 <th>Arrival</th>	
					 <th>Dep. Date Hour</th>	
					 <th>Arr. Date Hour</th>			
				 </tr>
			 </thead>
			 <tbody>
				 <%
					 AdminService adminService = new AdminService();
					 List<Flight> list = adminService.getListOfFlights();
					 for (Flight f : list) {
				 %>
				 <tr>
					 <td><%=f.getId()%></td>
					 <td><%=f.getAirplaneType()%></td>
					 <td><%=f.getDepartureCity()%></td>
					 <td><%=f.getArrivalCity()%></td>	
					 <td><%=f.getDepartureDateHour()%></td>
					 <td><%=f.getArrivalDateHour()%></td>				 
				 </tr>
				 <%}%>
			 <tbody>
		 </table>		
		 <br/>
	 </div>
	 
<form action="RegisterServlet" method="POST">
<p>ID: <input type="text" name="id" ></p>
<p>Airplane type: <input type="text" name="airplane_type" ></p>
<p>Departure city: <input type="text" name="departure_city" ></p>
<p>Departure time: <input type="text" name="departure_time" ></p>
<p>Arrival city: <input type="text" name="arrival_city" ></p>
<p>Arrival time: <input type="text" name="arrival_time" ></p>
<p><input type="submit" value="Submit"></p>
</form>
</body>
</html>
