package com.webvibes.booking;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ManageBookingsServlet")
public class ManageBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Booking> allBookings = bookingDAO.getAllBookings();
    	request.setAttribute("bookings", allBookings);
    	request.getRequestDispatcher("/manageBookings.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String status = request.getParameter("status");
            
            boolean isUpdated = bookingDAO.updateBookingStatus(bookingId, status);
            
            if (isUpdated) {
                response.sendRedirect("ManageBookingsServlet?update=success");
            } else {
                response.sendRedirect("ManageBookingsServlet?update=failed");
            }
        } catch (Exception e) {
            System.err.println("Error in ManageBookingsServlet doPost: " + e.getMessage());
            response.sendRedirect("ManageBookingsServlet?error=invalid_data");
        }
    }
}