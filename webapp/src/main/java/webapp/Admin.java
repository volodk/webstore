package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.w3c.dom.ls.LSInput;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.function.ToIntFunction;

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
				
				String newAdmin = req.getParameter("newAdmin");
				String modAdmin = req.getParameter("modAdmin");
				String newAdminName = req.getParameter("newAdminName");
				String newAdminLastName = req.getParameter("newAdminLastName");
				String newAdminLogin = req.getParameter("newAdminLogin");
				String newAdminPassword = req.getParameter("newAdminPassword");
				String newSuperAdmin = req.getParameter("newSuperAdmin");
				
				String oldAdminName = req.getParameter("oldAdminName");
				String oldAdminLastName = req.getParameter("oldAdminLastName");
				String oldAdminLogin = req.getParameter("oldAdminLogin");
				String oldAdminPassword = req.getParameter("oldAdminPassword");
				String oldSuperAdmin = req.getParameter("oldSuperAdmin");
				String oldIdAdmin = req.getParameter("oldIdAdmin");
				
				String login = req.getParameter("login");
				String password = req.getParameter("password");
				
				String adminName = req.getParameter("adminName");
				String adminLastName = req.getParameter("adminLastName");
				
				String checkAdmin = req.getParameter("checkAdmin");
						
							
				String loginIsFree = "";
				Boolean logIsFree;
				String fieldsFilligExeption = "";
				Boolean adminIsRegistered;
				Boolean adminIsUpdated;
				Integer checkAdminInt = null;
								
				ArrayList<AdminsInfo> adminsTable = new ArrayList<AdminsInfo>();
				AdminsInfo strModAdmin = new AdminsInfo();
				
				HttpSession session = req.getSession();
				String superAdmin = (String)session.getAttribute("superAdmin");
				adminsTable = (ArrayList<AdminsInfo>)session.getAttribute("adminsTable");
				
				/*определим newAdmin если он равен 0*/
				if (newAdmin == null){
					newAdmin="";
				}
				/*определим modAdmin если он равен 0*/
				if (modAdmin == null){
					modAdmin="";
				}
				/*определим super user если не выбран*/
				if (newSuperAdmin == null){
					newSuperAdmin="0";
				}
				
				if (checkAdmin!=null){
					checkAdminInt = Integer.parseInt(checkAdmin);					
				}	
				
				
				
				
				
				
				if ((adminForm!=null & adminForm!="") | (modAdmin.equals("1"))){
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
				/*Если логин и пароль входящего админа прошли проверку*/						
				if (allowed){
					session.setAttribute("adminName", adminName);
					session.setAttribute("adminLastName", adminLastName);
					session.setAttribute("superAdmin", superAdmin);
					req.setAttribute("adminForm", "");
					
					req.getRequestDispatcher("Admin.jsp").forward(req, resp);
				
					
					
				/*Если это модификация данных по админу. Данные отредактированы и передаются для записи*/
				}else if (modAdmin.equals("3")){
					/*проверим заполненность полей*/
					if(oldAdminName.equals("") | oldAdminLastName.equals("") | oldAdminLogin.equals("") | oldAdminLogin.equals("")){
						fieldsFilligExeption = "1";
						req.setAttribute("modAdmin", "2");
						req.setAttribute("fieldsFilligExeption", fieldsFilligExeption);
						req.setAttribute("adminForm", adminForm);
						req.getRequestDispatcher("Admin.jsp").forward(req, resp);
					}
					
					/*проверим логин*/
					else if (conDB!=null){
						logIsFree = false;
						logIsFree = PostgreJDBC.CheckLoginAdmin(oldAdminLogin, conDB);
						
						if (logIsFree==true){
							loginIsFree = "1";
							if(oldSuperAdmin==null){
								oldSuperAdmin="0";
							}
							adminIsUpdated = PostgreJDBC.UpdateAdmin(oldAdminName, oldAdminLastName, oldAdminLogin, oldAdminPassword, oldSuperAdmin, oldIdAdmin, conDB);
							if(adminIsUpdated == true){
								req.setAttribute("adminUpd", "1");}
							else{
								req.setAttribute("adminUpd", "");
							}
							
							
						}									
						else{
							loginIsFree = "2";
							}
						
						req.setAttribute("modAdmin", "1");
						req.setAttribute("loginIsFree", loginIsFree);
						req.setAttribute("adminForm", adminForm);
						req.getRequestDispatcher("Admin.jsp").forward(req, resp);
					}
				
									
					
					
				/*Если это выбор админа для редактирования*/
				}else if (modAdmin.equals("2") & (checkAdmin!=null)){
					strModAdmin = adminsTable.get(checkAdminInt.intValue());
					
					session.setAttribute("strModAdmin", strModAdmin);
					req.setAttribute("modAdmin", modAdmin);	
					req.setAttribute("adminForm", adminForm);
					req.getRequestDispatcher("Admin.jsp").forward(req, resp);	
				
					
									
				/*Если это выбор меню редактирования админов*/
				}else if (modAdmin.equals("1")| ((modAdmin.equals("2") & (checkAdmin==null)))){
					/*получим таблицу с логинами админов*/
					adminsTable = PostgreJDBC.GetAdminsInfo(conDB);
					
					req.setAttribute("modAdmin", "1");
					req.setAttribute("adminForm", adminForm);
					session.setAttribute("adminsTable", adminsTable);
					req.getRequestDispatcher("Admin.jsp").forward(req, resp);
					
								
				/*Если это регистрация нового админа*/
				}else if (newAdmin.equals("2")){	

					/*проверим заполненность полей*/
					if(newAdminName.equals("") | newAdminLastName.equals("") | newAdminLogin.equals("") | newAdminLogin.equals("")){
						fieldsFilligExeption = "1";
						req.setAttribute("newAdmin", newAdmin);
						req.setAttribute("fieldsFilligExeption", fieldsFilligExeption);
						req.setAttribute("adminForm", adminForm);
						req.getRequestDispatcher("Admin.jsp").forward(req, resp);
					}
					
					/*проверим логин*/
					else if (conDB!=null){
						logIsFree = false;
						logIsFree = PostgreJDBC.CheckLoginAdmin(newAdminLogin, conDB);
						
						if (logIsFree==true){
							loginIsFree = "1";
							adminIsRegistered = PostgreJDBC.AddNewAdmin(newAdminName, newAdminLastName, newAdminLogin, newAdminPassword, newSuperAdmin,conDB);
							if(adminIsRegistered == true){
								req.setAttribute("adminReg", "1");}
							else{
								req.setAttribute("adminReg", "");
							}
							
							
						}									
						else{
							loginIsFree = "";
							}
						req.setAttribute("newAdmin", newAdmin);
						req.setAttribute("modAdmin", modAdmin);
						req.setAttribute("loginIsFree", loginIsFree);
						req.setAttribute("adminForm", adminForm);
						req.getRequestDispatcher("Admin.jsp").forward(req, resp);
					}
				
					
				}else{
					req.setAttribute("newAdmin", newAdmin);
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

