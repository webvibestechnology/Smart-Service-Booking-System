package com.webvibes.booking;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * BOOK-03: My Bookings — shows all bookings for the logged-in user
 * GET /myBookings
 */
@WebServlet("/myBookings")
public class MyBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Integer userId = null;
        if (session != null) {
            Object userIdObj = session.getAttribute("userId");
            if (userIdObj instanceof Integer) {
                userId = (Integer) userIdObj;
            } else if (userIdObj instanceof String) {
                try { userId = Integer.parseInt((String) userIdObj); } catch (NumberFormatException ignored) {}
            }
        }

        if (userId == null) {
            response.sendRedirect("http://localhost:8080/Maven-Authentication/pages/login.jsp");
            return;
        }

        BookingDAO dao = new BookingDAO();
        List<Booking> bookingList = dao.getBookingsByUser(userId);
        request.setAttribute("bookingList", bookingList);
        request.getRequestDispatcher("/pages/myBookings.jsp").forward(request, response);
    }
}
