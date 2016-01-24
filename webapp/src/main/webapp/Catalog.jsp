<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="webapp.AuthService" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Catalog</title>
	
	<style>
		body {
			background-image: url(backgrounds/Background.jpg);
			background-attachment: fixed;
			background-position: center;	
		}
		
		a{text-decoration: none
		}
	</style>
</head>

<body link="yellow" alink="yellow" vlink="yellow">	
	
	
	<%@include file = "AllowLoginPas.jsp"%>
	
	<%
	if (!authOk) {	
	%>
		<%@include file = "AuthVisible.jsp"%>
	<%	
	}
	else{
	%>	
		<%@include file = "LogOffVisible.jsp"%>
	<%	
	}%>	
	<font color="white"> 		
		<table border="1">
		
			<tr>
				<td> Item </td>
				<td> Price </td>
			</tr>
			
			<tr>
			</tr>
		
		</table>
	</font>	
	
	<br>
	<br>
	<b>
		<a href = "Basket.jsp" > Bascket </a>
	</b>
	<br>
	<br>
	<br>
	<center>
		<b>
			<a href = "Index.jsp" > Back to home page </a>
		</b>
	</center>

</body>

</html>