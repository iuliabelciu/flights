<html>
<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	 <link rel="stylesheet" type="text/css" href="css/flights.css">
	 <title>logout Page</title>
</head>
<body>
	 <%		
		 session.removeAttribute("username");
		 session.removeAttribute("password");
		 session.invalidate();
		 response.sendRedirect("http://localhost:8080/flights/login.jsp");
	 %>
</body>
</html>