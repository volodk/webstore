package com.ksoft;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*import javax.websocket.Session;*/
import java.io.IOException;
import java.sql.Connection;


public class MainPageServlet extends HttpServlet {
			 
	private static final long serialVersionUID = 1L;

	public String[] userInfo = new String[3];
	public boolean allowed = false;
	private Connection conDB;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
		
				this.doPost(req, resp);
					
   }
 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
		
				DataBase dBClass = new DataBase();
		
				String mail = req.getParameter("mail");
				String login = req.getParameter("login");
				String password = req.getParameter("password");
				String authForm = req.getParameter("authForm");
				String regForm = req.getParameter("regForm");
				String userReg = req.getParameter("userReg");
				String exit = req.getParameter("exit");
				Boolean logIsFree;
				String loginIsFree = "";
				String fieldsFilligExeption = "";
				Boolean userIsRegistered;
								
				String userName = req.getParameter("userName");
				String userLastName = req.getParameter("userLastName");
				String cardNumber = req.getParameter("cardNumber");
				
				HttpSession session = req.getSession();
				
				if (exit != null & exit != ""){
					session.invalidate();
				}
				
				/*подключимся к БД*/
				if ((authForm!=null & authForm!="") | (regForm!=null & regForm!="")){
				conDB = dBClass.getConnectionPostgresql();
				}	
				
				
				/*получим инфо пользователя*/
				if (conDB!=null & login!=null & login!="" & password!=null & password!=""){
					userInfo = dBClass.getUserInfo(login, password, conDB);
					allowed = false;
					if (userInfo[1].length()>0){
						userName = userInfo[1];
						userName = userName.concat(" ");
						userName = userName.concat(userInfo[2]);
						cardNumber = userInfo[3];
					
					if(userName!="" & userName!=null){				
						allowed = true;
					}	
										
					}
				}	
				
								
				if ((authForm == null | authForm == "") & (regForm == null | regForm == "")){
					
					req.getRequestDispatcher("index.jsp").forward(req, resp);
					
				}	
				/*обработаем инфо пользователя*/
				else if (authForm != null & authForm != ""){
					if (allowed){
						session.setAttribute("name", userName);
						session.setAttribute("card", cardNumber);
						req.getRequestDispatcher("index.jsp").forward(req, resp);
					}
					else{
						req.setAttribute("authForm", authForm);
						req.getRequestDispatcher("AuthenticationPageServlet").forward(req, resp);
					}
				}
					
				/*обработаем данные для регистратции нового пользователя*/
				else if (regForm != null & regForm != ""){
										
					/*проверим заполненность полей*/
					if(userName.equals("") | userLastName.equals("") | mail.equals("") | login.equals("") | password.equals("")){
						fieldsFilligExeption = "1";
						req.setAttribute("fieldsFilligExeption", fieldsFilligExeption);
						req.setAttribute("regForm", regForm);
						req.getRequestDispatcher("RegistrationPageServlet").forward(req, resp);
					}
					
					/*проверим логин*/
					else if (conDB!=null){
						logIsFree = false;
						logIsFree = dBClass.checkLogin(login, conDB);
						
						if (logIsFree==true){
							loginIsFree = "1";
							userIsRegistered = dBClass.addNewUser(userName, userLastName, mail, login, password, cardNumber, conDB);
							if(userIsRegistered == true){
								userReg = "1";}
							else{
								userReg = null;
							}
							req.setAttribute("userReg", userReg);
							
							userName = userName.concat(" ");
							userName = userName.concat(userLastName);
							session.setAttribute("name", userName);
							session.setAttribute("card", cardNumber);
						}									
						else{
							loginIsFree = null;
							}
						
						req.setAttribute("loginIsFree", loginIsFree);
						req.setAttribute("regForm", regForm);
						req.getRequestDispatcher("RegistrationPageServlet").forward(req, resp);
					}
					
					
					
				}
				
				
				
						
					
					
								
				
					
		if ((authForm!=null & authForm!="") | (regForm!=null & regForm!="")){
			  try{
				conDB.close();
			} catch ( Exception e ) {
				System.err.println( e.getClass().getName()+": "+ e.getMessage() );    
			}
		}	  
   }
	

}

