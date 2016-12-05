package webapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

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
         
         quer="SELECT \"AdminName\", \"AdminLastName\", \"SuperAdmin\" FROM \"Admins\" Where \"AdminLogin\" = '";
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
	    

	   
}