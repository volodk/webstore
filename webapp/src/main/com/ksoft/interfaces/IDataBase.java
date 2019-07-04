package com.ksoft.interfaces;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.ksoft.model.Admins;
import com.ksoft.model.Category;
import com.ksoft.model.Good;
import com.ksoft.model.Image;

public interface IDataBase {

	public Connection getConnectionPostgresql();
	
	public Image getImage(Connection connection, String ImageId) throws IOException;
	
	public List<IGood> getGoods(Connection connection, int categoryId);
	
	public List<ICategory> getCategories(Connection connection);
	
	public String[] getTopLevelCategories(Connection connection);
	
	public String getUserId(String login,  String password, Connection connection);
	
	public String[] getUserInfo(String idUser, Connection connection);
	
	public String getAdminId(String login,  String password, Connection connection);
	
	public String[] getAdminInfo(String adminId, Connection connection);
	
	public List<IAdmins> getAllAdminsInfo(Connection connection);
	
	public Boolean checkLogin(String login, Connection connection);
	
	public Boolean checkAdminLogin(String login, Connection connection);
	
	public Boolean checkAdminLoginForUpdate(String login, String idAdmin, Connection connection);
	 
	public Boolean addNewUser(String userName, String userLastName, String mail, String userLogin, String userPassword, String userBonusCard, Connection connection);
	
	public Boolean addNewAdmin(String adminName, String adminLastName, String adminLogin, String adminPassword, String superAdmin, Connection connection);
	
	public Boolean updateAdmin(String adminName, String adminLastName, String adminLogin, String adminPassword, String superAdmin, String idAdmin, Connection connection);
	
	public Boolean deleteAdmin(int idAdmin, Connection connection);
	
	
}
