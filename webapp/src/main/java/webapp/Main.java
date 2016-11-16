package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Main extends HttpServlet {
			 
	private static final long serialVersionUID = 1L;

	public String realLogin = "admin"; 
	public String realPass = "admin";
	public String cardNumber = "00777";
	public boolean allowed = false;

	
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
				
				allowed = allowLogin(login, password);
				
				if (allowed){
					req.setAttribute("name", login);
					req.setAttribute("card", cardNumber);
					req.getRequestDispatcher("Index.jsp").forward(req, resp);
				}
				else if (authForm == null){
					req.getRequestDispatcher("Index.jsp").forward(req, resp);
				}
				else{
					req.getRequestDispatcher("Auth").forward(req, resp);
				}
					
   }
	
	public boolean allowLogin(String login, String password){
		
		if(login==null){
		login="";
		}
		
		if(password==null){
		password="";
		}
		
		if (!login.equals(realLogin) | !password.equals(realPass)){
			return false;
		}
		else{
			return true;
		}
	
		}
	
}