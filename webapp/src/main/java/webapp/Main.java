package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*import javax.websocket.Session;*/
import java.io.IOException;
import java.sql.Connection;

import webapp.PostgreJDBC;

public class Main extends HttpServlet {
			 
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
		
				
				String login = req.getParameter("login");
				String password = req.getParameter("password");
				String authForm = req.getParameter("authForm");
				String regForm = req.getParameter("regForm");
				String exit = req.getParameter("exit");
				Boolean loginIsFree;
				String logIsFree = "";
				String fieldsFilligExeption = "";
				
				String userName = req.getParameter("userName");
				String userLastName = req.getParameter("userLastName");
				String cardNumber = req.getParameter("cardNumber");
				
				HttpSession session = req.getSession();
				
				if (exit != null){
					session.invalidate();
				}
				
				/*подключимся к БД*/
				if (authForm!=null | regForm!=null){
				conDB = PostgreJDBC.getConnectionPG();
				}	
				
				
				/*получим инфо пользователя*/
				if (conDB!=null & login!=null & password!=null){
					userInfo = PostgreJDBC.GetUserInfo(login, password, conDB);
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
				
								
				/*обработаем инфо пользователя*/
				if (authForm != null){
					if (allowed){
						session.setAttribute("name", userName);
						session.setAttribute("card", cardNumber);
						req.getRequestDispatcher("Index.jsp").forward(req, resp);
					}
					else{
						req.getRequestDispatcher("Auth").forward(req, resp);
					}
				}
					
				/*обработаем данные для регистратции нового пользователя*/
				else if (regForm != null){
					fieldsFilligExeption = "";
					
					/*проверим заполненность полей*/
					if(userName.equals("") | userLastName.equals("") | login.equals("") | password.equals("")){
						fieldsFilligExeption = "1";
						session.setAttribute("ffExeption", fieldsFilligExeption);
						req.getRequestDispatcher("Reg").forward(req, resp);
					}
					
					/*приверим логин*/
					else if (conDB!=null){
						loginIsFree = false;
						loginIsFree = PostgreJDBC.CheckLogin(login, conDB);
						
						if (loginIsFree){
							logIsFree = "1";									
						}else{
							logIsFree = "";
						}
						
						session.setAttribute("loginIsFree", logIsFree);							
						req.getRequestDispatcher("Reg").forward(req, resp);
					}
				}
				else {
					req.getRequestDispatcher("Index.jsp").forward(req, resp);
				}
						
					
					
								
				
					
		if (authForm!=null | regForm!=null){
			  try{
				conDB.close();
			} catch ( Exception e ) {
				System.err.println( e.getClass().getName()+": "+ e.getMessage() );    
			}
		}	  
   }
	

}

