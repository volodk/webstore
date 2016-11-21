<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%String regForm = request.getParameter("regForm");
  String ffExeption = request.getParameter("ffExeption"); 
  String loginIsFree = request.getParameter("loginIsFree");
  
	if (regForm == null) {
		regForm = "";
	}	
	
	if (ffExeption == null) {
			ffExeption = "";				
	}
	
	if (loginIsFree == null) {
		loginIsFree = "";	
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
	<title>Registration form</title>
	
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
		if (regForm.equals("1")){
			
			if (ffExeption.equals("1")) {		
		%>
		
			<table width="300" cellpadding="15" align="center">
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				
				<form method="post" action="Reg">
					
					<tr bgcolor=#dff7cd>
						<th align="ctnter">
							All fields marked with (*) must be filled out!
						</th>
					</tr>
					
					<input type="hidden" name="regForm" value=null>
					
					<tr  bgcolor=#dff7cd>								
						<th align="ctnter">
							<input type="submit" value="Back to registration form">
						</th>	
					</tr>	 
				</form>
			</table>
			<%}else if (! loginIsFree.equals("1")) {		
				%>
				
				<table width="300" cellpadding="15" align="center">
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					
					<form method="post" action="Reg">
						
						<tr bgcolor=#dff7cd>
							<th align="ctnter">
								The login already has an account under a different user name!
							</th>
						</tr>
						
						<input type="hidden" name="regForm" value=null>
						
						<tr  bgcolor=#dff7cd>								
							<th align="ctnter">
								<input type="submit" value="Back to registration form">
							</th>	
						</tr>	 
					</form>
				</table>
			 <%} 
			
		} else {
			%>	
	
			<table width="350" cellpadding="10"  align="center" cellspacing=0>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				
				<form method="post" action="Main">
					<tr bgcolor=#dff7cd>
						<th align="center">
							<font size="4"> Registration form</font>
						</th>
					</tr>
					<tr bgcolor=#dff7cd>
						<th align="left">
							First name(*): <input type="text" name="userName" size=31>
						</th>
					</tr>
					<tr bgcolor=#dff7cd>	
						<th align="left">
							Last name(*): <input type="text" name="userLastName" size=31>
						</th>
					</tr>
					<tr bgcolor=#dff7cd>
						<th align="left">
							Login(*): <input type="text" name="login" size=36>
						</th>
					</tr>
					<tr bgcolor=#dff7cd>	
						<th align="left">
							Password(*): <input type="password" name="password" size=32>
						</th>
					</tr>
					<tr bgcolor=#dff7cd>	
						<th align="left">
							Club card number: <input type="text" name="cardNumber" size=25>
						</th>
					</tr>
					<tr bgcolor=#dff7cd>
						<th align="left">
							<font size="2" style="font-style: normal;"> * - Fields, that must be filled out </font>
						</th>
					</tr>
											
					<input type="hidden" name="regForm" value="1">
						
					<tr bgcolor=#dff7cd>
						<td align="center">
							<input type="submit" value="Register">
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