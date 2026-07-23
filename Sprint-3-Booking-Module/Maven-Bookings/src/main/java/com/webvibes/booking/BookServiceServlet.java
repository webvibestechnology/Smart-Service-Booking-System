package com.webvibes.booking;
<<<<<<< HEAD



// BOOK-02: Handles GET (show form) and POST (submit booking)
// GET  /bookService?serviceId=X  → show bookService.jsp
// POST /bookService               → insert booking, redirect to /myBookings

public class BookServiceServlet  {

  
=======
// BOOK-02: Handles GET (show form) and POST (submit booking)
// GET  /bookService?serviceId=X  → show bookService.jsp
// POST /bookService               → insert booking, redirect to /myBookings
import java.io.IOException;
import java.sql.SQLException;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/BookServiceServlet")
public class BookServiceServlet extends HttpServlet
 {
    private static final long serialVersionUID = 1L;
  
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException
     {
        bookingDAO = new BookingDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException
             {
        
        try
         {
            String serviceIdStr = request.getParameter("serviceId");
            
            if (serviceIdStr != null && !serviceIdStr.isEmpty())
             {
                int serviceId = Integer.parseInt(serviceIdStr);
            
                Service serviceInfo = ServiceDAO.getServiceById(serviceId); 
                
                request.setAttribute("serviceInfo", serviceInfo);
            }
            
            request.getRequestDispatcher("bookService.jsp").forward(request, response);
            
        } catch (Exception e) 
        {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); 
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException
             {
        
        String serviceIdStr = request.getParameter("serviceId");
        String serviceName = request.getParameter("serviceName");
        String bookingDate = request.getParameter("bookingDate");
        String timeSlot = request.getParameter("timeSlot");
        String address = request.getParameter("address");
        String amountStr = request.getParameter("amount");
        
        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("userId") != null) 
        {
            int userId = (int) session.getAttribute("userId"); 
           
            int serviceId = Integer.parseInt(serviceIdStr);
            double amount = Double.parseDouble(amountStr);
            
            Booking newBooking = new Booking();
            newBooking.setServiceId(serviceId);
            newBooking.setServiceName(serviceName);
            newBooking.setBookingDate(bookingDate);
            newBooking.setTimeSlot(timeSlot);
            newBooking.setAddress(address);
            newBooking.setAmount(amount);
            newBooking.setUserId(userId);
            
            try
             {
              
                boolean isSaved = bookingDAO.createBooking(newBooking);
                
                if (isSaved)
                {
                  
                    response.sendRedirect(request.getContextPath() + "/myBookings");
                }
                 else
                  {
              
                    request.setAttribute("errorMessage");
                    request.getRequestDispatcher("bookService.jsp").forward(request, response);
                }
                
            } 
            catch (SQLException e)
             {
                e.printStackTrace();
                throw new ServletException("Database error during booking creation", e);
            }
            
        } 
        else
         {
            response.sendRedirect("login.jsp");
        }
    }
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
}
