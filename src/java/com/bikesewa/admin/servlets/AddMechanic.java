
package com.bikesewa.admin.servlets;

import com.bikesewa.entities.Mechanics;
import com.bikesewa.dao.MechanicDao;
import com.bikesewa.entities.Message;
import com.bikesewa.helper.ConnectionProvider;
import com.bikesewa.helper.Helper;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddMechanic extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
         if(request.getParameter("submit") != null){
                String full_name = request.getParameter("full_name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String salary = request.getParameter("salary");
                
                 Part part = request.getPart("photo");
                String photo = part.getSubmittedFileName();
                /// create user object and set all the data
                
                Mechanics mechanics = new Mechanics(full_name,email,phone,photo,gender,address,salary);
                
                /// create user dao object
               // MechanicDao dao = new MechanicDao(ConnectionProvider.getCon());
               MechanicDao mechanicdao = new MechanicDao(ConnectionProvider.getCon());
               if(mechanicdao.saveMechanic(mechanics)){
                   String uploadPath ="F:/6th sem/Project/BikeSewa/web/Mechanic_img/"+photo;
                   Helper.saveFile(part.getInputStream(), uploadPath); 
                   out.println("mechanic added successfully");
                    Message msg = new Message("Mechanic not added successfully ", "success", "alert alert-success");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                
                    }else{
                     Message msg = new Message("Something went wrong !! Mechanic not added ", "error", "alert alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                }    
               response.sendRedirect("admin_dashboard.jsp");
    }

        
        
    }


}
