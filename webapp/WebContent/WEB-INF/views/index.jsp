<%@page import="java.io.PrintStream"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList" import="java.util.List"%>
<%@page
	import="java.io.File, com.ksoft.model.DataBase, com.ksoft.model.Category, com.ksoft.model.Good, java.sql.Connection, com.ksoft.interfaces.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	String userName = "";
	String userLastName = "";
	String cardNumber = "";
	String userId = "";
	String [] userInfo = new String[4];
	String [] topLevelCategories = new String[10];
		
	ServletContext sContext = getServletConfig().getServletContext();
	
	IDataBase dBClass = new DataBase();
	Connection conDB;
	
	userId = (String) session.getAttribute("userId");

	if (userId == null) {
		userId = "";
	}
	
	conDB = dBClass.getConnectionPostgresql();
	
	List<ICategory> categories = new ArrayList<ICategory>();
	ICategory strCategory;
	topLevelCategories = (String [])sContext.getAttribute("topLevelCategories");
	categories = (List<ICategory>)sContext.getAttribute("categories");
	String category;
	
	int i;
	String categoryName;
	String tab;
	String title;
	
	List<IGood> goods = new ArrayList<IGood>();
	goods = (List<IGood>)sContext.getAttribute("goods");
	IGood strGood;
		
	String checkedTab = (String)request.getParameter("checkedTab");
	int checkedTabInt = 0;
	
	if (checkedTab != null){
		checkedTabInt = Integer.parseInt(checkedTab);}
	else{
			checkedTab = "0";
			checkedTabInt = 0;
		}
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css">

<title>Fauna Webstore</title>
</head>


<body link="orange" alink="orange" vlink="orange">


	<div id="header">
		<table align="center" border="0" width=100%
			background="images/texture7.jpg">

			<!--First row-->

			<tr>
				<td width="150"></td>

				<td align="left" width="80"><a href="about.jsp"
					style="text-decoration: underline;"> About us </a></td>
				<td align="left" width="70"><a href="delivery.jsp"
					style="text-decoration: underline;"> Delivery </a></td>
				<td align="left" width="70"><a href="contacts.jsp"
					style="text-decoration: underline;"> Contacts </a></td>
				<td></td>

				<%
					if (userId.equals("") || (userId.equals(null))) {
				%>
				<td align="right" width="60"><a
					href="AuthenticationPageServlet"
					style="text-decoration: underline;"> Entry </a></td>
				<td width="15"></td>

				<td align="right" width="60"><a href="RegistrationPageServlet"
					style="text-decoration: underline;"> Registration </a></td>
				<td width="150"></td>
				<%
					} else {
				%>
				<td align="right" width="250"><font color="white"> <strong>
							<%																					
								userInfo = dBClass.getUserInfo(userId, conDB);
							    userName = userInfo[1];
							    userLastName = userInfo[2];
							    cardNumber = userInfo[3];
								
							    out.print(userName + " " + userLastName);
							%>
					</strong>
				</font> <font color="gray"> (club card:<%out.print(cardNumber); %>)
				</font></td>
				<%try{
								conDB.close();
							} catch ( SQLException e ) {
								e.printStackTrace();    
							} %>
				<td align="right" width="60"><a href="MainPageServlet?exit=1"
					style="text-decoration: none;"> Exit </a></td>

				<td align="right" width="80"><a href="RegistrationPageServlet"
					style="text-decoration: underline;"> My profile </a></td>
				<td width="150"></td>
				<%
					}
				%>


			</tr>

		</table>

		<table height="170" align="center" border="0" width=100%
			background="images/texture7.jpg">
			<!-- Second row-->
			<tr>
				<td width="150"></td>
				<td align="left" width="131" height="135"><a
					href="MainPageServlet?exit=1" style="text-decoration: none;"> <img
						alt="" src="images/logo_trans.png" border="0">
				</a></td>
				<!-- <td width="20" ></td> -->
				<td align="center">
					<form action="" method="post" class="search">
						<div class="box">
							<div class="container-1">
								<span class="icon"><i class="fa fa-search"></i></span> <input
									type="search" id="search" placeholder="Search..." />
							</div>
						</div>
					</form>
				</td>
				<td></td>
				<td align="left" width="100"><a href="basket.jsp"
					style="text-decoration: none; color: #6bc413"> <img alt=""
						src="images/basket_35.png" border="0"> Basket
				</a></td>

				<td width="150"></td>
			</tr>
		</table>

	</div>

	<div>
		<table align="center" border="0" width=100%>

			<tr>
				<td width="150"></td>
				<td align="left">

					<div class="tabs">

						<% i = 0;
						while (topLevelCategories[i]!="" && topLevelCategories[i]!=null) {
							categoryName = topLevelCategories[i];
							tab = "tab";
							tab = tab.concat(Integer.toString(i+1));
						%>

						<input id=<%=tab%> type="radio" name="tabs"
							<% if (i==checkedTabInt){%> checked <%}%>> <label
							for=<%=tab%> title=<%=tab%>><%=categoryName%></label>

						<%i++;
						}%>

						<%i = 0;
						  						  
						while (topLevelCategories[i]!="" && topLevelCategories[i]!=null) {
							categoryName = "content";
							categoryName = categoryName.concat(Integer.toString(i+1));
																					
							%>
						<section id=<%=categoryName%>>

						<table align="left" border="0" width=160px>
							<tr>
								<td width="170">


									<div id="categories" align="left">

										<ul class="border" style="width: 160px">
											<%for (int j=0; j<categories.size(); j++){
													strCategory = categories.get(j);
														
													if (strCategory.getParentCategoryName() != null){								
														if (strCategory.getParentCategoryName().equals(topLevelCategories[i])){
															categoryName = strCategory.getCategoryName(); %>


											<%checkedTabInt = i;
															checkedTab = Integer.toString(checkedTabInt);
															%>

											<li><a
												href="MainPageServlet?selectedCategory=<%=Integer.toString(strCategory.getCategoryId())%>&&checkedTab=<%=checkedTab%>"
												style="color: black; text-decoration: none;"> <%=categoryName%>
											</a></li>


											<% }
													}
																						
												} %>
										</ul>
									</div>
								</td>
						</table>

						<table border=0>
							<div id="products" align="left">
								<%
											int y = 1;
											%>
								<tr>
									<%
											
											if (goods !=null){
												for (int m=0; m<goods.size(); m++){
													strGood = goods.get(m);
													
													if (y<= 5){
													%>
									<td width="125"
										style="text-align: center; vertical-align: top; padding: 40px;">
										<%}else{
														%>
									
								</tr>
								<%
													y = 1;
													%>
								<tr>
									<td width="125"
										style="text-align: center; vertical-align: top; padding: 40px;">
										<%} %> 
										<b style="color: #006600"><%=strGood.getBrandName()%></b> <img
										src="ImageRetrieveServlet?imageId=<%=strGood.getGoodId()%>"
										width="125" height="170" border="0"> <b><%=strGood.getName()%></b>

									</td>

									<%
													y++;
												}
												goods = null;
											}							
											%>
								</tr>
							</div>



							</tr>
						</table>
						</section>

						<%i++;
							
						}%>

					</div>

				</td>
				<td width="150"></td>
			</tr>
		</table>
	</div>
</body>

</html>