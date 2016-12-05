<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%String authForm = (String)request.getAttribute("authForm");
   
	if (authForm == null) {
		authForm = "";
}
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
   TABLE {
    border: 3px solid black; /* Рамка вокруг таблицы */
   }
 </style>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login form</title>
	
	<style>
		body {
			background-image: url(backgrounds/texture3.jpg);
			background-attachment: fixed;
			background-position: center;
				
		}
		
		a{text-decoration: none
		}
	</style>
</head>


<body>
	
	<center>
		<br>
		<br>
		<br>
	
		
		
		<%
		if (authForm.equals("1")){
		%>
		
		<table width="300" cellpadding="15" align="center">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>			
			<form method="post" action="Auth">
						
				<tr bgcolor=#dff7cd>
					<th align="ctnter">
						Wrong login or password.
					</th>
				</tr>
				
				<input type="hidden" name="authForm" value="">
				
				<tr  bgcolor=#dff7cd>								
					<th align="ctnter">
						<input type="submit" value="Back to login form">
					</th>	
				</tr>	 
			</form>
		</table>
		
		<%
		} else {
		%>	

		<table width="300" cellpadding="15"  align="center" cellspacing=0>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			
			<form method="post" action="Main">
				<tr bgcolor=#dff7cd>
					<th align="left">
						Login: <input type="text" name="login" size=28>
					</th>
				</tr>
	
				<tr bgcolor=#dff7cd>
					<th align="left">
						Password: <input type="password" name="password" size=25>
					</th>
				</tr>
					
				<input type="hidden" name="authForm" value="1">
					
				<tr bgcolor=#dff7cd>
					<td align="center">
						<input type="submit" value="Log in">
					</td>
				</tr>
			 </form>
			 <form method="post" action="Main">
				<tr bgcolor=#dff7cd align="right">
					<th align="right">
						<input type="image" src="Images/back.png">
					</th>
				</tr>
			</form>
		</table>
			
		<%
		}
		%>			
	</center>


</body>


</html>