<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Webstore</title>
<style>
search {
	/* устанавливаем необходимую ширину формы в зависимости от дизайна форма без проблем растягивается 
	width: 100%;
	/* кнопку отправки будем позиционировать абсолютно, поэтому необходимо это свойство */
	position: relative;
}

.search input {
	/* отключаем бордюры у инпутов */
	border: none;
}

/* стили для поля ввода */
.search .input {
	/* растягиваем поле ввода на всю ширину формы */
	width: 100%;
	/* за счет верхнего (8px) и нижнего (9px) внутренних отступов регулируем высоту формы внутренний отступ справа (37px) делаем больше левого,т.к. там будет размещена кнопка отправки	*/
	padding: 8px 37px 9px 15px;
	/* чтобы ширина поля ввода (100%) включала в себя внутренние отступы */
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	/* добавляем внутренние тени */
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1), inset 0 1px 2px
		rgba(0, 0, 0, 0.3);
	/* закругляем углы */
	border-radius: 20px;
	background: #EEE;
	font: 13px Tahoma, Arial, sans-serif;
	color: #555;
	outline: none;
}

/* меняем оформление поля ввода при фокусе */
.search .input:focus {
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2), inset 0 1px 2px
		rgba(0, 0, 0, 0.4);
	background: #E8E8E8;
	color: #333;
}

/* оформляем кнопку отправки 
.search .submit {
	/* позиционируем кнопку абсолютно от правого края формы */
	position: absolute;
	top: 0;
	right: 0;
	width: 37px;
	/* растягиваем кнопку на всю высоту формы */
	height: 100%;
	cursor: pointer;
	background: url("Images/search_tr.png") 50% no-repeat;
	/* добавляем прозрачность кнопке отправки */
	opacity: 0.5;
}

/* при наведении курсора меняем прозрачность кнопки отправки */
.search .submit:hover {
	opacity: 0.8;
}

/* данное свойство необходимо для того, чтобы в браузерах Chrome и Safari можно было стилизовать инпуты */
input[type="search"] {
	-webkit-appearance: none;
}


#external{
 top: 0px;
 bottom: 0px;
 left: auto;
 right: auto;
}

#left {
  float: left; 
  width: 200px;
}
#right {
  float: right; 
  width: 200px; 
}
#center {
  margin-left: 200px; 
  margin-right: 200px; 
}
.clear {
  clear: both; 
}

/*Стиль вкладкок*/
#tab2, #tab3 {position: fixed; }

.menu1 > a,
.menu1 #tab2:target ~ a:nth-of-type(1),
.menu1 #tab3:target ~ a:nth-of-type(1),
.menu1 > div { padding: 5px; border: 1px solid #aaa; }

.menu1 > a { line-height: 28px; background: #fff; text-decoration: none; }

#tab2,
#tab3,
.menu1 > div,
.menu1 #tab2:target ~ div:nth-of-type(1),
.menu1 #tab3:target ~ div:nth-of-type(1) {display: none; }

.menu1 > div:nth-of-type(1),
.menu1 #tab2:target ~ div:nth-of-type(2),
.menu1 #tab3:target ~ div:nth-of-type(3) { display: block; }

.menu1 > a:nth-of-type(1),
.menu1 #tab2:target ~ a:nth-of-type(2),
.menu1 #tab3:target ~ a:nth-of-type(3) { border-bottom: 2px solid #fff; }


</style>
</head>


<body link="orange" alink="orange" vlink="orange">

	<div id="external">  </div>
	<div id="header">
		<table align="center" border="0" width=100%	background="backgrounds/fon2.jpg">
	
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
		<table align="center" border="0" width=100% background="backgrounds/fon2.jpg">
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
					style="text-decoration: none; color:#9dee84"> <img alt=""
						src="Images/basket_35.png" border="0"> Basket
				</a></td>
	
				<td width="200"></td>
			</tr>
		</table> 
	</div>
	<div id="content"> </div>
	<div id="left">  </div>
	<div id="center"> 
		<div class="menu1">
		  <br id="tab2"/><br id="tab3"/>
		  <a href="#tab1">CSS</a><a href="#tab2">HTML</a><a href="#tab3">add</a>
		  <div>page 1</div>
		  <div>page 2</div>
		  <div>page 3</div>

		  </div>
	</div>
	<div id="right">  </div>
		  	 
	<div class="clear"></div>
	<div id="footer"></div> 
		  
</body>

</html>