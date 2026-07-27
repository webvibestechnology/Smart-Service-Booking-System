package com.webvibes.booking;
<<<<<<< HEAD
<<<<<<< HEAD



// BOOK-02: Handles GET (show form) and POST (submit booking)
// GET  /bookService?serviceId=X  → show bookService.jsp
// POST /bookService               → insert booking, redirect to /myBookings

public class BookServiceServlet  {

  
=======
// BOOK-02: Handles GET (show form) and POST (submit booking)
// GET  /bookService?serviceId=X  → show bookService.jsp
// POST /bookService               → insert booking, redirect to /myBookings
=======

>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * BOOK-02: Book Service
 * GET  /bookService?serviceId=X&serviceName=Y&amount=Z  → show form
 * POST /bookService                                       → save booking → redirect to /myBookings
 */
@WebServlet("/bookService")
public class BookServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Pass service info from URL params to the JSP
        // serviceId, serviceName, amount come from Sprint 2 serviceDetails page
        request.getRequestDispatcher("/pages/bookService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Session key is "userId" stored by AuthHandoffServlet from Sprint 1
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

        try {
            String serviceIdStr  = request.getParameter("serviceId");
            String serviceName   = request.getParameter("serviceName");
            String bookingDateStr = request.getParameter("bookingDate");
            String timeSlot      = request.getParameter("timeSlot");
            String address       = request.getParameter("address");
            String amountStr     = request.getParameter("amount");

            // Validate required fields
            if (serviceName == null || bookingDateStr == null || bookingDateStr.isEmpty()
                    || address == null || address.trim().isEmpty()) {
                request.setAttribute("error", "All required fields must be filled.");
                request.getRequestDispatcher("/pages/bookService.jsp").forward(request, response);
                return;
            }

            int    serviceId = (serviceIdStr != null && !serviceIdStr.isEmpty())
                               ? Integer.parseInt(serviceIdStr) : 0;
            double amount    = (amountStr != null && !amountStr.isEmpty())
                               ? Double.parseDouble(amountStr) : 0.0;

            Booking booking = new Booking();
            booking.setUserId(userId);
            booking.setServiceId(serviceId);
            booking.setServiceName(serviceName);
            booking.setBookingDate(Date.valueOf(bookingDateStr));
            booking.setTimeSlot(timeSlot);
            booking.setAddress(address);
            booking.setAmount(amount);

            BookingDAO dao = new BookingDAO();
            boolean saved = dao.createBooking(booking);

            if (saved) {
                response.sendRedirect(request.getContextPath() + "/myBookings?msg=booked");
            } else {
                request.setAttribute("error", "Failed to save booking. Please try again.");
                request.getRequestDispatcher("/pages/bookService.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/pages/bookService.jsp").forward(request, response);
        }
    }
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
}
