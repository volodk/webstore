<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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


<body link="yellow" alink="yellow" vlink="yellow">
	
	<center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<table width="300" cellpadding="15" border=6 align="center" cellspacing=0>
			<br>
			<br>
			
			<!-- <Caption>
				<font size=5.5"  color=#d8d4d4 >
					<b>				
						User authorization
					</b>	
				</font>			
			</Caption>	 -->	
			<form method="post" action="ProcessingLoginPas.jsp">
				<tr bgcolor=#dff7cd>
					<th align="left">
						Login: <input id="login" type="text" name="login" size=23>
					</th>
				</tr>
	
				<tr bgcolor=#dff7cd>
					<th align="left">
						Password: <input type="password" name="password">
					</th>
				</tr>
					
				<tr bgcolor=#dff7cd>
					<td align="center">
						<input type="submit" value="submit">
						<input type="button" value="cancel ">
					</td>
				</tr> 
			</form>
		</table>
			
	</center>


</body>


</html>