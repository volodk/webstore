<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	String userName = "";
	String cardNumber = "";
	userName = (String) session.getAttribute("name");
	cardNumber = (String) session.getAttribute("card");

	if (userName == null) {
		userName = "";
	}
	if (cardNumber == null) {
		cardNumber = "";
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">

<title>Webstore</title>
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
					if (userName.equals("") | (userName.equals(null))) {
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
								out.print(userName);
							%>
					</strong>
				</font> <font color="gray"> (club card:<%out.print(cardNumber); %>)
				</font></td>

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
			<!-- Third row-->
			<tr>
				<td width="150"></td>
				<td align="left">

					<div class="tabs">
						<input id="tab1" type="radio" name="tabs" checked> <label
							for="tab1" title="Вкладка 1">Cats</label> <input id="tab2"
							type="radio" name="tabs"> <label for="tab2"
							title="Вкладка 2">Dogs</label> <input id="tab3"
							type="radio" name="tabs"> <label for="tab3"
							title="Вкладка 3">Rodents</label> <input id="tab4"
							type="radio" name="tabs"> <label for="tab4"
							title="Вкладка 4">Fishes</label>

						<section id="content1">
						<p>tab 1....</p>
						</section>
						<section id="content2">
						<p>tab 2....</p>
						</section>
						<section id="content3">
						<p>tab 3....</p>
						</section>
						<section id="content4">
						<p>Tab 4....</p>
						</section>
					</div>


				</td>
				<td width="150"></td>
			</tr>
		</table>
	</div>
</body>

</html>