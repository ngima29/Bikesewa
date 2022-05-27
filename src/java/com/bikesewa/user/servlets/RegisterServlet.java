
package com.bikesewa.user.servlets;

import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import static java.lang.System.out;
import java.util.Base64;
import java.util.Base64.Encoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     ///fetch form data
            if(request.getParameter("submit") != null){
                String full_name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String phone = request.getParameter("user_phone");
                String gender = request.getParameter("gender");
                String address = request.getParameter("user_address");
                String password = request.getParameter("user_password");
                
                // encoding using Base64
                 Encoder encoder = Base64.getEncoder();
                 String encpassword = encoder.encodeToString(password.getBytes());
                
                /// create user object and set all the data
                
                User user = new User(full_name,email,phone,gender,address,encpassword);
                
                /// create user dao object
                UserDao dao = new UserDao(ConnectionProvider.getCon());
                if(dao.saveUser(user)){
                   out.println("successfuly register");
                   Message msg = new Message("succesfully Register", "success", "alert alert-success");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                    response.sendRedirect("login.jsp");
                    }else{
                    out.println("faild to  register");
                    Message msg = new Message("Invalid Details ! try with another", "error", "alert alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);

                     response.sendRedirect("register.jsp");
                }         
    }

    }

}
