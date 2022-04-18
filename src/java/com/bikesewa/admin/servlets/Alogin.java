
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.AdminDao;
import com.bikesewa.entities.Admin;
import com.bikesewa.entities.Message;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Alogin extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String email = request.getParameter("aemail");
         String Password = request.getParameter("apassword");
       
         AdminDao ad = new AdminDao(ConnectionProvider.getCon());
         Admin a = ad.getAdminByEmailAndPassword(email, Password);
         if (a == null) {
                 Message msg = new Message("Invalid Details ! try with another", "error", "alert alert-danger");
  
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("admin.jsp");
            } else {

//                login success
                HttpSession s = request.getSession();
                s.setAttribute("currentAdmin", a);
                response.sendRedirect("admin_dashboard.jsp");

            }
        
        
        
        
        
    }
}
