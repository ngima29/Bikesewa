
package com.bikesewa.admin.servlets;

import com.bikesewa.entities.Message;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Adminlogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
            s.removeAttribute("currentAdmin");
            Message m = new Message("Logout Successfully", "success", "alert alert-success");
            s.setAttribute("msg", m);
            response.sendRedirect("index.jsp");
        
    }
    

}
