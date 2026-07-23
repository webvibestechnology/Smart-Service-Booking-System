package com.webvibes.booking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/manageBookings")
public class ManageBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


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

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getString("booking_id"));
                booking.setCustomerName(rs.getString("customer_name"));
                booking.setServiceName(rs.getString("service_name"));
                booking.setBookingDate(rs.getString("booking_date"));
                booking.setStatus(rs.getString("status"));
                bookingList.add(booking);
            }
            
            request.setAttribute("bookingList", bookingList);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        request.getRequestDispatcher("/pages/manageBookings.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        String newStatus = request.getParameter("newStatus");

        Connection conn = null;
     
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setString(2, bookingId);
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        response.sendRedirect(request.getContextPath() + "/manageBookings?msg=updated");
    }
}