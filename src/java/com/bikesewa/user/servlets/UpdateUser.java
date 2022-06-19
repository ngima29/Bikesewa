package com.bikesewa.user.servlets;

import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;
import com.bikesewa.helper.Helper;

import java.io.File;
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
import static jdk.internal.util.StaticProperty.userName;

@MultipartConfig
public class UpdateUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
                String full_name = request.getParameter("full_name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
             
                
                Part part = request.getPart("Update_photo");
                String imageName = part.getSubmittedFileName();
                 //get the user from the session...
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            
            user.setFull_name(full_name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setGender(gender);
            user.setAddress(address);
           
            //getting old image
           String oldfile = user.getImage();
           //set new image
            user.setImage(imageName);

            //update database....
            UserDao userDao = new UserDao(ConnectionProvider.getCon());

            boolean ans = userDao.updateUser(user);
            if (ans) {
                        
                String path = "F:/6th sem/Project/BikeSewa/web/User_img/"+imageName;
                String  oldfilepath = "F:/6th sem/Project/BikeSewa/web/User_img/"+oldfile;               

                if (!oldfilepath.equals("default_profile.jpg")){
                    Helper.deleteFile(oldfilepath);
                }

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Profile updated...");
                    Message msg = new Message("Profile details updated...", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                   out.println("Profile not updated...");
                    Message msg = new Message("Something went wrong Profile not Updated", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }

                //end of phots work
            } else {
                out.println("not updated..");
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
                s.setAttribute("msg", msg);

            }

            response.sendRedirect("user_dashboard.jsp");
   }

    
}
