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
 * BOOK-06: Provider — view and complete assigned bookings
 * GET  /providerBookings → list bookings
 * POST /providerBookings → mark booking as Completed
 */
@WebServlet("/providerBookings")
public class ProviderBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"PROVIDER".equals(session.getAttribute("role"))) {
            response.sendRedirect("http://localhost:8080/Maven-Authentication/pages/login.jsp");
            return;
        }

        // Providers see ALL bookings (provider assignment is Sprint 4 feature)
        BookingDAO dao = new BookingDAO();
        List<Booking> bookingList = dao.getAllBookings();

        long total     = bookingList.size();
        long completed = bookingList.stream().filter(b -> "Completed".equals(b.getStatus())).count();
        long pending   = bookingList.stream().filter(b -> "Pending".equals(b.getStatus())).count();

        request.setAttribute("bookingList",      bookingList);
        request.setAttribute("totalBookings",    total);
        request.setAttribute("completedBookings",completed);
        request.setAttribute("pendingBookings",  pending);

        request.getRequestDispatcher("/pages/providerBookings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"PROVIDER".equals(session.getAttribute("role"))) {
            response.sendRedirect("http://localhost:8080/Maven-Authentication/pages/login.jsp");
            return;
        }

        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            BookingDAO dao = new BookingDAO();
            dao.updateBookingStatus(bookingId, "Completed");
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/providerBookings?msg=updated");
    }
}
