package com.ksoft.controllers;
import com.ksoft.model.*;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;


public class AdminPageServlet extends HttpServlet {
			 
	private static final long serialVersionUID = 1L;

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
				
				DataBase dBClass = new DataBase();
				Admins strModAdmin = new Admins();
				
				String adminForm = req.getParameter("adminForm");
				
				String newAdmin = req.getParameter("newAdmin");
				String modAdmin = req.getParameter("modAdmin");
				String deleteAdmin = req.getParameter("deleteAdmin");
				
				String newGood = req.getParameter("newGood");
				String modGood = req.getParameter("modGood");
				String deleteGood = req.getParameter("deleteGood");
				
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
				Boolean adminIsDeleted;
				Integer checkAdminInt = null;
							
				List<Admins> adminsTable = new ArrayList<Admins>();
				
				ServletContext sContext = getServletConfig().getServletContext();
				
				HttpSession session = req.getSession();
				/*String superAdmin = (String)session.getAttribute("superAdmin");*/
				String adminId = (String)session.getAttribute("adminId");
				
				adminsTable = (List<Admins>)sContext.getAttribute("adminsTable");
				String [] stringAdminsTable;
											
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
				if (newGood == null){
					newGood="";
				}
				if (modGood == null){
					modGood="";
				}
				
				
				
				
				
				if ((adminForm!=null && adminForm!="") || (modAdmin.equals("1"))){
					conDB = dBClass.getConnectionPostgresql();
				}
				
				
				allowed = false;				
				/*получим инфо админа*/
				if (conDB!=null && login!=null && login!="" && password!=null && password!=""){
					adminId = dBClass.getAdminId(login, password, conDB);
															
					if (adminId.length()>0){
						allowed = true;
																						
					}
					
				}	
				
				
				
				
				
				/*Если логин и пароль входящего админа прошли проверку*/						
				if (allowed){
					session.setAttribute("adminId", adminId);
					req.setAttribute("adminForm", "");
					
					req.getRequestDispatcher("admin.jsp").forward(req, resp);
				
					
					
				/*Если это модификация данных по админу. Данные отредактированы и передаются для записи*/
				}else if (modAdmin.equals("3")){
					/*проверим заполненность полей*/
					if(oldAdminName.equals("") || oldAdminLastName.equals("") || oldAdminLogin.equals("") || oldAdminLogin.equals("")){
						fieldsFilligExeption = "1";
						req.setAttribute("modAdmin", "2");
						req.setAttribute("fieldsFilligExeption", fieldsFilligExeption);
						req.setAttribute("adminForm", adminForm);
						req.getRequestDispatcher("admin.jsp").forward(req, resp);
					}
					
					/*проверим логин*/
					else if (conDB!=null){
						logIsFree = false;
						logIsFree = dBClass.checkAdminLoginForUpdate(oldAdminLogin, oldIdAdmin, conDB);
						
						if (logIsFree==true){
							loginIsFree = "1";
							if(oldSuperAdmin==null){
								oldSuperAdmin="0";
							}
							adminIsUpdated = dBClass.updateAdmin(oldAdminName, oldAdminLastName, oldAdminLogin, oldAdminPassword, oldSuperAdmin, oldIdAdmin, conDB);
							if(adminIsUpdated == true){
								req.setAttribute("adminUpd", "1");
							/*	перечитаем таблицу с инфо админов админов*/
								adminsTable = dBClass.getAllAdminsInfo(conDB);
							
//							/* переконвертируем adminsTable в массив строк*/	
//								stringAdminsTable = convertAdminsTable (adminsTable);
								
								sContext.setAttribute("adminsTable", adminsTable);}
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
						req.getRequestDispatcher("admin.jsp").forward(req, resp);
					}
				
									
					
						
				/*Если это выбор админа для редактирования*/
				}else if (modAdmin.equals("2") && (checkAdmin!=null)){
					strModAdmin = adminsTable.get(checkAdminInt.intValue());
					if (deleteAdmin!=null && !deleteAdmin.equals("")){
						adminIsDeleted = dBClass.deleteAdmin(strModAdmin.idAdmin, conDB);
						if(adminIsDeleted==true){
							req.setAttribute("modAdmin", "1");	
							req.setAttribute("deleteAdmin", "sucessfull");
							req.setAttribute("adminForm", adminForm);
							/*перечитаем таблицу с инфо админов админов*/
							adminsTable =dBClass.getAllAdminsInfo(conDB);
							sContext.setAttribute("adminsTable", adminsTable);
							}else{
								req.setAttribute("modAdmin", "1");	
								req.setAttribute("deleteAdmin", "error");
								req.setAttribute("adminForm", adminForm);	
							}
					}else{
						
					strModAdmin = adminsTable.get(checkAdminInt.intValue());
					
					sContext.setAttribute("strModAdmin", strModAdmin);
					req.setAttribute("modAdmin", modAdmin);	
					req.setAttribute("adminForm", adminForm);						
					}
					
					req.getRequestDispatcher("admin.jsp").forward(req, resp);
					
									
				/*Если это выбор меню редактирования админов*/
				}else if (modAdmin.equals("1")|| ((modAdmin.equals("2") && (checkAdmin==null)))){
					/*получим таблицу с логинами админов*/
					adminsTable = dBClass.getAllAdminsInfo(conDB);
					
					req.setAttribute("modAdmin", "1");
					req.setAttribute("adminForm", adminForm);
					sContext.setAttribute("adminsTable", adminsTable);
					req.getRequestDispatcher("admin.jsp").forward(req, resp);
					
								
				/*Если это регистрация нового админа*/
				}else if (newAdmin.equals("2")){	

					/*проверим заполненность полей*/
					if(newAdminName.equals("") || newAdminLastName.equals("") || newAdminLogin.equals("") || newAdminLogin.equals("")){
						fieldsFilligExeption = "1";
						req.setAttribute("newAdmin", newAdmin);
						req.setAttribute("fieldsFilligExeption", fieldsFilligExeption);
						req.setAttribute("adminForm", adminForm);
						req.getRequestDispatcher("admin.jsp").forward(req, resp);
					}
					
					/*роверим логин*/
					else if (conDB!=null){
						logIsFree = false;
						logIsFree = dBClass.checkAdminLogin(newAdminLogin, conDB);
						
						if (logIsFree==true){
							loginIsFree = "1";
							adminIsRegistered = dBClass.addNewAdmin(newAdminName, newAdminLastName, newAdminLogin, newAdminPassword, newSuperAdmin,conDB);
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
						req.getRequestDispatcher("admin.jsp").forward(req, resp);
					}
				
					
				}else{
					req.setAttribute("newAdmin", newAdmin);
					req.setAttribute("newGood", newGood);
					req.setAttribute("adminForm", adminForm);
					req.getRequestDispatcher("admin.jsp").forward(req, resp);
				}
				
				
				
				/*dBClass.getUserInfo(login, password, conDB);*/
				
			try{
				conDB.close();
			} catch ( Exception e ) {
				System.err.println( e.getClass().getName()+": "+ e.getMessage() );    
			}
			  
   }

	
	
//	private String [] convertAdminsTable (List<Admins> adminsTable){
//		Admins adminsLine = new Admins();
//		String[] adminsStringTable;
//		
//		for (int i = 0; i < adminsTable.size(); i++) {
//			adminsLine = adminsTable.get(i);
//			adminsStringTable[i].
//		}	
//	}
	
}

