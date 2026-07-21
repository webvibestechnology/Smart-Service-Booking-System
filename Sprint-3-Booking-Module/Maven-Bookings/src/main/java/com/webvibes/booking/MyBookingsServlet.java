package com.webvibes.booking;

import java.io.IOException;
import java.util.List;

import com.dao.BookingDAO;
import com.model.Booking;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/myBookings")
public class MyBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        List<Booking> bookingList = bookingDAO.getBookingsByUser(userId);

        request.setAttribute("bookingList", bookingList);

        RequestDispatcher rd = request.getRequestDispatcher("myBookings.jsp");
        rd.forward(request, response);
    }
}