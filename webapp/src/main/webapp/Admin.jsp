<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.ArrayList" %>
<%@ page import="webapp.AdminsInfo" %>
	
	
<%
AdminsInfo strAdmins = new AdminsInfo();

String adminForm = (String)request.getAttribute("adminForm");
String adminName = (String)session.getAttribute("adminName");
String adminLastName = (String)session.getAttribute("adminLastName");
String superAdmin = (String)session.getAttribute("superAdmin");
String newAdmin = (String)request.getAttribute("newAdmin");
String modAdmin = (String)request.getAttribute("modAdmin");
String newGood = (String)request.getAttribute("newGood");
String modGood = (String)request.getAttribute("modGood");
String fieldsFilligExeption = (String)request.getAttribute("fieldsFilligExeption"); 
String loginIsFree = (String)request.getAttribute("loginIsFree");
String adminReg = (String)request.getAttribute("adminReg");
ArrayList<AdminsInfo> adminsTable = (ArrayList<AdminsInfo>)session.getAttribute("adminsTable");
   
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
		superAdmin = "0";
}
	
	if (newAdmin == null) {
		newAdmin = "";
}	
	if (modAdmin == null) {
		modAdmin = "";
}	
	if (newGood == null) {
		newGood = "";
}	
	if (modGood == null) {
		modGood = "";
}	
	if (fieldsFilligExeption == null) {
		fieldsFilligExeption = "";				
}
	
	if (loginIsFree == null) {
		loginIsFree = "";	
}
	if (adminReg == null) {
		adminReg = "";
}
	
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin page</title>
	
	<style type="text/css">
    body {
    background-image: url(backgrounds/fon2.jpg);
	background-attachment: fixed;
	background-position: center;
    font-family: Arial, Helvetica, sans-serif; /* Рубленый шрифт текста */
    margin: 0; /* Обнуляем отступы браузера */
   }
    #head { /* Верхний блок */
     padding: 10px; /* Поля вокруг */
   }
   #menu { /* Левая колонка */
    float: left; /* Обтекание справа */
    width: 190px; /* Ширина колонки */
    padding: 5px; /* Поля вокруг текста */
    margin: 10px 10px 20px 5px; /* Значения отступов */
   }
   #menu div {
    padding: 2px; /* Поля вокруг ссылок */
   }
   #menu a { 
    display: block; /* Отображать ссылку как блок */
    padding: 2px; /* Поля вокруг ссылок */
    margin: 1px; /* Отступы вокруг */
    font-size: 0.9em; /* Размер текста */
    text-decoration: none; /* Убираем подчеркивание текста */
   }
   #menu a:hover { 
    background: #636363; /* Цвет фона */
    border: 1px dashed #636363; /* Добавление пунктирной рамки */
    margin: 0; /* Убираем поля */
   }
   #content { /* Правая колонка */
    margin: 10px 5px 20px 225px; /* Значения отступов */
    padding: 5px; /* Поля вокруг текста */
    color: #fff; /* Цвет текста */
        
   }
   .line {
    border-bottom: 1px groove #D6D6D6; /* Линия между ссылками */
   }
     
   #foot { /* Нижний блок */
    background: #333; /* Цвет фона */
    padding: 5px; /* Поля вокруг текста */
    color: #fff; /* Цвет текста */
    clear: both; /* Отменяем обтекание */
    margin-top: 50%;
   }
	</style>
</head>


