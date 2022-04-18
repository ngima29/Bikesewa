
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.AdminDao;
import com.bikesewa.entities.Admin;
import com.bikesewa.entities.Message;
import com.bikesewa.helper.ConnectionProvider;
import com.bikesewa.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddAdminServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
         if(request.getParameter("submit") != null){
                String full_name = request.getParameter("full_name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String password = request.getParameter("password");
                
                 Part part = request.getPart("photo");
                String photo = part.getSubmittedFileName();
                /// create user object and set all the data
                
             
                Admin admin = new Admin(full_name,email,phone,gender,address,password,photo);
                
                AdminDao ado = new AdminDao(ConnectionProvider.getCon());
              
               if(ado.insertAdmin(admin)){
                   String uploadPath ="F:/6th sem/Project/BikeSewa/web/Admin_img/"+photo;
                   Helper.saveFile(part.getInputStream(), uploadPath); 
                   out.println("Admin added successfully");
                    Message msg = new Message("Admin  added successfully ", "success", "alert alert-success");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                
                    }else{
                     Message msg = new Message("Something went wrong !! Admin not added ", "error", "alert alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                }    
               response.sendRedirect("admin_dashboard.jsp");
    }

        
        
    }


   
    
}
