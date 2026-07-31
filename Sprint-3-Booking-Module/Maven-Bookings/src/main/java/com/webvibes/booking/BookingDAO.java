package com.webvibes.booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

  
    public boolean createBooking(Booking booking) {
        String sql = "INSERT INTO bookings (user_id, service_id, service_name, booking_date, time_slot, address, notes, amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, booking.getUserId());
            pstmt.setInt(2, booking.getServiceId());
            pstmt.setString(3, booking.getServiceName());
            pstmt.setDate(4, Date.valueOf(booking.getBookingDate()));
            pstmt.setString(5, booking.getTimeSlot());
            pstmt.setString(6, booking.getAddress());
            pstmt.setString(7, booking.getNotes());
            pstmt.setDouble(8, booking.getAmount());
            pstmt.setString(9, booking.getStatus());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error in createBooking: " + e.getMessage());
            return false;
        }
    }

 
    public List<Booking> getBookingsByUser(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE user_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    bookings.add(mapResultSetToBooking(rs));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in getBookingsByUser: " + e.getMessage());
        }
        return bookings;
    }


    public boolean cancelBooking(int bookingId) {
        return updateBookingStatus(bookingId, "Cancelled");
    }

 
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            System.err.println("Error in getAllBookings: " + e.getMessage());
        }
        return bookings;
    }


    public boolean updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            pstmt.setInt(2, bookingId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error in updateBookingStatus: " + e.getMessage());
            return false;
        }
    }


    private Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        return new Booking(
            rs.getInt("booking_id"),
            rs.getInt("user_id"),
            rs.getInt("service_id"),
            rs.getString("service_name"),
            rs.getDate("booking_date").toLocalDate(),
            rs.getString("time_slot"),
            rs.getString("address"),
            rs.getString("notes"),
            rs.getDouble("amount"),
            rs.getString("status")
        );
    }
}