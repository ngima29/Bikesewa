
package com.bikesewa.user.servlets;
import com.bikesewa.entities.Message;
import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // login
            //fetch email and password
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");
             /// create user dao object
            if("admin@gmail.com".equals(userEmail) && "admin".equals(userPassword) ){
             //AdminDao adao = new AdminDao(ConnectionProvider.getCon());
             HttpSession s = request.getSession();
                s.setAttribute("admin", userEmail);
                response.sendRedirect("admin_dashboard.jsp");
             
            }else{
             UserDao dao = new UserDao(ConnectionProvider.getCon());
             User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
              if (u == null) {
                 Message msg = new Message("Invalid Email or Password ! try with another", "error", "alert alert-danger");
  
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("login.jsp");
            } else {

//                login success
                HttpSession s = request.getSession();
                s.setAttribute("currentUser", u);
                response.sendRedirect("user_dashboard.jsp");

            }
    }
    }
  

}
