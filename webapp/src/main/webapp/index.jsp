<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Webstore</title>
 
	<style>
		body {
			background-image: url(BackGround.jpg);
			background-attachment: fixed;
			background-position: center;	
		}
		
		a{text-decoration: none
		}
	</style>
</head>


<body link="yellow" alink="yellow" vlink="yellow">	
	
	<table align="center" >
		<th>
			<font size="16" color="white" >
				WEB Store
			</font>	
		</th>
	</table>
	
	<br>
	<br>
	<br>
	<br>
	
	<table align="left">
		<th>
			<font size="5" dir="ltr" >
				<a href = "catalog.jsp">
					&nbsp 
						Catalog 
					&nbsp 
				</a>
			<font>
			
		</th>		
	</table>
	<%	
	String realLogin = "admin"; 
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
			<a href="login.jsp"> Authorization </a>
		</th>
	</table>	
	<%
	}
	else{
	%>	
	<table align="right">
		<th>
			<a href="logOff.jsp"> logOff </a>
		</th>
	</table>
	<%	
	}%>	
</body>

</html>