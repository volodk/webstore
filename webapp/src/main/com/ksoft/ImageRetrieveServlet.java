package com.ksoft;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;


public class ImageRetrieveServlet extends HttpServlet {
    private static final long serialVersionUID = 6290659385134794998L;

    private Connection conDB;    
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
		
				this.doPost(req, resp);
					
   }
 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
          
			DataBase dBClass = new DataBase();
		
    		String imageId = req.getParameter("imageId");
                       
            conDB = dBClass.getConnectionPostgresql();
            
            Image image = dBClass.getImage(conDB, imageId);
              
            resp.reset();
            resp.setContentType("image/jpg");
            resp.getOutputStream().write(image.image,0,image.imgLen);
            resp.getOutputStream().flush();  
                                         
            try{
				conDB.close();
			} catch ( Exception e ) {
				System.err.println( e.getClass().getName()+": "+ e.getMessage() );    
			}
}	  
}