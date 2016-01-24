package webapp;

public class AuthService {
	public String realLogin = "admin"; 
	public String realPass = "admin";
	
	public boolean allowLogin(String login, String password){
		
		if(login==null){
		login="";
		}
		
		if(password==null){
		password="";
		}
		
		if (!login.equals(realLogin) | !password.equals(realPass)){
			return false;
		}
		else{
			return true;
		}
	}
	
}
