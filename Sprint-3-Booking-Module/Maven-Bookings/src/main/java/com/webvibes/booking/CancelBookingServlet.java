package com.webvibes.booking;

<<<<<<< HEAD

// BOOK-04: Cancels a booking (only if status is Pending)
// GET /cancelBooking?id=X → update status to Cancelled → redirect to /myBookings

public class CancelBookingServlet  {

   
}
=======
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
<<<<<<< HEAD
            response.sendRedirect("myBookings?error=cannotcancel");
     }
   }
}                
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
=======
            response.sendRedirect(request.getContextPath() + "/myBookings?error=cannotcancel");
        }
    }
}
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
