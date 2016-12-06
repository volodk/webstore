<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%String adminForm = (String)request.getAttribute("adminForm");
String adminName = (String)session.getAttribute("adminName");
String adminLastName = (String)session.getAttribute("adminLastName");
String superAdmin = (String)session.getAttribute("superAdmin");
   
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
		superAdmin = "false";
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
   }
	</style>
</head>


<body link="white" alink="white" vlink="white">
	
	<center>
				
		<%
		if (adminForm.equals("1")){
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
			<div>
				<a href="Admin">Create new administrator</a>
			</div>
			<div>
				<a href="Admin">Modify administrator profile</a>
			</div>
			<div class="line"></div>
			<div>
				<a href="Admin">Add new good</a>
			</div>			
			<div>
				<a href="Admin">Modify goods</a>
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