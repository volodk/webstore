<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%String adminForm = (String)request.getAttribute("adminForm");
String adminName = (String)request.getAttribute("adminName");
String adminLastName = (String)request.getAttribute("adminLastName");
String superAdmin = (String)request.getAttribute("superAdmin");
   
	if (adminForm == null) {
		adminForm = "";
}
	
	if (adminName == null) {
		adminName = "";
}
	if (adminLastName == null) {
		adminLastName = "";
}
	
	if (superAdmin == null) {
		superAdmin = "false";
}

%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin page</title>
	
	<style>
		body {
			background-image: url(backgrounds/fon2.jpg);
			background-attachment: fixed;
			background-position: center;
				
		}
		
		a{text-decoration: none
		}
	</style>
</head>


<body link="white" alink="white" vlink="white">
	
	<center>
				
		<%
		if (adminForm.equals("1")){
		%>
		
		<table width="300" cellpadding="15" align="center">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>			
			<form method="post" action="Admin">
						
				<tr bgcolor=#bfbfbf>
					<th align="ctnter">
						Wrong login or password.
					</th>
				</tr>
				
				<input type="hidden" name="adminForm" value="">
				
				<tr  bgcolor=#bfbfbf>								
					<th align="ctnter">
						<input type="submit" value="Try again">
					</th>	
				</tr>	 
			</form>
		</table>
		
		<%
		} else if (!adminName.equals("") & (!adminName.equals(null))){			
		%>	
		<table align="center" border="0" width=100%>
			<tr>
							
				<td align="left" width="250">
					<font color="white" > 
						<strong><%out.print(adminName);%> </strong>
						<strong><%out.print(adminLastName);%> </strong>
					</font>					
				</td>
				
								
				<td align="right" width="60"><a href="Main?exit=1"
					style="text-decoration: underline;"> Exit </a>
				</td>
													
			</tr>
			
		</table>
		
		<%
		} else {
		%>	

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<table width="300" cellpadding="15"  align="center" cellspacing=0>
		
			
			<form method="post" action="Admin">
				<tr bgcolor=#bfbfbf>
					<th align="left">
						Login: <input type="text" name="login" size=28>
					</th>
				</tr>
	
				<tr bgcolor=#bfbfbf>
					<th align="left">
						Password: <input type="password" name="password" size=25>
					</th>
				</tr>
					
				<input type="hidden" name="adminForm" value="1">
					
				<tr bgcolor=#bfbfbf>
					<td align="center">
						<input type="submit" value="Log in">
					</td>
				</tr>
			 </form>
			
		</table>
			
		<%
		}
		%>			
	</center>


</body>


</html>