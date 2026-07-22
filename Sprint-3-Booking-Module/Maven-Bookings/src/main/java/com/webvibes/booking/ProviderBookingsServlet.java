package javaController;

import javaDAO.BookingDAO;
import javaModel.Booking;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/provider/bookings")
public class ProviderBookingsServlet extends HttpServlet {
    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || !"PROVIDER".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
public class ProviderBookingsServlet  
{

        String providerService = (String) session.getAttribute("serviceType"); 
        List<Booking> allBookings = bookingDAO.getBookingsByService(providerService);

        long totalBookings = allBookings.size();
        long completedBookings = allBookings.stream().filter(b -> "Completed".equalsIgnoreCase(b.getStatus())).count();
        long pendingBookings = allBookings.stream().filter(b -> "Pending".equalsIgnoreCase(b.getStatus())).count();

        request.setAttribute("bookings", allBookings);
        request.setAttribute("totalBookings", totalBookings);
        request.setAttribute("completedBookings", completedBookings);
        request.setAttribute("pendingBookings", pendingBookings);

        request.getRequestDispatcher("/providerBookings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || !"PROVIDER".equals(session.getAttribute("role"))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        boolean success = bookingDAO.updateBookingStatus(bookingId, "Completed");

        if (success) {
            request.getSession().setAttribute("message", "Booking marked as completed successfully!");
        } else {
            request.getSession().setAttribute("error", "Failed to update booking status.");
        }

        response.sendRedirect(request.getContextPath() + "/provider/bookings");
    }
}
