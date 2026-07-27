package com.webvibes.booking;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * BOOK-04: Cancel a booking (only if status is Pending)
 * GET /cancelBooking?id=X
 */
@WebServlet("/cancelBooking")
public class CancelBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/myBookings");
            return;
        }

        try {
            int bookingId = Integer.parseInt(idParam);
            BookingDAO dao = new BookingDAO();
            boolean cancelled = dao.cancelBooking(bookingId);

            if (cancelled) {
                response.sendRedirect(request.getContextPath() + "/myBookings?msg=cancelled");
            } else {
                response.sendRedirect(request.getContextPath() + "/myBookings?error=cannotcancel");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/myBookings?error=cannotcancel");
        }
    }
}
