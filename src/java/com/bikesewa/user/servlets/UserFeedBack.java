
package com.bikesewa.user.servlets;

import com.bikesewa.dao.UserFeedbackDao;
import com.bikesewa.entities.Message;
import com.bikesewa.entities.UserFeedback;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserFeedBack extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
             int uid = Integer.parseInt(request.getParameter("uid"));
             String uf_name  = request.getParameter("ufname");
             String uf_email  = request.getParameter("ufemail");
             String uf_message  = request.getParameter("ufmessage");
             
             //out.println(uid  +" "+ uf_name +" "+ uf_email +" "+ uf_message );
             UserFeedback userFeedback = new UserFeedback(uf_name,uf_email,uf_message,uid);
             UserFeedbackDao ufdao = new UserFeedbackDao(ConnectionProvider.getCon());
             if(ufdao.saveUserFeedback(userFeedback)){
                 out.println("Feedback  successfully saved");
                    Message msg = new Message("Thank you for your feedback ", "success", "alert alert-success");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                 
                    }else{
                 out.println("Feedback  not received");
                     Message msg = new Message("Sorry we don't Received Your Feedback Thank you ", "error", "alert alert-danger");
                        HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
             }
              response.sendRedirect("user_dashboard.jsp");
}
}
