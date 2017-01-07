<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%String regForm = (String)request.getAttribute("regForm");
  String fieldsFilligExeption = (String)request.getAttribute("fieldsFilligExeption"); 
  String loginIsFree = (String)request.getAttribute("loginIsFree");
  String userReg = (String)request.getAttribute("userReg");
  
	if (regForm == null) {
		regForm = "";
	}	
	
	if (fieldsFilligExeption == null) {
		fieldsFilligExeption = "";				
	}
	
	if (loginIsFree == null) {
		loginIsFree = "";	
	}
	
	if (userReg == null) {
		userReg = "";	
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
			
			if (fieldsFilligExeption.equals("1")) {		
		%>
		
		 	<table width="300" cellpadding="15" align="center">
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				
				<form method="post" action="RegistrationPageServlet">
					
					<tr bgcolor=#dff7cd>
						<th align="ctnter"> 
							All fields marked with (*) must be filled out!
				 		</th>
					</tr>
					
					<input type="hidden" name="regForm" value="">
					<input type="hidden" name="fieldsFilligExeption" value="">
					<input type="hidden" name="loginIsFree" value="">
					<input type="hidden" name="userReg" value="">
										
					<tr  bgcolor=#dff7cd>								
						<th align="ctnter">
							<input type="submit" value="Back to registration form">
						</th>	
					</tr>	 
				</form>
			</table> 
			<%}else if (!loginIsFree.equals("1")) {		
				%>
				
				 <table width="300" cellpadding="15" align="center">
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					
					<form method="post" action="RegistrationPageServlet">
						
						<tr bgcolor=#dff7cd>
							<th align="ctnter"> 
								The login already has an account under a different user name!
							</th>
						</tr>
						
						<input type="hidden" name="regForm" value="">
						<input type="hidden" name="fieldsFilligExeption" value="">
						<input type="hidden" name="loginIsFree" value="">
						<input type="hidden" name="userReg" value="">
						
						<tr  bgcolor=#dff7cd>								
							<th align="ctnter">
								<input type="submit" value="Back to registration form">
							</th>	
						</tr>	 
					</form>
				</table> 
			  
		<%}else if (userReg.equals("1")) {	
			
		%>
			
			 <table width="300" cellpadding="15" align="center">
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					
					<form method="post" action="MainPageServlet">
						
						<tr bgcolor=#dff7cd>
							<th align="ctnter"> 
								You have successfully registered and logged in.
							</th>
						</tr>
						
						<input type="hidden" name="regForm" value="">
						<input type="hidden" name="fieldsFilligExeption" value="">
						<input type="hidden" name="loginIsFree" value="">
						<input type="hidden" name="userReg" value="">
												
						<tr  bgcolor=#dff7cd>								
							<th align="ctnter">
								<input type="submit" value="Ok">
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
				
				<form method="post" action="MainPageServlet">
					<tr bgcolor=#dff7cd>
						<th align="center">
							<font size="4"> Registration form</font>
						</th>
					</tr>
					<tr bgcolor=#dff7cd>
						<th align="left">
							First name(*): <input type="text" name="userName" style="width: 65%;">
						</th>
					</tr>
					<tr bgcolor=#dff7cd>	
						<th align="left">
							Last name(*): <input type="text" name="userLastName" style="width: 66%;">
						</th>
					</tr>
					<tr bgcolor=#dff7cd>
						<th align="left">
							Mail(*): <input type="text" name="mail" style="width: 78.5%;">
						</th>
					</tr>
					<tr bgcolor=#dff7cd>
						<th align="left">
							Login(*): <input type="text" name="login" style="width: 76%;">
						</th>
					</tr>
					<tr bgcolor=#dff7cd>	
						<th align="left">
							Password(*): <input type="password" name="password" style="width: 68%;">
						</th>
					</tr>
					<tr bgcolor=#dff7cd>	
						<th align="left">
							Club card number: <input type="text" name="cardNumber" style="width: 55%;">
						</th>
					</tr>
					<tr bgcolor=#dff7cd>
						<th align="left">
							<font size="2" style="font-style: normal;"> * - Fields, that must be filled out </font>
						</th>
					</tr>
											
					<input type="hidden" name="regForm" value="1">
					<input type="hidden" name="fieldsFilligExeption" value="">
					<input type="hidden" name="loginIsFree" value="">
					<input type="hidden" name="userReg" value="">
						
					<tr bgcolor=#dff7cd>
						<td align="center">
							<input type="submit" value="Register">
						</td>
					</tr>
				 </form>
				 <form method="post" action="MainPageServlet">
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