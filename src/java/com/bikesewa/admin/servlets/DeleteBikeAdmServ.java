
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.BikeDao;
import com.bikesewa.entities.Bike;
import com.bikesewa.entities.Message;
import com.bikesewa.helper.ConnectionProvider;
import com.bikesewa.helper.Helper;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ngima
 */
public class DeleteBikeAdmServ extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
   
         int bid = Integer.parseInt(request.getParameter("bid"));  
         BikeDao bdo = new BikeDao(ConnectionProvider.getCon());
         Bike b = bdo.getBikeByBid(bid);
         
           String oldphoto =  b.getBike_img();
           
            try {
            if(bdo.deleteBike(bid)){
                
                String  oldmphoto = "F:/6th sem/Project/BikeSewa/web/Bike_img/"+oldphoto;               

                if (!oldmphoto.equals("defaultM_Pic.jpg")){
                    Helper.deleteFile(oldmphoto);
                }
       
                Message msg = new Message("Delete Successfullty", "success", "alert-success");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }else{
                Message msg = new Message("Sorry can't delete", "error", "alert alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeleteAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    
     response.sendRedirect("admin_dashboard.jsp");
    }

    
}
