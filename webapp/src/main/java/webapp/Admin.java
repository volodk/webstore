package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import webapp.PostgreJDBC;

public class Admin extends HttpServlet {
			 
	private static final long serialVersionUID = 1L;

	public String[] adminInfo = new String[3];
	private Connection conDB;
	public boolean allowed = false;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
		
				this.doPost(req, resp);
					
   }
 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
				
				String adminForm = req.getParameter("adminForm");
				String login = req.getParameter("login");
				String password = req.getParameter("password");
				
				String adminName = req.getParameter("adminName");
				String adminLastName = req.getParameter("adminLastName");
				String superAdmin = req.getParameter("superAdmin");
				
				
				
				
				
				HttpSession session = req.getSession();
				
				
				if (adminForm!=null & adminForm!=""){
					conDB = PostgreJDBC.getConnectionPG();
				}
				
				allowed = false;				
				/*получим инфо админа*/
				if (conDB!=null & login!=null & login!="" & password!=null & password!=""){
					adminInfo = PostgreJDBC.GetAdminInfo(login, password, conDB);
										
					if (adminInfo[1].length()>0){
						allowed = true;
						
						adminName = adminInfo[1];
						adminLastName = adminInfo[2];
						superAdmin = adminInfo[3];
											
					}
					
				}	
										
				if (allowed){
					session.setAttribute("adminName", adminName);
					session.setAttribute("adminLastName", adminLastName);
					session.setAttribute("superAdmin", superAdmin);
					req.setAttribute("adminForm", "");
					
					req.getRequestDispatcher("Admin.jsp").forward(req, resp);
						
				}else{
					req.setAttribute("adminForm", adminForm);
					req.getRequestDispatcher("Admin.jsp").forward(req, resp);
				}
				
				
				/*PostgreJDBC.GetUserInfo(login, password, conDB);*/
				
			try{
				conDB.close();
			} catch ( Exception e ) {
				System.err.println( e.getClass().getName()+": "+ e.getMessage() );    
			}
			  
   }
	

}

