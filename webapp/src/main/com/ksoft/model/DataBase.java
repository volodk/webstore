package com.ksoft.model;
import com.ksoft.interfaces.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.io.InputStream;
import java.io.IOException;
//import org.postgresql.largeobject.*;
import java.util.ArrayList;
import java.util.Collections;



public class DataBase implements IDataBase{
			
	   public Connection getConnectionPostgresql() {
	      Connection c = null;
	      try {
	         Class.forName("org.postgresql.Driver");
	         c = DriverManager
	            .getConnection("jdbc:postgresql://localhost:5432/webstore",
	            "postgres", "1");
	      } catch (Exception e) {
	    	System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	       return null;
	      }
	      return c;
	   }
	

	   
	   
	   public Image getImage(Connection connection, String ImageId) 
			   throws IOException
	   {
		 Image image = new Image();
		 int len = 1024;
				 
		 String quer ="SELECT \"image\" "
		 		+ "FROM \"Images\" "
		 		+ "WHERE \"id_image\" = '";
		 
		 quer = quer.concat(ImageId);
	     quer = quer.concat("';");
                 
         try {
			 try (Statement stmt = connection.createStatement()){
				 try (ResultSet rs = stmt.executeQuery(quer)){
					 	
					 if (rs.next()) {
						    InputStream readImg = rs.getBinaryStream("image");
			                
						    len = readImg.available();
				            byte [] rb = new byte[len];
						    
			                int index = readImg.read(rb, 0, len);
			                
			                image.setImage(rb);
			                image.setImgLen(len);
					 }
					 
				 }
				 
			 }
         
		 } catch ( SQLException e ) {
			 e.printStackTrace();
			 return image = null;
		 }
		 return image;
	   } 
	   
	   
	   
	   
	   public List<IGood> getGoods(Connection connection, int categoryId)
	   {
		 List<IGood> goods = new ArrayList<IGood>();
		 
		 String query="SELECT g.id_category AS categoryId, "
		 		+ "g.id_good AS goodId,"
		 		+ "g.id_brand AS brandId,"
		 		+ "brnd.brand_name AS brandName,"
		 		+ "g.is_new AS isNew,"
		 		+ "contf.content_field AS name,"
		 		+ "g.price AS price,"
		 		+ "g.disount_price AS discountPrice,"
		 		+ "g.bonus_count AS bonuses,"
		 		+ "im.id_image AS imageId"
		 		+ " FROM \"Goods\" g "
		 		+ "LEFT OUTER JOIN \"Gallery\" gal ON (g.id_gallery = gal.id_gallery)"
		 		+ "LEFT OUTER JOIN \"Images\" im ON (gal.id_image = im.id_image)"
		 		+ "LEFT OUTER JOIN \"Contents\" cont ON (g.id_content = cont.id_content)"
		 		+ "LEFT OUTER JOIN \"Content_fields\" contf ON (cont.id_content_field = contf.id_content_field)"
		 		+ "LEFT OUTER JOIN \"Brands\" brnd ON (g.id_brand = brnd.id_brand)"
		 		+ "WHERE (g.is_avalible = \'1\')"
		 		+ "AND (contf.name_field = \'name\')"
		 		+ "AND (g.id_category = \'" + categoryId + "\')";
		 
                 
         try {
			 try (Statement stmt = connection.createStatement()){
				 try (ResultSet rs = stmt.executeQuery(query)){
			 	
					 while ( rs.next()) {
						 Good good = new Good();
		        	 
						 good.setCategoryId(rs.getInt("categoryId"));
						 good.setGoodId(rs.getInt("goodId"));
						 good.setBrandId(rs.getInt("brandId"));
						 good.setBrandName(rs.getString("brandName"));
						 good.setIsNew(rs.getInt("isNew"));
						 good.setName(rs.getString("name"));
						 good.setPrice(rs.getFloat("price"));
						 good.setDiscountPrice(rs.getFloat("discountPrice")); 
						 good.setBonuses(rs.getInt("bonuses"));
						 good.setImageId(rs.getInt("imageId"));
						 						 
						 goods.add(good);
					 }
				 }	 
			 }
         
		 } catch ( SQLException e ) {
			 e.printStackTrace();
			 return Collections.emptyList();
		 }
		 return goods;
	   } 
	   
	   
	   
	   
	   public List<ICategory> getCategories(Connection connection)
	   {
		 List<ICategory> categories = new ArrayList<ICategory>();
		 
		 String query="SELECT c.id_category,c.category_position,c.category_name,c.id_parent_category, cc.category_name AS parent_category_name FROM \"Categories\" c "
         		+ "LEFT OUTER JOIN \"Categories\" cc ON (c.id_parent_category = cc.id_category) Where c.category_status = \'1\'";
                  
         try {
			 try (Statement stmt = connection.createStatement()){
				 try (ResultSet rs = stmt.executeQuery(query)){
			 	
					 while ( rs.next()) {
						 Category category = new Category();
		        	 
						 category.setCategoryId(rs.getInt("id_category"));
						 category.setCategoryPosition(rs.getInt("category_position"));
						 category.setCategoryName(rs.getString("category_name"));
						 category.setIdParentCategory(rs.getInt("id_parent_category"));
						 category.setParentCategoryName(rs.getString("parent_category_name"));			        	 

						 categories.add(category);
					 }
				 }	 
			 }
         
		 } catch ( SQLException e ) {
			 e.printStackTrace();
			 return Collections.emptyList();
		 }
		 return categories;
	   } 
	   
	   
	   	   
	   
	   public String[] getTopLevelCategories(Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 String [] categories = new String[10];
		 
		 int i = 0;
				 		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"category_name\" FROM \"Categories\" Where \"category_status\" = '1' and \"category_position\" = '1';";
                  
         ResultSet rs = stmt.executeQuery(quer);
         
         while ( rs.next() ) {
        	 categories[i] = rs.getString("category_name");
            i++;
         }
         rs.close();
         stmt.close();
                           
       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         return null;
       }
       return categories;
     }
	   
	   
	   
	   
	   public String getUserId(String login,  String password, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 String idUser ="";
		 		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"id_user\" FROM \"Profiles\" Where \"UserLogin\" = '";
         quer = quer.concat(login);
         quer = quer.concat("' and \"UserPassword\" = '");
         quer = quer.concat(password);
         quer = quer.concat("';");
         
         ResultSet rs = stmt.executeQuery(quer);
         while ( rs.next() ) {
            idUser = rs.getString("id_User");
         }
         rs.close();
         stmt.close();
                           
       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         return null;
       }
       return idUser;
     }
	   
	   
	   
	   
	   
	   public String[] getUserInfo(String idUser, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 String userName ="";
		 String userLastName ="";
		 String cardNumber =""; 
		 String [] userInfo = new String[4];
		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"UserName\", \"UserLastName\", \"UserBonusCard\" FROM \"Profiles\" Where \"id_user\" = '";
         quer = quer.concat(idUser);
         quer = quer.concat("';");
         
         ResultSet rs = stmt.executeQuery(quer);
         while ( rs.next() ) {
            userName = rs.getString("UserName");
            userLastName = rs.getString("UserLastName");
            cardNumber = rs.getString("UserBonusCard");
         }
         rs.close();
         stmt.close();
         
         userInfo[1]  = userName;
         userInfo[2]  = userLastName;
         userInfo[3]  = cardNumber;
         
       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         return null;
       }
       return userInfo;
     }
	   
	  
	   
	   
	   
	   public String getAdminId(String login,  String password, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 String adminId ="";
		 	 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"id_admin\" FROM \"Admins\" Where \"AdminLogin\" = '";
         quer = quer.concat(login);
         quer = quer.concat("' and \"AdminPassword\" = '");
         quer = quer.concat(password);
         quer = quer.concat("';");
         
         ResultSet rs = stmt.executeQuery(quer);
         while ( rs.next() ) {
        	adminId = rs.getString("id_admin");        	
         }
         rs.close();
         stmt.close();
                           
       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         return null;
       }
       return adminId;
     } 
	   
	   
	   	   
	   
	   
	   public String[] getAdminInfo(String adminId, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 String adminName ="";
		 String adminLastName ="";
		 String superAdmin =""; 
		 String [] adminInfo = new String[4];
		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"AdminName\", \"AdminLastName\", CASE WHEN \"SuperAdmin\" IS TRUE THEN '1' ELSE '0' END AS SuperAdmin FROM \"Admins\" Where \"id_admin\" = '";
         quer = quer.concat(adminId);
         quer = quer.concat("';");
         
         ResultSet rs = stmt.executeQuery(quer);
         while ( rs.next() ) {
        	adminName = rs.getString("AdminName");
        	adminLastName = rs.getString("AdminLastName");
            superAdmin = rs.getString("SuperAdmin");
         }
         rs.close();
         stmt.close();
         
         adminInfo[1]  = adminName;
         adminInfo[2]  = adminLastName;
         adminInfo[3]  = superAdmin;
         
       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         return null;
       }
       return adminInfo;
     } 
	   
	   	     
	   
	   
	   
	   public List<IAdmins> getAllAdminsInfo(Connection connection)
	   {
		 List<IAdmins> adminsTable = new ArrayList<>();
		 String query="SELECT \"AdminName\", \"AdminLastName\", \"AdminLogin\", \"AdminPassword\", \"id_admin\", CASE WHEN \"SuperAdmin\" IS TRUE THEN '1' ELSE '0' END AS SuperAdmin FROM \"Admins\";";
		 		 		
		 try {
			 try (Statement stmt = connection.createStatement()){
				 try (ResultSet rs = stmt.executeQuery(query)){
			 	
					 while ( rs.next()) {
						 IAdmins strAdminInfo = new Admins();
		        	 
			        	 strAdminInfo.setAdminName(rs.getString("AdminName"));
			        	 strAdminInfo.setAdminLsatName(rs.getString("AdminLastName"));
			        	 strAdminInfo.setAdminLogin(rs.getString("AdminLogin"));
			        	 strAdminInfo.setAdminPassword(rs.getString("AdminPassword"));
			        	 strAdminInfo.setSuperAdmin(rs.getInt("SuperAdmin"));
			        	 strAdminInfo.setIdAdmin(rs.getInt("id_admin"));
			        	 
			        	 adminsTable.add(strAdminInfo);
					 }
				 }	 
			 }
         
		 } catch ( SQLException e ) {
			 e.printStackTrace();
			 return Collections.emptyList();
		 }
		 return adminsTable;
	   } 
	   
	   	   
	   
	   
	   
	   public Boolean checkLogin(String login, Connection connection)
	   {
		 Statement stmt = null;
		 int rowCount = 0;
		 String quer="";
		 		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"UserName\" FROM \"Profiles\" Where \"UserLogin\" = '";
         quer = quer.concat(login);
         quer = quer.concat("';");
         
         ResultSet rs = stmt.executeQuery(quer);
         while (rs.next() ) {
             rowCount++;
          }
          rs.close();
          stmt.close();
                  
	       } catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         return null;
	       }
	       if (rowCount > 0){
	    	   return false;
	       }
	       else {return true;	   
	       }
	     }
	   
	   
	   
	   
	   
	   public Boolean checkAdminLogin(String login, Connection connection)
	   {
		 Statement stmt = null;
		 int rowCount = 0;
		 String quer="";
		 		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"AdminName\" FROM \"Admins\" Where \"AdminLogin\" = '";
         quer = quer.concat(login);
         quer = quer.concat("';");
         
         ResultSet rs = stmt.executeQuery(quer);
         while (rs.next() ) {
             rowCount++;
          }
          rs.close();
          stmt.close();
                  
	       } catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         return null;
	       }
	       if (rowCount > 0){
	    	   return false;
	       }
	       else {return true;	   
	       }
	     }
	   
	   
	   	   
	   
	   
	   public Boolean checkAdminLoginForUpdate(String login, String idAdmin, Connection connection)
	   {
		 Statement stmt = null;
		 int rowCount = 0;
		 String quer="";
		 		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"AdminName\" FROM \"Admins\" Where \"AdminLogin\" = '";
         quer = quer.concat(login);
         quer = quer.concat("' AND \"id_admin\" <> '");
         quer = quer.concat(idAdmin);
         quer = quer.concat("';");
         
         ResultSet rs = stmt.executeQuery(quer);
         while (rs.next() ) {
             rowCount++;
          }
          rs.close();
          stmt.close();
                  
	       } catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         return null;
	       }
	       if (rowCount > 0){
	    	   return false;
	       }
	       else {return true;	   
	       }
	     }
	   
	   
	   
	   
	   
	   public Boolean addNewUser(String userName, String userLastName, String mail, String userLogin, String userPassword, String userBonusCard, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 int maxId = 0;
		 String maxIdStr;
		 
		 
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT max(\"id_user\") FROM \"Profiles\";";
         
         ResultSet rs = stmt.executeQuery(quer);
         while (rs.next() ) {
        	 maxId = rs.getInt("max");            
         }
         rs.close();
         
		 } catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	     }
         
         
         maxId++;
         maxIdStr = Integer.toString(maxId);
         
         quer = "INSERT INTO \"Profiles\" (\"UserName\", \"UserLastName\", \"UserMail\", \"UserLogin\", \"UserPassword\", \"UserBonusCard\", \"id_user\") VALUES ('";
         quer = quer.concat(userName);
         quer = quer.concat("','");
         quer = quer.concat(userLastName);
         quer = quer.concat("','");
         quer = quer.concat(mail);
         quer = quer.concat("','");
         quer = quer.concat(userLogin);
         quer = quer.concat("','");
         quer = quer.concat(userPassword);
         quer = quer.concat("','");
         quer = quer.concat(userBonusCard);
         quer = quer.concat("','");
         quer = quer.concat(maxIdStr);
         quer = quer.concat("');");
         
        try {
         stmt.execute(quer);
         stmt.close();
          
       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         return false;
       }
       return true;
	   }
    

	   
	   
	   
	   public Boolean addNewAdmin(String adminName, String adminLastName, String adminLogin, String adminPassword, String superAdmin, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 int maxId = 0;
		 String maxIdStr;
		 
		 
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT max(\"id_admin\") FROM \"Admins\";";
         
         ResultSet rs = stmt.executeQuery(quer);
         while (rs.next() ) {
        	 maxId = rs.getInt("max");            
         }
         rs.close();
         
		 } catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	     }
         
         
         maxId++;
         maxIdStr = Integer.toString(maxId);
         
         quer = "INSERT INTO \"Admins\" (\"AdminName\", \"AdminLastName\", \"AdminLogin\", \"AdminPassword\", \"SuperAdmin\", \"id_admin\") VALUES ('";
         quer = quer.concat(adminName);
         quer = quer.concat("','");
         quer = quer.concat(adminLastName);
         quer = quer.concat("','");
         quer = quer.concat(adminLogin);
         quer = quer.concat("','");
         quer = quer.concat(adminPassword);
         quer = quer.concat("','");
         quer = quer.concat(superAdmin);
         quer = quer.concat("','");
         quer = quer.concat(maxIdStr);
         quer = quer.concat("');");
         
        try {
         stmt.execute(quer);
         stmt.close();
          
       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         return false;
       }
       return true;
     }
	   
	   



	   public Boolean updateAdmin(String adminName, String adminLastName, String adminLogin, String adminPassword, String superAdmin, String idAdmin, Connection connection)
	{
		 Statement stmt = null;
		 String quer="";
		 
	try{	 
 	  stmt = connection.createStatement();
	 
	 	  
	  quer = "UPDATE \"Admins\" SET \"AdminName\"='";
	  quer = quer.concat(adminName);
	  quer = quer.concat("', \"AdminLastName\"='");
	  quer = quer.concat(adminLastName);
	  quer = quer.concat("', \"AdminLogin\"='");
	  quer = quer.concat(adminLogin);
	  quer = quer.concat("', \"AdminPassword\"='");
	  quer = quer.concat(adminPassword);
	  quer = quer.concat("', \"SuperAdmin\"='");
	  quer = quer.concat(superAdmin);
	  quer = quer.concat("' WHERE id_admin = '");
	  quer = quer.concat(idAdmin);
      quer = quer.concat("';");
	  
	
	  stmt.execute(quer);
	  stmt.close();
	   
	} catch ( Exception e ) {
	  System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	  return false;
	}
	return true;
	}
	
	
	   
	
	
	   public Boolean deleteAdmin(int idAdmin, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		
		 try {
       stmt = connection.createStatement();
       
             
       quer = "DELETE FROM \"Admins\" WHERE id_admin = '";
       quer = quer.concat(Integer.toString(idAdmin));
       quer = quer.concat("';");
       
       stmt.execute(quer);
       stmt.close();
        
     } catch ( Exception e ) {
       System.err.println( e.getClass().getName()+": "+ e.getMessage() );
       return false;
     }
     return true;
   }
	
	
	

}	   
