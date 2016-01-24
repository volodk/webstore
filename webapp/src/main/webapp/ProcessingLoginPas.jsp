<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
			
	if (login == null) {
		login = "";
	}
	if (password == null) {
		password = "";
	}
	
	session.setAttribute("login", login);
	session.setAttribute("password", password);
	%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
	<%	
	if (login.equals("") & password.equals("")){ 
	%>
		<jsp:forward page="AuthError.jsp"/>
	<%
	}
	else{
	%>  
		<jsp:forward page="Catalog.jsp"/>
	<%
	}
	%>	
</body>

</html>