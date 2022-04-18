
package com.bikesewa.user.servlets;

import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Message;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ForgotPass extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        
                String email = request.getParameter("email").trim();
                String phone = request.getParameter("phone");
                String password = request.getParameter("newpassword");
                
                 UserDao userDao = new UserDao(ConnectionProvider.getCon());
                  boolean ans = userDao.forgotPass(email, phone, password);
                  if(ans){
                 Message msg = new Message("Invalid Details ! try with another", "error", "alert alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("login.jsp");
                      
                  }else{
                 Message msg = new Message("password update successfully", "success", "alert-success");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
                response.sendRedirect("login.jsp");
                      
                  }
    }
    
}
