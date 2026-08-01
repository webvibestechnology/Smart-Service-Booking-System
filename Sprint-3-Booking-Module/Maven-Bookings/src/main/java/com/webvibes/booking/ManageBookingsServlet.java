package com.webvibes.booking;

<<<<<<< HEAD


// BOOK-05: Admin view of a=ll bookings with status update
// GET  /manageBookings → show all bookings in manageBookings.jsp
// POST /manageBookings → update booking status, redirect back

public class ManageBookingsServlet  {

    
}
=======
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

<<<<<<< HEAD

public class ManageBookingsServlet  
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Booking> bookingList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;


        try {
            conn = DBConnection.getConnection(); 
            String sql = "SELECT booking_id, customer_name, service_name, booking_date, status FROM bookings";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
=======
    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && "ADMIN".equals(session.getAttribute("role"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88

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
<<<<<<< HEAD
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
=======
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
