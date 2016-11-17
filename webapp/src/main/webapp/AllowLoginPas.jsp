<%-- <%@ page import="webapp.AuthService" %> --%>

<%/* AuthService auth = new AuthService(); */
	boolean authOk = false;
	
	String login=(String) session.getAttribute("login");
	if(login==null){
	login="";
	}
	
	String password=(String) session.getAttribute("password");
	if(password==null){
	password="";
	}
	
/* 	authOk = auth.allowLogin(login, password); */%> 