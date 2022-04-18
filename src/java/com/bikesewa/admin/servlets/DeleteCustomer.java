
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.MechanicDao;
import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Mechanics;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;
import com.bikesewa.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeleteCustomer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
         UserDao userDao = new UserDao(ConnectionProvider.getCon());
         User user = userDao.getUserByUserId(uid);
        String cusImg = user.getImage();
 
        try {
            if(userDao.deleteUserById(uid)){
                
                String  delCimg = "F:/6th sem/Project/BikeSewa/web/User_img/"+cusImg;               

                if (!delCimg.equals("defaultUser.jpg")){
                    Helper.deleteFile(delCimg);
                }
       
                Message msg = new Message("Delete Successfullty", "success", "alert-success");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }else{
                Message msg = new Message("Invalid Details ! try with another", "error", "alert alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeleteMechanic.class.getName()).log(Level.SEVERE, null, ex);
        }
    
     response.sendRedirect("admin_dashboard.jsp");

    }
}
