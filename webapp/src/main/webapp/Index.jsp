<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String userName = "";
String cardNumber = "";
userName = (String)session.getAttribute("name");
cardNumber = (String)session.getAttribute("card");

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

<title>Webstore</title>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<style>
body {
    background-image: url(backgrounds/texture3.jpg);
	background-attachment: fixed;
	background-position: center;
	margin: 0; 
     }

.container-1{
  width: 300px; 
  vertical-align: middle;
  white-space: nowrap;
  position: relative;
}

.container-1 input#search{
  width: 300px;
  height: 35px;
  background: #fff;
  border: none;
  font-size: 10pt;
  
  float: left;
  color: #63717f;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 20px;

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
/* Базовый контейнер табов */

.tabs {
  padding: 0px;
  margin: 0 auto;
  width:auto;
}
/* стили секций с содержанием */
section {
  min-width: 32px;
  width:auto;
  display: none;
  padding: 15px;
  background: url(backgrounds/orange.jpg);
  border: 1px solid #ddd;
  height: 100vh;
 /*  border-radius: 15px; */
  
}
.tabs input {
  display: none;
  width:auto;
    
}


/* стили вкладок (табов) */
.tabs label {
  height:15px;
  display: inline-block;
  width:auto;
  margin: 0 0 -1px;
  padding: 15px 25px;
  font-weight: 600;
  text-align: center;
  color: #aaa;
  border: 1px solid #ddd;
  background: #efc562;
  border-radius: 15px 15px 0 0;
  
    
}
/* шрифт-иконки от Font Awesome в формате Unicode */
.tabs label:before {
  font-family: fontawesome;
  font-weight: normal;
  margin-right: 10px;
}
.tabs label[for*="1"]:before {
  content: url(Images/cat26.png);
}
.tabs label[for*="2"]:before {
  content: url(Images/dog26.png);
}
.tabs label[for*="3"]:before {
  content: url(Images/rabbit26.png);
}
.tabs label[for*="4"]:before {
  content: url(Images/fish26.png);
}

.tabs {
	width: auto;
	height: 450px;
	position: relative;
}


/* изменения стиля заголовков вкладок при наведении */
.tabs label:hover {
  color: #888;
  cursor: pointer;
}
/* стили для активной вкладки */
.tabs input:checked + label {
  color: #555;
  border: 1px solid #ddd;
  border-top: 1px solid #009933;
  border-bottom: 1px solid #fff;
  background: #e89417;
}
/* активация секций с помощью переключателя :checked */
#tab1:checked ~ #content1,
#tab2:checked ~ #content2,
#tab3:checked ~ #content3,
#tab4:checked ~ #content4 {
  display: block;
}

}


</style>
</head>


<body link="orange" alink="orange" vlink="orange">

	
	<div id="header">
		<table align="center" border="0" width=100% background="backgrounds/texture7.jpg" >
			
			<!--First row-->
	
			<tr>
				<td width="150" ></td>
	
				<td align="left" width="80" ><a href="About.jsp"
					style="text-decoration: underline;"> About us </a></td>
				<td align="left" width="70"><a href="Delivery.jsp"
					style="text-decoration: underline;"> Delivery </a></td>
				<td align="left" width="70"><a href="Contacts.jsp"
					style="text-decoration: underline;"> Contacts </a></td>
				<td></td>
				
				<%
				if (userName.equals("")|(userName.equals(null))) {
				%>
				<td align="right" width="60"><a href="Auth"
					style="text-decoration: underline;"> Entry </a></td>
				<td width="15"></td>
				
				<td align="right" width="60"><a href="Reg"
					style="text-decoration: underline;"> Registration </a></td>
				<td width="150"></td>
				<%
				} else {
				%>
				<td align="right" width="250">
					<font color="white" > 
						<strong><%out.print(userName);%> </strong>
					</font>	  
					<font color="gray" >
						(club card:<%out.print(cardNumber);%>) 
					</font>
				</td>
								
				<td align="right" width="60"><a href="Main?exit=1"
					style="text-decoration: none;"> Exit </a></td>
								
				<td align="right" width="80"><a href="Reg"
					style="text-decoration: underline;"> My profile </a></td>
				<td width="150" ></td>										
                <%
				}
				%>		
									
				
			</tr>
			
		</table>
		
		<table height="170" align="center" border="0"  width=100% background="backgrounds/texture7.jpg">
			<!-- Second row-->
			<tr>
				<td width="150" ></td>
				<td align="left" width="131" height="135"><a href="Index.jsp"
					style="text-decoration: none;"> <img alt=""
						src="Logo/logo_trans.png" border="0">
				</a></td>
				<!-- <td width="20" ></td> -->
				<td align="center">
					<form action="" method="post" class="search">
						<div class="box" >
							<div class="container-1">
							<span class="icon"><i class="fa fa-search"></i></span>
							<input type="search" id="search" placeholder="Search..." />
							</div>
						</div>
					</form> 
				</td>
				<td></td>
				<td align="left" width="100" ><a href="Basket.jsp"
					style="text-decoration: none; color:#6bc413"> <img alt=""
						src="Images/basket_35.png" border="0"> Basket
				</a></td>
	
				<td width="150"></td>
			</tr>
		</table>
				 
	</div>
	
	<div>
	<table align="center" border="0" width=100%>
			<!-- Third row-->
			<tr>
				<td width="150" ></td>
				<td align="left">
				
					<div class="tabs">
					    <input id="tab1" type="radio" name="tabs" checked>
					    <label for="tab1" title="Вкладка 1">Cats</label>
					 
					    <input id="tab2" type="radio" name="tabs">
					    <label for="tab2" title="Вкладка 2">Dogs</label>
					 
					    <input id="tab3" type="radio" name="tabs">
					    <label for="tab3" title="Вкладка 3">Rodents</label>
					 
					    <input id="tab4" type="radio" name="tabs">
					    <label for="tab4" title="Вкладка 4">Fishes</label>
					 
					    <section id="content1">
					        <p>
							tab 1....
					        </p>
					    </section>  
					    <section id="content2">
					        <p>
					          tab 2....
					        </p>
					    </section> 
					    <section id="content3">
					        <p>
					          tab 3....
							</p>
					    </section> 
					    <section id="content4">
					        <p>
					          Tab 4....
					        </p>
					    </section>    
					</div>
					
				
				 </td>
				 <td width="150"></td> 
			</tr>
		</table>	
	</div>								  
</body>

</html>