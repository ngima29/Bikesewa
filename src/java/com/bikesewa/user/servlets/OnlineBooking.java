
package com.bikesewa.user.servlets;

import com.bikesewa.dao.BikeDao;
import com.bikesewa.dao.OnlinebookingDao;
import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Bike;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.User;
import com.bikesewa.entities.Onlinebooking;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OnlineBooking extends HttpServlet {

    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String c_name  = request.getParameter("full_name");
                String c_email  = request.getParameter("email");
                
                String problems  = request.getParameter("bike_problem");
                String booking_date =request.getParameter("online_booking_date");
                String Booking_Time  = request.getParameter("bookingTime");
                int uid = Integer.parseInt(request.getParameter("uid"));
                //int bid = Integer.parseInt(request.getParameter("bid"));
                 //System.out.println(c_name +" "+ c_email  +" "+  problems +" "+ booking_date +" "+ uid  );
                 //Bike bike = new Bike();
                BikeDao b = new BikeDao(ConnectionProvider.getCon());
                Bike bike = b.getBikeByUid(uid);
                 if (bike != null) {
                  String bike_num = bike.getBike_num();
                  int bid = bike.getBid();
                 
                 System.out.println(c_name +" "+ c_email  +" "+  problems +" "+ booking_date +" "+ Booking_Time+" "+ uid +" "+ bid+" "+ bike_num );
                Onlinebooking onlinebooking = new Onlinebooking(c_name,c_email,bike_num,problems,booking_date,Booking_Time,uid,bid);
                 
                OnlinebookingDao dao = new OnlinebookingDao(ConnectionProvider.getCon());
                if(dao.insertBooking(onlinebooking)){
                    out.println("success");
                    response.sendRedirect("user_dashboard.jsp");
                    
                }else{
                     Message msg = new Message("Invalid Details ! try with another", "error", "alert alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);

                     response.sendRedirect("login.jsp");
                } 
                 }
    }

    }

        
        
        
    

    


