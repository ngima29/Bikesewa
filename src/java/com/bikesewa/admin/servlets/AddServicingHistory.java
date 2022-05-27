
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.AddServicingHistoryDao;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.Servicinghistory;
import com.bikesewa.helper.ConnectionProvider;
import java.time.LocalDate;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddServicingHistory extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String bike_num = request.getParameter("bikeNum");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int km = Integer.parseInt(request.getParameter("Km"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        int bid = Integer.parseInt(request.getParameter("bid"));
        int mid = Integer.parseInt(request.getParameter("mid"));        
        String partsChnage = request.getParameter("partsChange");
        int nextKm = km+2000;
        Date servicingDate =null;
        Date nextServicingDate =null;
        
    

       LocalDate date = LocalDate.now();
       LocalDate nextDate = date.plusDays(75);
       servicingDate = Date.valueOf(date);
       nextServicingDate = Date.valueOf(nextDate);
       
	
       System.out.println(bike_num + " " + km + " " + amount + " " + servicingDate + " " + partsChnage + " " + nextServicingDate+ " " +nextKm + " " + uid + " " + bid + " " +mid);
     Servicinghistory servicinghistory = new Servicinghistory(bike_num,km,amount,servicingDate,partsChnage,nextServicingDate,nextKm,uid,bid,mid);
     
      AddServicingHistoryDao dao = new AddServicingHistoryDao(ConnectionProvider.getCon());
       if(dao.insertServicing(servicinghistory)){
                   out.println("success fully added servicing record");
                   Message msg = new Message("Successfully added to Servicing History",  "success", "alert alert-success");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
     
                    }else{
                      Message msg = new Message("Something Went Wrong Please Try agin!!", "error", "alert alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);

                     
                }  
       response.sendRedirect("admin_dashboard.jsp");
        
    }

   
}
