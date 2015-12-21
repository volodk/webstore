<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProcessedLogPass</title>
</head>
<body>
	<h2>Processed login and password . . .</h2>
	
	<% String realPass="123";
	if (request.getParameter("password").toString().equals(realPass)) { 
		out.print("Welcome to program admining page, "+ request.getParameter("login") + "!");
	}
	else{
		out.println("Sorry, this is wrong password!!!");
	}%> 
<br>
<br>
<form method="post" action = "index.jsp">
<input type = "submit" value = "Back">
</form>	
</body>
</html>