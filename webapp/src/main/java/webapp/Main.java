package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*import javax.websocket.Session;*/
import java.io.IOException;
import java.sql.Connection;

import webapp.PostgreJDBC;

public class Main extends HttpServlet {
			 
	private static final long serialVersionUID = 1L;

	/*public String userName = ""; 
	public String cardNumber = "";*/
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
				
				String userName = req.getParameter("userName");
				String cardNumber = req.getParameter("cardNumber");
								
				/*подключимся к БД*/
				conDB = PostgreJDBC.getConnectionPG();
								
				/*получим инфо пользователя если нет*/
				if (conDB!=null && login!=null && password!=null){
					userInfo = PostgreJDBC.GetUserInfo(login, password, conDB);
					userName = userInfo[1];
					userName = userName.concat(" ");
					userName = userName.concat(userInfo[2]);
					cardNumber = userInfo[3];
					
					if(userName!=""){				
						allowed = true;
					}
				}	
				
								
				if (authForm != null){
					if (allowed){
						req.setAttribute("name", userName);
						req.setAttribute("card", cardNumber);
						req.getRequestDispatcher("Index.jsp").forward(req, resp);
					}
					else{
						req.getRequestDispatcher("Auth").forward(req, resp);
						}
				}
				else if (authForm == null){
					req.getRequestDispatcher("Index.jsp").forward(req, resp);
				}
				
					
		try{
			conDB.close();
		} catch ( Exception e ) {
			System.err.println( e.getClass().getName()+": "+ e.getMessage() );    
		}
   }
	

}

