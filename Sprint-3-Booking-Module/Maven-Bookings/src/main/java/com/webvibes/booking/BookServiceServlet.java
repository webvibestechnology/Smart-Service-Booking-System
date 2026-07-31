package com.webvibes.booking;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BookServiceServlet")
public class BookServiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String serviceIdParam = request.getParameter("serviceId");
        
        if (serviceIdParam != null && !serviceIdParam.trim().isEmpty()) {
            try {
                int serviceId = Integer.parseInt(serviceIdParam);
                request.setAttribute("serviceId", serviceId);
                request.setAttribute("serviceName", "Deep Home Cleaning Service"); 
                request.setAttribute("amount", 2499.00); 
            } catch (NumberFormatException e) {
                System.err.println("Parsing exception: " + e.getMessage());
            }
        }
        request.getRequestDispatcher("/bookService.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int serviceId = Integer.parseInt(request.getParameter("serviceId"));
            String serviceName = request.getParameter("serviceName");
            LocalDate bookingDate = LocalDate.parse(request.getParameter("bookingDate"));
            String timeSlot = request.getParameter("timeSlot");
            String address = request.getParameter("address");
            String notes = request.getParameter("notes"); 
            double amount = Double.parseDouble(request.getParameter("amount"));
            
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                userId = 1; 
            }

            Booking booking = new Booking(userId, serviceId, serviceName, bookingDate, timeSlot, address, notes, amount, "Pending");
            boolean isCreated = bookingDAO.createBooking(booking);

            if (isCreated) {
                response.sendRedirect("MyBookingsServlet?status=success");
            } else {
                response.sendRedirect("bookService.jsp?error=failed");
            }
        } catch (Exception e) {
            System.err.println("Fatal mapping error inside context layer: " + e.getMessage());
            response.sendRedirect("bookService.jsp?error=invalid");
        }
    }
        
    
}