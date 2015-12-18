<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login form</title>
</head>
<body>

<form method = "post" action = "processedLoginPas.jsp">

<center>
<table cellpadding="10" border=10 align="center">

<th bgcolor = "#CCCCFF">
<font size=5>
User authorization form
</font> 
</th>

<tr bgcolor="#CCCCFF">
<th align="left">Login: <input type = "text" name = "login" size=23></th>
</tr>

<tr bgcolor="#CCCCFF">
<th align="left">Password: <input type = "password" name = "password"></th>

<tr bgcolor="#CCCCFF">
<th align="center"><input type = "submit" value = "submit"></th>

</tr>

</table>
</center>

</form>

</body>
</html>