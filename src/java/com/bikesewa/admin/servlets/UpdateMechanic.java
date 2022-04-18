
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.MechanicDao;
import com.bikesewa.entities.Mechanics;
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
public class UpdateMechanic extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String full_name = request.getParameter("full_name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String salary = request.getParameter("salary");
                int mid = Integer.parseInt(request.getParameter("mid"));
                
                
                
//                out.println(full_name +  email + phone+  gender+ address+ salary );
                // getting photo
                Part part = request.getPart("photo");
                String updtImg = part.getSubmittedFileName();
                
                Mechanics mechanics = new Mechanics();
                 
                
                // getting old img path
               String oldphoto= mechanics.getPhoto();
               
               // set new img
               
               mechanics.setMid(mid);
               mechanics.setPhoto(updtImg);
               mechanics.setFull_name(full_name);
               mechanics.setEmail(email);
               mechanics.setPhone(phone);
               mechanics.setGender(gender);
               mechanics.setAddress(address);
               mechanics.setSalary(salary);
               
               MechanicDao medao = new MechanicDao(ConnectionProvider.getCon());
               
                  boolean ans = medao.updateMechanics(mechanics);
                   if(ans){
                   //old photo path
                   String uploadPath ="F:/6th sem/Project/BikeSewa/web/Mechanic_img/"+oldphoto;
                   
                   // new photo 
                   String newphoto ="F:/6th sem/Project/BikeSewa/web/Mechanic_img/"+updtImg;

                   
                    if (!uploadPath.equals("defaultM_Pic.jpg")){
                    Helper.deleteFile(uploadPath);
                    }
                
                    if (Helper.saveFile(part.getInputStream(), newphoto)) {
                    
                    Message msg = new Message("Mechanic details updated...", "success", "alert-success");
                      HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                         out.println(" updated successfully");
                         
                    }else{
                     Message msg = new Message("Sorry!! Mechanic details not updated", "error", "alert alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                     
                }    
               response.sendRedirect("admin_dashboard.jsp");
               
        
    }

 
    }
}
