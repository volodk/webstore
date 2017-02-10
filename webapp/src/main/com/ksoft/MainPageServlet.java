package com.ksoft;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import java.awt.List;*/
/*import javax.websocket.Session;*/
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;


public class MainPageServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

	public String userId;
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
				
				String [] topLevelCategories = new String[10];
				List<Categories> categories = new ArrayList<Categories>();
				
				HttpSession session = req.getSession();
				ServletContext sContext = getServletConfig().getServletContext();
				
				
				
				
				
				
				
				
				if (exit != null & exit != ""){
					session.invalidate();
				}
				
				/*подключимся к БД*/
				/*if ((authForm!=null & authForm!="") | (regForm!=null & regForm!="")){*/
				conDB = dBClass.getConnectionPostgresql();
				/*}*/	
				
				
				/*получим инфо пользователя*/
				if (conDB!=null & login!=null & login!="" & password!=null & password!=""){
					userId = dBClass.getUserId(login, password, conDB);
					allowed = false;
					if (userId.length()>0){
						allowed = true;
						
						/*userName = userInfo[1];
						userName = userName.concat(" ");
						userName = userName.concat(userInfo[2]);
						cardNumber = userInfo[3];*/
															
					}
				}	
				
								
				/*просто отображение первой страницы*/
				if ((authForm == null | authForm == "") & (regForm == null | regForm == "")){
					
					topLevelCategories = dBClass.getTopLevelCategories(conDB);
					categories = dBClass.getCategories(conDB);
					sContext.setAttribute("topLevelCategories", topLevelCategories);
					sContext.setAttribute("categories", categories);
					
					req.getRequestDispatcher("index.jsp").forward(req, resp);
					
				}	
				/*обработаем инфо пользователя*/
				else if (authForm != null & authForm != ""){
					if (allowed){
						session.setAttribute("userId", userId);
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
							
							userId = dBClass.getUserId(login, password, conDB);
							if (userId.length()>0){
								session.setAttribute("userId", userId);
							}
							/*userName = userName.concat(" ");
							userName = userName.concat(userLastName);
							session.setAttribute("name", userName);
							session.setAttribute("card", cardNumber);*/
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

