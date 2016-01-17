<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Catalog</title>
	
	<style>
		a{text-decoration: none
		}
	</style>
</head>

<body link="black" alink="black" vlink="black">
	
	<%String realLogin = "admin"; 
	String realPass = "admin";
	
	String login=(String) session.getAttribute("login");
	if(login==null){
	login="";
	}
	
	String password=(String) session.getAttribute("password");
	if(password==null){
	password="";
	}
	
	if (!login.equals(realLogin) | !password.equals(realPass)){
	%>	
		<table align="right">
			<th>
				<font size="3">
					<a href="login.jsp"> Authorization </a>
				</font>
			</th>
		</table>
	<%	
	}	
	else{
	%>
		<table align="right">
			<th>
				<font size="3">
					<a href="logOff.jsp"> LogOff </a>
				</font>
			</th>
		</table>
		
	<%
	}
	%>
			
	<table border="1">
	
		<tr>
			<td> Item </td>
			<td> Price </td>
		</tr>
		
		<tr>
		</tr>
	
	</table>
	
	<br>
	<br>
	
	<b>
		<a href = "index.jsp" > Back to home page </a>
	</b>

</body>

</html>