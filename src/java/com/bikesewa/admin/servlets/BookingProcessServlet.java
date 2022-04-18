package com.bikesewa.admin.servlets;

import com.bikesewa.dao.OnlinebookingDao;
import com.bikesewa.helper.ConnectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookingProcessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingStatus = request.getParameter("booking_status");
        int id = Integer.parseInt(request.getParameter("uid"));

        OnlinebookingDao onlineBookingDao = new OnlinebookingDao(ConnectionProvider.getCon());

        if (onlineBookingDao.updateBookingStatus(id, bookingStatus)) {
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            response.sendRedirect("admin_dashboard.jsp");
        }

    }

}
