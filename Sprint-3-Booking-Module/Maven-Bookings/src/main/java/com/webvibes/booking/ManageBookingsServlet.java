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
 * BOOK-05: Admin — Manage all bookings
 * GET  /manageBookings → list all bookings
 * POST /manageBookings → update booking status
 */
@WebServlet("/manageBookings")
public class ManageBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && "ADMIN".equals(session.getAttribute("role"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/myBookings");
            return;
        }

        BookingDAO dao = new BookingDAO();
        List<Booking> bookingList = dao.getAllBookings();
        request.setAttribute("bookingList", bookingList);
        request.getRequestDispatcher("/pages/manageBookings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/myBookings");
            return;
        }

        try {
            int    bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String newStatus = request.getParameter("newStatus");

            BookingDAO dao = new BookingDAO();
            dao.updateBookingStatus(bookingId, newStatus);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/manageBookings?msg=updated");
    }
}
