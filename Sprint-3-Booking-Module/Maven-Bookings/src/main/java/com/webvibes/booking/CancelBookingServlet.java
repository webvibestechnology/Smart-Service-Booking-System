package com.webvibes.booking;

import java.io.IOException;
// Tomcat 11 requirements (Strictly Jakarta)
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String bookingIdParam = request.getParameter("bookingId");
            if (bookingIdParam != null && !bookingIdParam.trim().isEmpty()) {
                int bookingId = Integer.parseInt(bookingIdParam);
                
                // DAO layer call karke status 'Cancelled' karna
                boolean isCancelled = bookingDAO.cancelBooking(bookingId);
                
                if (isCancelled) {
                    response.sendRedirect("MyBookingsServlet?cancel=success");
                    return;
                }
            }
            response.sendRedirect("MyBookingsServlet?cancel=failed");
        } catch (Exception e) {
            System.err.println("Error in CancelBookingServlet: " + e.getMessage());
            response.sendRedirect("MyBookingsServlet?error=invalid_id");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}