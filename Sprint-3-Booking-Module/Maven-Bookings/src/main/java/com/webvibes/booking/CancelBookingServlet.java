package com.webvibes.booking;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//BOOK-04: Cancels a booking (only if status is Pending)
//GET /cancelBooking?id=X → update status to Cancelled → redirect to /myBookings

@WebServlet("/cancelBooking")
public class CancelBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
 
            int bookingId = Integer.parseInt(request.getParameter("id"));

 
            BookingDAO bookingDAO = new BookingDAO();
            boolean isCancelled = bookingDAO.cancelBooking(bookingId);


            if (isCancelled) {
                response.sendRedirect("myBookings?msg=cancelled");
             } else {
                response.sendRedirect("myBookings?error=cannotcancel");
   }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("myBookings?error=cannotcancel");
     }
   }
}                