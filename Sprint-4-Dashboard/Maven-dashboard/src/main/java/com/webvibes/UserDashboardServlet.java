package com.webvibes;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.booking.dao.BookingDAO;
import com.booking.model.Booking;
import com.booking.model.User; 

@WebServlet("/user-dashboard")
public class UserDashboardServlet extends HttpServlet
 {
    private static final long serialVersionUID = 1L;
    
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException
     {
        bookingDAO = new BookingDAO(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException
             {
        
        HttpSession session = request.getSession(false); 
        
        if (session == null || session.getAttribute("loggedInUser") == null) 
        {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        try 
        {

            User user = (User) session.getAttribute("loggedInUser");
            int userId = user.getId(); 


            List<Booking> userBookings = bookingDAO.getBookingsByUser(userId);
            
            int pendingCount = bookingDAO.getBookingCountByUser(userId, "PENDING");
            int confirmedCount = bookingDAO.getBookingCountByUser(userId, "CONFIRMED");
            int cancelledCount = bookingDAO.getBookingCountByUser(userId, "CANCELLED");
            int totalBookings = userBookings.size();

        
            request.setAttribute("bookingsList", userBookings);
            request.setAttribute("pendingCount", pendingCount);
            request.setAttribute("confirmedCount", confirmedCount);
            request.setAttribute("cancelledCount", cancelledCount);
            request.setAttribute("totalBookings", totalBookings);

            request.getRequestDispatcher("/WEB-INF/views/user-dashboard.jsp").forward(request, response);

        }
         catch (Exception e)
        {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Dashboard loading failed");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException
            {
        doGet(request, response);
    }
}