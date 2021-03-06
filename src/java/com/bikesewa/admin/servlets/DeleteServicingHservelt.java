
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.AddServicingHistoryDao;
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

public class DeleteServicingHservelt extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               int sid = Integer.parseInt(request.getParameter("sid"));
               AddServicingHistoryDao dao = new AddServicingHistoryDao(ConnectionProvider.getCon());
              
               try {
            if(dao.deleteServicingHistory(sid)){
                 out.println("success fully delete servicing history");
               Message msg = new Message("Delete Successfullty", "success", "alert-success");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }else{
                Message msg = new Message("Sorry can't delete", "error", "alert alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeleteServicingHservelt.class.getName()).log(Level.SEVERE, null, ex);
        }
    
     response.sendRedirect("admin_dashboard.jsp");
                
    }
 

}
