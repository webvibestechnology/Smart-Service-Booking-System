package com.webvibes.booking;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyBookingsServlet")
public class MyBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");
            
          
            if (userId == null) {
                userId = 1; 
            }

           
            List<Booking> userBookings = bookingDAO.getBookingsByUser(userId);
            
         
            request.setAttribute("bookingsList", userBookings);
            request.getRequestDispatcher("/myBookings.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Exception inside MyBookingsServlet doGet: " + e.getMessage());
            response.sendRedirect("error.jsp");
        }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}