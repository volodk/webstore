<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Webstore</title>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<style>

.container-1{
  width: 300px;
  vertical-align: middle;
  white-space: nowrap;
  position: relative;
}

.container-1 input#search{
  width: 230px;
  height: 35px;
  background: #cccccc;
  border: none;
  font-size: 10pt;
  float: left;
  color: #63717f;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;

}

.container-1 input#search::-webkit-input-placeholder {
   color: #65737e;
}

.container-1 input#search:-moz-placeholder { /* Firefox 18- */
   color: #65737e;  
}

.container-1 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #65737e;  
}

.container-1 input#search:-ms-input-placeholder {  
   color: #65737e;  
}



.container-1 .icon{
  position: absolute;
  top: 50%;
  margin-left: 17px;
  margin-top: 10px;
  z-index: 1;
  color: #4f5b66;
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

	
	<div id="header">
		<table align="center" border="1" width=100%	background="backgrounds/fon2.jpg">
	
			<!--First row-->
	
			<tr>
				<td width="150" ></td>
	
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
				<td width="150"></td>
			</tr>
		</table>
		
		<table align="center" border="1" width=100% background="backgrounds/fon2.jpg">
			<!-- Second row-->
			<tr>
				<td width="150"></td>
				<td align="left" width="131" height="135"><a href="Index.jsp"
					style="text-decoration: none;"> <img alt=""
						src="Logo/logo_trans.png" border="0">
				</a></td>
				<td width="20"></td>
				<td width="300">
					<form action="" method="post" class="search">
						<div class="box">
							<div class="container-1">
							<span class="icon"><i class="fa fa-search"></i></span>
							<input type="search" id="search" placeholder="Search..." />
							</div>
						</div>
					</form> 
				</td>
				<td></td>
				<td align="left" width="100"><a href="Basket.jsp"
					style="text-decoration: none; color:#9dee84"> <img alt=""
						src="Images/basket_35.png" border="0"> Basket
				</a></td>
	
				<td width="150"></td>
			</tr>
		</table> 
	</div>
	
	<div id="center"> 
		<table align="center" border="1" width=100% background="backgrounds/fon1.jpg">
			<!-- Third row-->
			
			<tr>
				<td width="150" ></td>
				
				<td>
			
				<div class="menu1">
				  <br id="tab2"/><br id="tab3"/>
				  <a href="#tab1">For cats</a><a href="#tab2">For dogs</a><a href="#tab3">For rodents</a><a href="#tab4">For fishes</a>
				  
				  <div>page 1</div>
				  <div>page 2</div>
				  <div>page 3</div>
				  <div>page 4</div>
		
				 </div>
				 
				 </td>
				 
				 <td width="150" ></td>
				 
			</tr>	 
		</table>	
	</div>
	<div id="right">  </div>
	<div class="clear"></div>
	<div id="footer"></div> 
		  
</body>

</html>