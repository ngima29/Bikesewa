package com.bikesewa.user.servlets;

import com.bikesewa.dao.BikeDao;
import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Bike;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;
import com.bikesewa.helper.Helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class BikeRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("submit") != null) {
            String company = request.getParameter("company");
            String model = request.getParameter("model");
            String color = request.getParameter("color");
            String bike_number = request.getParameter("bike_number");

            Part part = request.getPart("bike_img");
            String b_img = part.getSubmittedFileName();
            

            String check = request.getParameter("checkbx");
            if(check!=null){
               String state = request.getParameter("stateInput");
               bike_number = state + " " +bike_number;
            }
            
//            String FinalBikeNum = null ;
//            if(state != null){
//              FinalBikeNum =    
//            }else{
//                FinalBikeNum = bike_number;
//            }
//            
            //get the user from the session...
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            // create bike object and pass data into  bike object
            //creak bikedao object
            BikeDao dao = new BikeDao(ConnectionProvider.getCon());
            Bike bike = new Bike(company, model, b_img, color, bike_number, user.getUid());


            if (dao.saveBike(bike)) {
                //image saving
                String uploadPath = "F:/6th sem/Project/BikeSewa/web/Bike_img/" + b_img;
                Helper.saveFile(part.getInputStream(), uploadPath);
                out.println("done");

                //       int bid = bike.getBid();
                //     Bike b = dao.getBikeByUid(bid);
//               HttpSession bs = request.getSession();
//                bs.setAttribute("uBike", b);
                out.println("bike  successfully register");
                Message msg = new Message("Successfully register ", "success", "alert alert-success");
                HttpSession m = request.getSession();
                m.setAttribute("msg", msg);

                //end of phots work
            } else {
                out.println("bike  not register");
                Message msg = new Message("sorry something went wrong Bike Not  Register ", "error", "alert alert-danger");
                HttpSession m = request.getSession();
                m.setAttribute("msg", msg);
            }
        }
        response.sendRedirect("user_dashboard.jsp");

    }

}
