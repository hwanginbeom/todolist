package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class AllController extends HttpServlet {
       
    public AllController() {
        super();
    }
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String command = request.getParameter("command");
      if(command.equals("write")) {
         write(request,response);
      }else if(command.equals("delete")) {
         delete(request,response);
      }else if(command.equals("update")){
        
      }
   }

   private void delete(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	
}
private void write(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	
}

}