<body link="white" alink="white" vlink="white">
	
	<center>
				
		<%
		if (adminForm.equals("1") & (newAdmin.equals("")|newAdmin==null) 
				& (modAdmin.equals("")|modAdmin==null)
				& (newGood.equals("")|newGood==null)
				& (modGood.equals("")|modGood==null)){
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
		
		
		
		
		
		
		/*Блок по редактированию данных админов*/
		<%
		} else if (!adminName.equals("") & (!adminName.equals(null)) & (modAdmin.equals("1"))){			
		%>

		<div id="head">
			<table width="100%">
				<td align="left" width="250"><font color="white"> <strong>
							<%
								out.print(adminName);
							%>
					</strong> <strong>
							<%
								out.print(adminLastName);
							%>
					</strong>
				</font></td>

				<td align="right"><a href="Main?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="Admin?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="Admin?modAdmin=1">Modify administrator profile</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="Admin?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="Admin?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="600" cellpadding="10" cellspacing=0 bordercolor="whitw" border="1">
					<tr>
						<td>Name</td>
						<td>Last name</td>
						<td>Login</td>
						<td>Password</td>
						<td>Super</td>
					</tr>
					<%for (int i=0; i< adminsTable.size(); i++){%>
					<tr>	
						<td>
						<%strAdmins = adminsTable.get(i);%>
						<%out.print(strAdmins.adminName);%>
						</td>
					</tr>
					<%}%>
													
			</table>		
		</div>
		<div id="foot">Copyright &copy; Klymenko Sergii</div>
		
		
		/* Блок работы с созданием нового админа*/
		<%
		} else if (!adminName.equals("") & (!adminName.equals(null)) & (newAdmin.equals("1"))){			
		%>

		<div id="head">
			<table width="100%">
				<td align="left" width="250"><font color="white"> <strong>
							<%
								out.print(adminName);
							%>
					</strong> <strong>
							<%
								out.print(adminLastName);
							%>
					</strong>
				</font></td>

				<td align="right"><a href="Main?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="Admin?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="Admin?modAdmin=1">Modify administrator profile</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="Admin?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="Admin?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="400" cellpadding="10" cellspacing=0>
				<form method="post" action="Admin">
					<tr>
						<th align="center">
							<font size="4"> Registration form</font>
						</th>
					</tr>
					
					<tr>
						<th align="left" >
							First name(*): <input type="text" name="newAdminName" style="width: 68%;">
						</th>
					</tr>
					<tr>	
						<th align="left">
							Last name(*): <input type="text" name="newAdminLastName" style="width: 68%;">
						</th>
					</tr>
					<tr>
						<th align="left">
							Login(*): <input type="text" name="newAdminLogin" style="width: 78%;">
						</th>
					</tr>
					<tr>	
						<th align="left">
							Password(*): <input type="password" name="newAdminPassword" style="width: 69%;">
						</th>
					</tr>
					<tr>	
						<th align="left">
							Super admin: <input type="checkbox" name="newSuperAdmin" value="1" style="width: 5%;">
						</th>
					</tr>
					<tr>
						<th align="left">
							<font size="2" style="font-style: normal;"> * - Fields, that must be filled out </font>
						</th>
					</tr>
											
					<input type="hidden" name="adminForm" value="1">
					<input type="hidden" name="fieldsFilligExeption" value="">
					<input type="hidden" name="loginIsFree" value="">
					<input type="hidden" name="newAdmin" value="2">
					<input type="hidden" name="modAdmin" value="">
					<input type="hidden" name="newGood" value="">
					<input type="hidden" name="modGood" value="">					
											
					<tr>
						<td align="right">
							<input type="submit" value="Register">
						</td>
					</tr>
				 </form>
				
			</table>		
		</div>
		<div id="foot">Copyright &copy; Klymenko Sergii</div>
		
		
		<%
		} else if (!adminName.equals("") & !adminName.equals(null) & newAdmin.equals("2") & fieldsFilligExeption.equals("1")){			
		%>
		
		<div id="head">
			<table width="100%">
				<td align="left" width="250"><font color="white"> <strong>
							<%
								out.print(adminName);
							%>
					</strong> <strong>
							<%
								out.print(adminLastName);
							%>
					</strong>
				</font></td>

				<td align="right"><a href="Main?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="Admin?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="Admin?modAdmin=1">Modify administrator profile</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="Admin?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="Admin?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="100%" cellpadding="10" cellspacing=0>
				<form method="post" action="Admin">
					<tr>
						<th align="left">
							<font size="4"> All fields marked with (*) must be filled out!</font>
						</th>
					</tr>
																				
					<input type="hidden" name="adminForm" value="1">
					<input type="hidden" name="fieldsFilligExeption" value="">
					<input type="hidden" name="loginIsFree" value="">
					<input type="hidden" name="newAdmin" value="1">
					<input type="hidden" name="modAdmin" value="">
					<input type="hidden" name="newGood" value="">
					<input type="hidden" name="modGood" value="">	
											
					<tr>
						<td align="left">
							<input type="submit" value="Try again">
						</td>
					</tr>
				 </form>
				
			</table>		
		</div>
		<div id="foot">Copyright &copy; Klymenko Sergii</div>
		
		
		<%
		} else if (!adminName.equals("") & !adminName.equals(null) & newAdmin.equals("2") & !loginIsFree.equals("1")){			
		%>
		
		<div id="head">
			<table width="100%">
				<td align="left" width="250"><font color="white"> <strong>
							<%
								out.print(adminName);
							%>
					</strong> <strong>
							<%
								out.print(adminLastName);
							%>
					</strong>
				</font></td>

				<td align="right"><a href="Main?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="Admin?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="Admin?modAdmin=1">Modify administrator profile</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="Admin?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="Admin?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="100%" cellpadding="10" cellspacing=0>
				<form method="post" action="Admin">
					<tr>
						<th align="left">
							<font size="4"> The login already has an account under a different administrator name!</font>
						</th>
					</tr>
																				
					<input type="hidden" name="adminForm" value="1">
					<input type="hidden" name="fieldsFilligExeption" value="">
					<input type="hidden" name="loginIsFree" value="">
					<input type="hidden" name="newAdmin" value="1">
					<input type="hidden" name="modAdmin" value="">
					<input type="hidden" name="newGood" value="">
					<input type="hidden" name="modGood" value="">	
											
					<tr>
						<td align="left">
							<input type="submit" value="Try again">
						</td>
					</tr>
				 </form>
				
			</table>		
		</div>
		<div id="foot">Copyright &copy; Klymenko Sergii</div>
		
		
		
		<%
		} else if (!adminName.equals("") & !adminName.equals(null) & newAdmin.equals("2") & adminReg.equals("1")){			
		%>
		
		<div id="head">
			<table width="100%">
				<td align="left" width="250"><font color="white"> <strong>
							<%
								out.print(adminName);
							%>
					</strong> <strong>
							<%
								out.print(adminLastName);
							%>
					</strong>
				</font></td>

				<td align="right"><a href="Main?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="Admin?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="Admin?modAdmin=1">Modify administrator profile</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="Admin?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="Admin?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="100%" cellpadding="10" cellspacing=0>
				<form method="post" action="Admin">
					<tr>
						<th align="left">
							<font size="4"> Successfully registered!</font>
						</th>
					</tr>
																				
					<input type="hidden" name="adminForm" value="1">
					<input type="hidden" name="fieldsFilligExeption" value="">
					<input type="hidden" name="loginIsFree" value="">
					<input type="hidden" name="newAdmin" value="1">
					<input type="hidden" name="modAdmin" value="">
					<input type="hidden" name="newGood" value="">
					<input type="hidden" name="modGood" value="">	
											
					<tr>
						<td align="left">
							<input type="submit" value="Ok">
						</td>
					</tr>
				 </form>
				
			</table>		
		</div>
		<div id="foot">Copyright &copy; Klymenko Sergii</div>
		
		
		
		<%
		} else if (!adminName.equals("") & (!adminName.equals(null))){			
		%>

		<div id="head">
			<table width="100%">
				<td align="left" width="250"><font color="white"> <strong>
							<%
								out.print(adminName);
							%>
					</strong> <strong>
							<%
								out.print(adminLastName);
							%>
					</strong>
				</font></td>

				<td align="right"><a href="Main?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="Admin?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="Admin?modAdmin=1">Modify administrator profile</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="Admin?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="Admin?modGood=1">Modify goods</a>
			</div>
		</div>
		<div id="content" >
		</div>
		<div id="foot">Copyright &copy; Klymenko Sergii</div>





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