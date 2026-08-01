<<<<<<< HEAD
<<<<<<< HEAD
package com.controller;

import com.dao.BookingDAO;
import com.model.Booking;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
=======
=======
<<<<<<< HEAD
>>>>>>> 472af1b458ccd8d8e6f6f27c56da87277ef755a9
package com.webvibes.booking;


// BOOK-06: Provider view of assigned bookings
// GET  /providerBookings → show bookings for this provider's services
// POST /providerBookings → mark booking as Completed

public class ProviderBookingsServlet  {

=======
package javaController;
=======
package com.webvibes.booking;
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88

import java.io.IOException;
import java.util.List;
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88

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
        
        // Strict Role Verification Check
        if (session == null || !"PROVIDER".equals(session.getAttribute("role"))) {
            response.sendRedirect("http://localhost:8080/Maven-Authentication/pages/login.jsp");
            return;
        }

        // Providers see ALL bookings (provider assignment is Sprint 4 feature)
        BookingDAO dao = new BookingDAO();
        List<Booking> bookingList = dao.getAllBookings();

<<<<<<< HEAD
        // Computing Metrics for dashboard cards
        long totalBookings = allBookings.size();
        long completedBookings = allBookings.stream().filter(b -> "Completed".equalsIgnoreCase(b.getStatus())).count();
        long pendingBookings = allBookings.stream().filter(b -> "Pending".equalsIgnoreCase(b.getStatus())).count();
=======
        long total     = bookingList.size();
        long completed = bookingList.stream().filter(b -> "Completed".equals(b.getStatus())).count();
        long pending   = bookingList.stream().filter(b -> "Pending".equals(b.getStatus())).count();
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88

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

<<<<<<< HEAD
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        boolean success = bookingDAO.updateBookingStatus(bookingId, "Completed");

        if (success) {
            request.getSession().setAttribute("message", "Booking updated successfully!");
        } else {
            request.getSession().setAttribute("error", "Action execution error occurred.");
=======
        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            BookingDAO dao = new BookingDAO();
            dao.updateBookingStatus(bookingId, "Completed");
        } catch (Exception e) {
            e.printStackTrace();
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
        }

        response.sendRedirect(request.getContextPath() + "/providerBookings?msg=updated");
    }
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
}
