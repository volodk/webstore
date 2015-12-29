<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProcessedLogPass</title>
<style>
a {margin: 0 10px}
</style>
</head>
<body>
	<h2>Processed login and password . . .</h2>
	
	<%String realLogin = "admin"; 
	String realPass = "admin";
	String inputLogin = request.getParameter("login").toString();
	String inputPass = request.getParameter("password").toString();
	
	
	if (inputLogin.equals(realLogin) 
			& inputPass.equals(realPass)) { 
		out.print("Welcome, "+ inputLogin + ". You have administration rights!");
		%>
		<br>
		<br>
		<b><a href = "index.jsp" > Exit </a>
		<a href = "price.jsp"> Price </a> </b>
		<%
	}
	else{
		out.println("Incorrect login or password. You must go to the registration page!");
		%>
		<br>
		<br>
		<b><a href = "index.jsp" > Try again </a></b>
		<%
	}%> 
	
</body>
</html>