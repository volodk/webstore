package com.ksoft.model;

import com.ksoft.interfaces.IAdmins;

public class Admins implements IAdmins{
	private String adminName;
	private String adminLsatName;
	private String adminLogin;
	private String adminPassword;
	private int superAdmin;
	public int idAdmin;



	public String getAdminName(){
		return adminName;
	}
	public String getAdminLsatName(){
		return adminLsatName;
	}
	public String getAdminLogin(){
		return adminLogin;
	}
	public String getAdminPassword(){
		return adminPassword;
	}
	public int getSuperAdmin(){
		return superAdmin;
	}
	public int getIdAdmin(){
		return idAdmin;
	}
	
	
	
	
	public void setAdminName(String newAdminName){
		adminName = newAdminName;
	}
	public void setAdminLsatName(String newAdminLsatName){
		adminLsatName = newAdminLsatName;
	}
	public void setAdminLogin(String newAdminLogin){
		adminLogin = newAdminLogin;
	}
	public void setAdminPassword(String newAdminPassword){
		adminPassword = newAdminPassword;
	}
	public void setSuperAdmin(int newSuperAdmin){
		superAdmin = newSuperAdmin;
	}
	public void setIdAdmin(int newIdAdmin){
		idAdmin = newIdAdmin;
	}

}