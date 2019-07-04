package com.ksoft.interfaces;

public interface IAdmins {

	public String getAdminName();
	
	public String getAdminLsatName();
	
	public String getAdminLogin();
	
	public String getAdminPassword();
	
	public int getSuperAdmin();
	
	public int getIdAdmin();
	
	
	public void setAdminName(String newAdminName);

	public void setAdminLsatName(String newAdminLsatName);
	
	public void setAdminLogin(String newAdminLogin);
	
	public void setAdminPassword(String newAdminPassword);
	
	public void setSuperAdmin(int newSuperAdmin);
	
	public void setIdAdmin(int newIdAdmin);
}
