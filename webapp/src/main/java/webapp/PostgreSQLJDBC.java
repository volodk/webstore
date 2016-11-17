package webapp;
import java.sql.Connection;
import java.sql.DriverManager;

public class PostgreSQLJDBC {
	   public static Connection getConnectionPG() {
	      Connection c = null;
	      try {
	         Class.forName("org.postgresql.Driver");
	         c = DriverManager
	            .getConnection("jdbc:postgresql://localhost:5432/webstore",
	            "postgres", "1");
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.err.println(e.getClass().getName()+": "+e.getMessage());
	         System.exit(0);
	         return c;
	      }
	      System.out.println("Opened database successfully");
	      return c;
	   }
	}
