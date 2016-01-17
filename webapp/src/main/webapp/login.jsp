<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login form</title>
	
	<style>
		body {
			background-image: url(BackLogin.jpg);
			background-attachment: fixed;
			background-position: center;	
		}
		
		a{text-decoration: none
		}
	</style>
</head>


<body link="yellow" alink="yellow" vlink="yellow">
	
	<font size=4>
		<b>
			<a href="index.jsp"> Back to home page </a>
		</b>	
	</font>
	
	
	<center>
		
		<table cellpadding="10" border=10 align="center" cellspacing=0>
			<br>
			<br>
			
			<Caption>
				<font color="lightBlue" size=5.5>
					<b>				
						User authorization
					</b>	
				</font>			
			</Caption>		
			<form method="post" action="processedLoginPas.jsp">
				<tr bgcolor="#CCCCFF">
					<th align="left">
						Login: <input id="login" type="text" name="login"	size=23>
					</th>
				</tr>
	
				<tr bgcolor="#CCCCFF">
					<th align="left">
						Password: <input type="password" name="password">
					</th>
				</tr>
					
				<tr bgcolor="#CCCCFF">
					<td align="center">
						<input type="submit" value="submit">
					</td>
				</tr> 
			</form>
		</table>
			
	</center>


</body>


</html>