package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AccidentDAO;
import model.CustomerDAO;
import model.PlaceDAO;
import model.TodolistDAO;
import model.domain.AccidentDTO;
import model.domain.CustomerDTO;
import model.domain.PlaceDTO;


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
         update(request,response);
      }
   }

   private void delete(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	
}
private void write(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	
}
   
   protected void update(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      String id = request.getParameter("id");
      String newName = request.getParameter("newName");
      System.out.println("----- " + newName);
      if (id != null && newName != null) {
         try {
            if (TodolistDAO.update(id, newName)) {
               TodolistDAO.update(id, newName);
               HttpSession session = request.getSession();
               session.setAttribute("newName", newName);
               response.sendRedirect("updateSucc");
            } else {
               request.setAttribute("msg", "Error");
               request.getRequestDispatcher("msgView.jsp").forward(request, response);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      } else {
         response.sendRedirect("login.html");
      }

   }


}
