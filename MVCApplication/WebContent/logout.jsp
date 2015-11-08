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
	 %>
	 <div id="log">
	 <h1>You have successfully logged out</h1>
	 To login again <a href="login.jsp">click here</a>.
	 </div>
</body>
</html>