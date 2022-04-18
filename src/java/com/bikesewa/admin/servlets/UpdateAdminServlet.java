
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.AdminDao;
import com.bikesewa.entities.Admin;
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
public class UpdateAdminServlet extends HttpServlet {

      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String full_name = request.getParameter("full_name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String password = request.getParameter("password");
                int aid = Integer.parseInt(request.getParameter("aid"));
                
                
                
//                out.println(full_name +  email + phone+  gender+ address+ salary );
                // getting photo
                Part part = request.getPart("photo");
                String updtImg = part.getSubmittedFileName();

                Admin admin = new Admin();
                
                // getting old img path
               String oldphoto= admin.getPhoto();
               
               // set new img
               admin.setAid(aid);
               admin.setFull_name(full_name);
               admin.setEmail(email);
               admin.setPhone(phone);
               admin.setAddress(address);
               admin.setGender(gender);
               admin.setPassword(password);
               admin.setPhoto(updtImg);
      
               AdminDao ado = new AdminDao(ConnectionProvider.getCon());
               
                  boolean ans = ado.updateAdmin(admin);
                   if(ans){
                   //old photo path
                   String uploadPath ="F:/6th sem/Project/BikeSewa/web/Admin_img/"+oldphoto;
                   
                   // new photo 
                   String newphoto ="F:/6th sem/Project/BikeSewa/web/Admin_img/"+updtImg;

                   
                    if (!uploadPath.equals("defaultM_Pic.jpg")){
                    Helper.deleteFile(uploadPath);
                    }
                
                    if (Helper.saveFile(part.getInputStream(), newphoto)) {
                    
                    Message msg = new Message("Admin details updated...", "success", "alert-success");
                      HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                         out.println(" admin updated successfully");
                         
                    }else{
                     Message msg = new Message("Sorry!! Admin details not updated", "error", "alert alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                     
                }    
               response.sendRedirect("admin_dashboard.jsp");
               
        
    }

 
    }

}
