
package com.bikesewa.user.servlets;

import com.bikesewa.dao.OnlinebookingDao;
import com.bikesewa.entities.Message;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CancelOnlineBookingServ extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int obid = Integer.parseInt(request.getParameter("obid"));
        System.out.println(obid);
               OnlinebookingDao obdao = new  OnlinebookingDao(ConnectionProvider.getCon());

              
               try {
            if(obdao.CancelOnlineBooking(obid)){
                 out.println("success fully cancel online booking ");
               Message msg = new Message("Cancel Successfullty", "success", "alert-success");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }else{
                Message msg = new Message("Sorry can't Cancel ", "error", "alert alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CancelOnlineBookingServ.class.getName()).log(Level.SEVERE, null, ex);
        }
    
     response.sendRedirect("user_dashboard.jsp");
       
    }

    
}
