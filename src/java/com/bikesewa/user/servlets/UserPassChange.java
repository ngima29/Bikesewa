
package com.bikesewa.user.servlets;

import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserPassChange extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String newPass = request.getParameter("newpass");
                String comPass = request.getParameter("confpass");
                String currPass = request.getParameter("currPass");
                int uid = Integer.parseInt(request.getParameter("uid"));
                
                Base64.Encoder encoder = Base64.getEncoder();
                 String encOldPass = encoder.encodeToString(currPass.getBytes());
                 String encNewPass = encoder.encodeToString(comPass.getBytes());
                 
                 HttpSession s = request.getSession();
                 User user = (User) s.getAttribute("currentUser");
                 
                  String oldpass = user.getPassword();
                  if(oldpass.equals(encOldPass)&& newPass.equals(comPass)){
                      user.setPassword(encNewPass);
                       UserDao userDao = new UserDao(ConnectionProvider.getCon());
                         boolean ans = userDao.updateUserPass(user);
                    if (ans) {
                         out.println("password updated...");
                    Message msg = new Message("password  updated...", "success", "alert-success");
                    s.setAttribute("msg", msg);
                         }
                    }else{
                   out.println("password not updated...");
                    Message msg = new Message("current password not match", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
                  response.sendRedirect("user_dashboard.jsp");
                      
                  }
                
        
    }

   
