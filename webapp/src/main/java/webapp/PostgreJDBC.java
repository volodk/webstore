package webapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


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
	   
	   
	   
	   
	   public static Boolean CheckLogin(String login, Connection connection)
	   {
		 Statement stmt = null;
		 String quer="";
		 int rowCount;
		 		
		 try {
         stmt = connection.createStatement();
         
         quer="SELECT \"UserName\" FROM \"Profiles\" Where \"UserLogin\" = '";
         quer = quer.concat(login);
         quer = quer.concat("';");
         
         ResultSet rs = stmt.executeQuery(quer);
         rs.last();
         rowCount = rs.getRow();
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
	   
}