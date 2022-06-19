
package com.bikesewa.admin.servlets;

import com.bikesewa.dao.AddServicingHistoryDao;
import com.bikesewa.dao.UserDao;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.Servicinghistory;
import com.bikesewa.entities.User;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateServicingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String bike_num = request.getParameter("bikeNum");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int Km = Integer.parseInt(request.getParameter("Km"));
        int scid = Integer.parseInt(request.getParameter("cid"));
        String scname = request.getParameter("cname"); 
        String scemail = null; 
        int mid = Integer.parseInt(request.getParameter("mid"));        
        String parts_changed = request.getParameter("partsChange");
        int sid = Integer.parseInt(request.getParameter("sid"));
        
         try{
            UserDao udao = new UserDao(ConnectionProvider.getCon());
        User u = udao.getUserByUserId(scid);
        scemail = u.getEmail();
    
        }catch(Exception e) {
            e.printStackTrace();
            
                }
        
                    Servicinghistory servicinghistory = new Servicinghistory();
                    
                   servicinghistory.setSid(sid);
                   servicinghistory.setBike_num(bike_num);
                   servicinghistory.setKm(Km);
                   servicinghistory.setAmount(amount);
                   servicinghistory.setParts_changed(parts_changed);
                   servicinghistory.setMid(mid);
                   servicinghistory.setScname(scname);
                   servicinghistory.setScemail(scemail);
                   servicinghistory.setScid(scid);
                   
                   int nextKm = Km+2000;
                     AddServicingHistoryDao dao = new AddServicingHistoryDao(ConnectionProvider.getCon());
                   if(dao.updateServicingHistory(servicinghistory)){
                   out.println("success fully update servicing record");
                   Message msg = new Message("Successfully update Servicing History",  "success", "alert alert-success");
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
