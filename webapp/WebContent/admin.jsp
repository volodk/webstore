<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.ArrayList" 
		 import="java.util.List"%>
<%@ page import="com.ksoft.Admins" %>
	
	
<%
Admins strAdmins = new Admins();

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
String adminUpd = (String)request.getAttribute("adminUpd");
String deleteAdmin = (String)request.getAttribute("deleteAdmin");

Admins strModAdmin = new Admins();
ServletContext sContext = getServletConfig().getServletContext();
/*strModAdmin = (Admins)session.getAttribute("strModAdmin");*/
strModAdmin = (Admins)sContext.getAttribute("strModAdmin");

List<Admins> adminsTable = new ArrayList<Admins>();
/*adminsTable = (List<Admins>)session.getAttribute("adminsTable");*/
adminsTable = (List<Admins>)sContext.getAttribute("adminsTable");


String strChecked = "0";

if (strModAdmin!=null){
	strChecked = Integer.toString(strModAdmin.superAdmin);
}


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
	if (adminUpd == null) {
		adminUpd = "";
}
	if (deleteAdmin== null) {
		deleteAdmin = "";
}	
	
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
	
	<title>Admin page</title>
	
	
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
			<form method="post" action="AdminPageServlet">
						
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
		
		
		
		
		
		
<!-- 		Блок по редактированию данных админов -->
		<%
		} else if (!adminName.equals("") & (!adminName.equals(null)) & (modAdmin.equals("1"))){			
		%>
		
		<%if(adminUpd.equals("1")){%>
			
				<div id="parent_popup">
				  <div id="popup">
				    <p> Admin info modificated sucessfully!</p>
				    <p  style="cursor: pointer; font-weight: bold;" onclick="document.getElementById('parent_popup').style.display='none';">Close</p>
				  </div>
				</div>
			
		<%}%>	
		
		<%if(deleteAdmin.equals("sucessfull")){%>
			
				<div id="parent_popup">
				  <div id="popup">
				    <p> Admin deleted sucessfully!</p>
				    <p  style="cursor: pointer; font-weight: bold;" onclick="document.getElementById('parent_popup').style.display='none';">Close</p>
				  </div>
				</div>
			
		<%}%>	
		
		<%if(deleteAdmin.equals("error")){%>
			
				<div id="parent_popup">
				  <div id="popup">
				    <p> Error deleting admin!</p>
				    <p  style="cursor: pointer; font-weight: bold;" onclick="document.getElementById('parent_popup').style.display='none';">Close</p>
				  </div>
				</div>
			
		<%}%>	
			
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

				<td align="right"><a href="MainPageServlet?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="AdminPageServlet?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="AdminPageServlet?modAdmin=1">Modify administrators profiles</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="AdminPageServlet?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="AdminPageServlet?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<form method="post" action="AdminPageServlet" onsubmit='return confirm("Confirm?");'>
			<table align="left" width="600" cellpadding="10" cellspacing=0>
					<tr style="text-decoration: underline;">
						<td></td>
						<td><strong>Name</strong></td>
						<td><strong>Last name</strong></td>
						<td><strong>Login</strong></td>
						<td><strong>Password</strong></td>
						<td><strong>Super</strong></td>
					</tr>
					
					<%for (int i=0; i< adminsTable.size(); i++){
					strAdmins = adminsTable.get(i);%>
					<tr>	
						<td style="border-style: hidden;">
						<input type="radio" name="checkAdmin" value=<%=i%>>
						</td>					
						<td style="border-style: hidden;">
						<%out.print(strAdmins.adminName);%>
						</td>
						<td style="border-style: hidden;">
						<%out.print(strAdmins.adminLsatName);%>
						</td>
						<td style="border-style: hidden;">
						<%out.print(strAdmins.adminLogin);%>
						</td>
						<td style="border-style: hidden;">
						<%out.print(strAdmins.adminPassword);%>
						</td>
						<td style="border-style: hidden;">
						<%out.print(strAdmins.superAdmin);%>
						</td>
											
					</tr>
										
					<%}%>
				<tr>
					<td style="border-style: hidden;">
					</td>
					<td style="border-style: hidden;">
					</td>
					<td style="border-style: hidden;">
					</td>
					<td style="border-style: hidden;">
					</td>
					<td style="border-style: hidden;">
					<input align="right" type="submit" value="Delete" name="deleteAdmin">
					</td>
					<td style="border-style: hidden;">
					<input align="right" type="submit" value="Edit" name="editAdmin">
					</td>
				</tr>																					
			</table>
			
			<input type="hidden" name="adminForm" value="1">
			<input type="hidden" name="adminMod" value="">
			<input type="hidden" name="modAdmin" value="2">
			<input type="hidden" name="deleteAdmin" value="">
			
			</form>		
		</div>
		
		<div id="foot">Copyright &copy; Klymenko Sergii</div>
		
		
		
		
		
		<%
		} else if (!adminName.equals("") & (!adminName.equals(null)) & (modAdmin.equals("2"))){	
		%>

			<%if(fieldsFilligExeption.equals("1")){%>
			
				<div id="parent_popup">
				  <div id="popup">
				    <p> All fields must be filled out!</p>
				    <p  style="cursor: pointer; font-weight: bold;" onclick="document.getElementById('parent_popup').style.display='none';">Close</p>
				  </div>
				</div>
			
			<%}%>	
			
			<%if(loginIsFree.equals("2")){%>
			
				<div id="parent_popup">
				  <div id="popup">
				    <p> The login already has an account under a different administrator name!</p>
				    <p  style="cursor: pointer; font-weight: bold;" onclick="document.getElementById('parent_popup').style.display='none';">Close</p>
				  </div>
				</div>
			
			<%}%>	
		
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

				<td align="right"><a href="MainPageServlet?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="AdminPageServlet?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="AdminPageServlet?modAdmin=1">Modify administrators profiles</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="AdminPageServlet?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="AdminPageServlet?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="400" cellpadding="10" cellspacing=0>
				<form method="post" action="AdminPageServlet">
					<tr>
						<th align="center">
							<font size="4"> Modification form</font>
						</th>
					</tr>
					
					<tr>
						<th align="left" >
							First name: <input type="text" value=<%=strModAdmin.adminName%> name="oldAdminName" style="width: 71%;">
						</th>
					</tr>
					<tr>	
						<th align="left">
							Last name: <input type="text" value=<%=strModAdmin.adminLsatName%> name="oldAdminLastName" style="width: 71%;">
						</th>
					</tr>
					<tr>
						<th align="left">
							Login: <input type="text" value=<%=strModAdmin.adminLogin%> name="oldAdminLogin" style="width: 81%;">
						</th>
					</tr>
					<tr>	
						<th align="left">
							Password: <input type="text" value=<%=strModAdmin.adminPassword%> name="oldAdminPassword" style="width: 72%;">
						</th>
					</tr>
					<tr>	
						<th align="left">
							Super admin: <input type="checkbox" value = "1"  <%if (strChecked.equals("1")) {%> checked <%} %> name="oldSuperAdmin" style="width: 11%;">
						</th>
					</tr>
																
 					<input type="hidden" name="oldIdAdmin" value=<%=Integer.toString(strModAdmin.idAdmin)%>> 
					<input type="hidden" name="adminForm" value="1">
					<input type="hidden" name="modAdmin" value="3">
					<input type="hidden" name="fieldsFilligExeption" value="">
					<input type="hidden" name="loginIsFree" value="">
															
					<tr>
						<td align="right">
							<input type="submit" value="Modify">
						</td>
					</tr>
				 </form>
				 
			</table>		
		</div>
		
		<div id="foot">Copyright &copy; Klymenko Sergii</div>
		
		
		
				
		
		
<!-- 		 Блок работы с созданием нового админа -->
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

				<td align="right"><a href="MainPageServlet?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="AdminPageServlet?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="AdminPageServlet?modAdmin=1">Modify administrators profiles</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="AdminPageServlet?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="AdminPageServlet?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="400" cellpadding="10" cellspacing=0>
				<form method="post" action="AdminPageServlet">
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

				<td align="right"><a href="MainPageServlet?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="AdminPageServlet?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="AdminPageServlet?modAdmin=1">Modify administrators profiles</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="AdminPageServlet?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="AdminPageServlet?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="100%" cellpadding="10" cellspacing=0>
				<form method="post" action="AdminPageServlet">
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

				<td align="right"><a href="MainPageServlet?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="AdminPageServlet?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="AAdminPageServlet?modAdmin=1">Modify administrators profiles</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="AdminPageServlet?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="AdminPageServlet?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="100%" cellpadding="10" cellspacing=0>
				<form method="post" action="AdminPageServlet">
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

				<td align="right"><a href="MainPageServlet?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="AdminPageServlet?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="AdminPageServlet?modAdmin=1">Modify administrators profiles</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="AdminPageServlet?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="AdminPageServlet?modGood=1">Modify goods</a>
			</div>
		</div>
		
		<div id="content">
			<table align="left" width="100%" cellpadding="10" cellspacing=0>
				<form method="post" action="AdminPageServlet">
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

				<td align="right"><a href="MainPageServlet?exit=1"
					style="text-decoration: none;"> Exit </a></td>
			</table>

		</div>

		<div id="menu" align="left">
			<%if (superAdmin.equals("1")) {%>
			<div>
				<a href="AdminPageServlet?newAdmin=1">Create new administrator</a>
			</div>
			<div>
				<a href="AdminPageServlet?modAdmin=1">Modify administrators profiles</a>
			</div>
			<div class="line"></div>
			<%}%>
			<div>
				<a href="AdminPageServlet?newGood=1">Add new good</a>
			</div>			
			<div>
				<a href="AdminPageServlet?modGood=1">Modify goods</a>
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
		
		<table width="300" cellpadding="15"  align="center" cellspacing=0 style="color: black">
		
			
			<form method="post" action="AdminPageServlet">
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