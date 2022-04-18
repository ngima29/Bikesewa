
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@MultipartConfig
public class AddCustomer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
         if(request.getParameter("submit") != null){
                String full_name = request.getParameter("full_name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String password = request.getParameter("salary");
                
                /// create user object and set all the data
                
                User user = new User(full_name,email,phone,gender,address,password);
                
                /// create user dao object
                UserDao dao = new UserDao(ConnectionProvider.getCon());
                if(dao.saveUser(user)){
                   out.println("success");
                    response.sendRedirect("login.jsp");
                    }else{
                     Message msg = new Message("Invalid Details ! try with another", "error", "alert alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);

                     response.sendRedirect("register.jsp");
                }         
    }

        
        
    }
}
