package com.webvibes.booking;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProviderBookingsServlet")
public class ProviderBookingsServlet extends HttpServlet {
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
            Integer providerId = (Integer) session.getAttribute("providerId");
            
       
            if (providerId == null) {
                providerId = 1; 
            }

   
      
            List<Booking> providerBookings = bookingDAO.getAllBookings();
            
            request.setAttribute("providerBookingsList", providerBookings);
            request.getRequestDispatcher("/providerBookings.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Exception inside ProviderBookingsServlet doGet: " + e.getMessage());
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String bookingIdParam = request.getParameter("bookingId");
            String updatedStatus = request.getParameter("status");

            if (bookingIdParam != null && updatedStatus != null && !bookingIdParam.trim().isEmpty()) {
                int bookingId = Integer.parseInt(bookingIdParam);
                
                boolean isUpdated = bookingDAO.updateBookingStatus(bookingId, updatedStatus);
                
                if (isUpdated) {
                    response.sendRedirect("ProviderBookingsServlet?update=success");
                    return;
                }
            }
            response.sendRedirect("ProviderBookingsServlet?update=failed");
            
        } catch (Exception e) {
            System.err.println("Exception inside ProviderBookingsServlet doPost: " + e.getMessage());
            response.sendRedirect("ProviderBookingsServlet?error=invalid_data");
        }
    }
}