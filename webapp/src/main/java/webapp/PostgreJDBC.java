package webapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import webapp.AdminsInfo;

import org.apache.catalina.webresources.TomcatURLStreamHandlerFactory;

public class PostgreJDBC {
			
	   public static Connection getConnectionPG() {
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
	


	   public static String[] GetUserInfo(String login,  String password, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 String userName ="";
		 String userLastName ="";
		 String cardNumber =""; 
		 String [] userInfo = new String[4];
		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"UserName\", \"UserLastName\", \"UserBonusCard\" FROM \"Profiles\" Where \"UserLogin\" = '";
         quer = quer.concat(login);
         quer = quer.concat("' and \"UserPassword\" = '");
         quer = quer.concat(password);
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
	   
	  
	   
	   
	   
	   public static String[] GetAdminInfo(String login,  String password, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 String adminName ="";
		 String adminLastName ="";
		 String superAdmin =""; 
		 String [] adminInfo = new String[4];
		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"AdminName\", \"AdminLastName\", CASE WHEN \"SuperAdmin\" IS TRUE THEN '1' ELSE '0' END AS SuperAdmin FROM \"Admins\" Where \"AdminLogin\" = '";
         quer = quer.concat(login);
         quer = quer.concat("' and \"AdminPassword\" = '");
         quer = quer.concat(password);
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
	   
	   
	   
	   
	   
	   
	   
	   public static ArrayList<AdminsInfo> GetAdminsInfo(Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 ArrayList<AdminsInfo> adminsTable = new ArrayList<AdminsInfo>();
		 
		 		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"AdminName\", \"AdminLastName\", \"AdminLogin\", \"AdminPassword\", \"id_admin\", CASE WHEN \"SuperAdmin\" IS TRUE THEN '1' ELSE '0' END AS SuperAdmin FROM \"Admins\";";
         
         ResultSet rs = stmt.executeQuery(quer);
         while ( rs.next() ) {
        	AdminsInfo strAdminInfo = new AdminsInfo();
        	 
        	strAdminInfo.adminName = rs.getString("AdminName");
        	strAdminInfo.adminLsatName = rs.getString("AdminLastName");
        	strAdminInfo.adminLogin= rs.getString("AdminLogin");
        	strAdminInfo.adminPassword = rs.getString("AdminPassword");
        	strAdminInfo.superAdmin = rs.getInt("SuperAdmin");
        	strAdminInfo.idAdmin = rs.getInt("id_admin");
        	adminsTable.add(strAdminInfo);
         }
         rs.close();
         stmt.close();
         
       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         return null;
       }
       return adminsTable;
     } 
	   
	   
	   
	   
	   
	   
	   public static Boolean CheckLogin(String login, Connection connection)
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
	   
	   
	   
	   public static Boolean CheckLoginAdmin(String login, Connection connection)
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
	   
	   
	   
	   
	   public static Boolean CheckLoginAdminForUpdate(String login, String idAdmin, Connection connection)
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
	   
	   
	   
	   
	   public static Boolean AddNewUser(String userName, String userLastName, String mail, String userLogin, String userPassword, String userBonusCard, Connection connection)
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
    

	   
	   
	   
	   public static Boolean AddNewAdmin(String adminName, String adminLastName, String adminLogin, String adminPassword, String superAdmin, Connection connection)
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
	   
	   



	public static Boolean UpdateAdmin(String adminName, String adminLastName, String adminLogin, String adminPassword, String superAdmin, String idAdmin, Connection connection)
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
	
	
	
	
	 public static Boolean DeleteAdmin(int idAdmin, Connection connection)
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
