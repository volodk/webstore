<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Webstore</title>
<style>

/*Стиль вкладкок*/
.notebook2 {
	width: 640px;
	height: 450px;
	position: relative;
}

.notebook2>input {
	display: none;
}

.notebook2>div {
	position: absolute;
	box-sizing: border-box;
	top: 300px;
	left: 0px;
	bottom: 0px;
	right: 0px;
	border-radius: 10px;
	padding: 0px 1em;
	z-index: 0;
	background-color: #666;
	transition: all 0.5s ease 0s, z-index 0s 0.5s;
}

.notebook2>div>*:first-child {
	display: block;
	position: absolute;
	box-sizing: border-box;
	top: -30px;
	width: 150px;
	height: 30px;
	font-family: Arial;
	font-size: 13px;
	border-radius: 10px 10px 0px 0px;
	background-color: inherit;
	color: #fff;
	line-height: 28px;
	cursor: pointer;
	text-align: center;
	transition: all 0.5s ease 0s;
}

.notebook2>div>*:not (:first-child ) {
	opacity: 0;
	transition: all 0.5s ease 0s;
}

.notebook2>div:nth-of-type(1)>*:first-child {
	left: 230px;
}



.notebook2>input:nth-of-type(1):checked ~ div:nth-of-type(1), .notebook2>input:nth-of-type(2):checked 
	~ div:nth-of-type(2), .notebook2>input:nth-of-type(3):checked ~ div:nth-of-type(3),
	.notebook2>input:nth-of-type(4):checked ~ div:nth-of-type(4) {
	z-index: 10;
	background-color: #ccc;
	transition: all 0.5s ease 0.5s, z-index 0s 0.5s;
}

.notebook2>input:nth-of-type(1):checked ~ div:nth-of-type(1)>*:first-child,
	.notebook2>input:nth-of-type(2):checked ~ div:nth-of-type(2)>*:first-child,
	.notebook2>input:nth-of-type(3):checked ~ div:nth-of-type(3)>*:first-child,
	.notebook2>input:nth-of-type(4):checked ~ div:nth-of-type(4)>*:first-child
	{
	color: #333;
	transition: all 0.5s ease 0.5s;
}

.notebook2>input:nth-of-type(1):checked ~ div:nth-of-type(1)>*:not (:first-child
	), .notebook2>input:nth-of-type(2):checked ~ div:nth-of-type(2)>*:not (:first-child
	), .notebook2>input:nth-of-type(3):checked ~ div:nth-of-type(3)>*:not (:first-child
	), .notebook2>input:nth-of-type(4):checked ~ div:nth-of-type(4)>*:not (:first-child
	) {
	opacity: 1;
	transition: all 0.5s ease 0.5s;
}
</style>
</head>


<body link="orange" alink="orange" vlink="orange">

	<div id="external"></div>
	<div id="header">
		<table align="center" border="0" width=100%
			background="backgrounds/fon2.jpg">

			<!--First row-->

			<tr>
				<td width="200"></td>

				<td align="left" width="80"><a href="About.jsp"
					style="text-decoration: underline;"> About us </a></td>
				<td align="left" width="70"><a href="Delivery.jsp"
					style="text-decoration: underline;"> Delivery </a></td>
				<td align="left" width="70"><a href="Contacts.jsp"
					style="text-decoration: underline;"> Contacts </a></td>
				<td></td>
				<td align="right" width="60"><a href="Authentication.jsp"
					style="text-decoration: underline;"> Log in </a></td>
				<td width="15"></td>
				<td align="right" width="60"><a href="Basket.jsp"
					style="text-decoration: underline;"> Registration </a></td>
				<td width="200"></td>
			</tr>
		</table>
		<table align="center" border="0" width=100%
			background="backgrounds/fon2.jpg">
			<!-- Second row-->
			<tr>
				<td width="200"></td>
				<td align="left" width="131" height="135"><a href="Index.jsp"
					style="text-decoration: none;"> <img alt=""
						src="Logo/logo_trans.png" border="0">
				</a></td>
				<td width="20"></td>
				<td width="300">&nbsp
					<form action="" method="post" class="search">
						<input type="search" name="" placeholder="search" class="input" />
						<input type="submit" name="" value="" class="submit" />
					</form> &nbsp
				</td>
				<td></td>
				<td align="left" width="100"><a href="Basket.jsp"
					style="text-decoration: none; color: #30CA00"> <img alt=""
						src="Images/basket_35.png" border="0"> Basket
				</a></td>

				<td width="200"></td>
			</tr>
		</table>
	</div>
	<div id="content"></div>
	<div id="left"></div>
	<div id="center">
		<div class="notebook2">
			<input type="radio" name="notebook2a" id="notebook2a_1"
				checked="checked"> <input type="radio" name="notebook2a"
				id="notebook2a_2"> <input type="radio" name="notebook2a"
				id="notebook2a_3"> <input type="radio" name="notebook2a"
				id="notebook2a_4">

			<div>
				<label for="notebook2a_1">First page</label>
				<p></p>
				<p>
					<img
						src='https://lh3.googleusercontent.com/-6ac0fJDitng/VekGjxXrAZI/AAAAAAAAAUM/svkfw3ICSqA/s400-Ic42/1656410_6222d0c3.jpg'>
				</p>
			</div>
			<div>
				<label for="notebook2a_2">Second page</label>
				<p></p>
				<p>
					<img
						src='https://lh3.googleusercontent.com/-iVaTOyL6ZNw/VekGjo3YHLI/AAAAAAAAAUQ/r-GTiK3m1wk/s400-Ic42/WL_M_F_003.jpg'>
				</p>
			</div>
			<!--  <div>
				        <label for="notebook2a_3">Third page</label>
				        <p>Это третья вкладка с волком.</p>
				        <p><img src='https://lh3.googleusercontent.com/-4cateiSadRE/VekGwBksb-I/AAAAAAAAAUY/4WrLlsRJPKk/s400-Ic42/wpapers_ru_%2525D0%252592%2525D0%2525BE%2525D0%2525BB%2525D0%2525BA-%2525D0%2525BD%2525D0%2525B0-%2525D1%252584%2525D0%2525BE%2525D0%2525BD%2525D0%2525B5-%2525D0%2525BD%2525D0%2525B5%2525D0%2525B1%2525D0%2525B0.jpg'></p>
				    </div>
				    <div>
				        <label for="notebook2a_4">Fourth page</label>
				        <p>Это четвёртая вкладка с рысью</p>
				        <p><img src='https://lh3.googleusercontent.com/-VbI7_zCH-Eg/VekG8CK_t5I/AAAAAAAAAUg/ZuexmL-1lT8/s400-Ic42/2.jpg'></p>
				    </div> -->
		</div>
	</div>
	<div id="right"></div>

	<div class="clear"></div>
	<div id="footer"></div>

</body>

</html>