// BOOK-02 to BOOK-06: Data access layer for bookings table
package com.webvibes.booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO 
{

    // 1. createBooking(Booking booking)
    public boolean createBooking(Booking booking) 
    {
        String sql = "INSERT INTO bookings (user_id, service_id, service_name, booking_date, time_slot, address, amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, booking.getUserId());
            pstmt.setInt(2, booking.getServiceId());
            pstmt.setString(3, booking.getServiceName());
            pstmt.setDate(4, booking.getBookingDate());
            pstmt.setString(5, booking.getTimeSlot());
            pstmt.setString(6, booking.getAddress());
            pstmt.setString(7, booking.getAmount());
            pstmt.setString(8, booking.getStatus() != null ? booking.getStatus() : "Pending");
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 2. getBookingsByUser(int userId)
    public List<Booking> getBookingsByUser(int userId) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Booking b = mapResultSetToBooking(rs);
                    list.add(b);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. cancelBooking(int bookingId)
    public boolean cancelBooking(int bookingId) {
        String sql = "UPDATE bookings SET status = 'Cancelled' WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, bookingId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 4. getAllBookings()
    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Booking b = mapResultSetToBooking(rs);
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 5. updateBookingStatus(int bookingId, String status)
    public boolean updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, bookingId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Helper method to map ResultSet to Booking object
    private Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        Booking b = new Booking();
        b.setBookingId(rs.getInt("booking_id"));
        b.setUserId(rs.getInt("user_id"));
        b.setServiceId(rs.getInt("service_id"));
        b.setServiceName(rs.getString("service_name"));
        b.setBookingDate(rs.getDate("booking_date"));
        b.setTimeSlot(rs.getString("time_slot"));
        b.setAddress(rs.getString("address"));
        b.setAmount(rs.getString("amount"));
        b.setStatus(rs.getString("status"));
        b.setCreatedAt(rs.getTimestamp("created_at"));
        return b;
    }
}