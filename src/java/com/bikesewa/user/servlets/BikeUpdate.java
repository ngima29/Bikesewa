
package com.bikesewa.user.servlets;

import com.bikesewa.dao.BikeDao;
import com.bikesewa.entities.Bike;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;
import com.bikesewa.helper.Helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
public class BikeUpdate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
             String company = request.getParameter("company");
                String model = request.getParameter("model");
                String color = request.getParameter("color");
                String bike_number = request.getParameter("bike_number");
                //int bid = Integer.parseInt(request.getParameter("bid"));
                //new image
                Part part = request.getPart("update_bike_img");
                String b_img = part.getSubmittedFileName();
                String check = request.getParameter("checkbx");
                    if(check!=null){
                       String state = request.getParameter("stateInput");
                       bike_number = state + " " +bike_number;
                    }

//                 HttpSession b = request.getSession();
//                  Bike bike = (Bike) b.getAttribute("bikeD");
                    HttpSession s = request.getSession();
                    User user = (User) s.getAttribute("currentUser");

                   Bike bike = new Bike();
                  //getting old image path
                   String oldFile = bike.getBike_img();
                   //set new image
                   bike.setBike_img(b_img);
                   
                  bike.setCompany(company);
                  bike.setModel(model);
                  bike.setColor(color);
                  bike.setBike_num(bike_number);
              
              BikeDao dao = new BikeDao(ConnectionProvider.getCon()); 
              boolean ans =  dao.updateBike(bike);
                if(ans){
                //new path
                String path ="F:/6th sem/Project/BikeSewa/web/Bike_img/"+b_img;

                //old photo path
                String pathOldFile ="F:/6th sem/Project/BikeSewa/web/Bike_img/"+oldFile;

                if (!pathOldFile.equals("DefaultBike.jpg")){
                    Helper.deleteFile(pathOldFile);
                }

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Bike updated...");
                    Message msg = new Message("Bike details updated...", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                    //////////////
                    Message msg = new Message("Something went wrong..", "error", "alert-danger");
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
