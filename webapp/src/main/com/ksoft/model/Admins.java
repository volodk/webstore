package com.ksoft.model;

public class Admins {
	private String adminName;
	private String adminLsatName;
	private String adminLogin;
	private String adminPassword;
	private int superAdmin;
	private int idAdmin;



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