<html>
<head>
<title>Registration Form</title>
<style type="text/css">
h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; color:SlateBlue;
text-align: center; text-decoration: underline }
table{font-family: Calibri; color:white; font-size: 11pt; font-style: normal;width: 50%;
text-align:; background-color: SlateBlue; border-collapse: collapse; border: 2px solid navy}
table.inner{border: 0px}
</style>
</head>
 
<body>
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