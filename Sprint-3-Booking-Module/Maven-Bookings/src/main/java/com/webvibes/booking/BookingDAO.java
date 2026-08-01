<<<<<<< HEAD
<<<<<<< HEAD
package com.webvibes.booking;



// BOOK-02 to BOOK-06: Data access layer for bookings table
public class BookingDAO {
=======

=======
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
package com.webvibes.booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO 
{

<<<<<<< HEAD
    // 1. createBooking(Booking booking)
    public boolean createBooking(Booking booking) 
    {
        String sql = "INSERT INTO bookings (user_id, service_id, service_name, booking_date, time_slot, address, amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
=======
    // ── Create ─────────────────────────────────────────────────────────────────
    public boolean createBooking(Booking booking) {
        String sql = "INSERT INTO bookings (user_id, service_id, service_name, booking_date, time_slot, address, amount, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')";
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getServiceId());
            ps.setString(3, booking.getServiceName());
            ps.setDate(4, booking.getBookingDate());
            ps.setString(5, booking.getTimeSlot());
            ps.setString(6, booking.getAddress());
            ps.setDouble(7, booking.getAmount());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── Get by user ────────────────────────────────────────────────────────────
    public List<Booking> getBookingsByUser(int userId) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE user_id = ? ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ── Get all (admin) ────────────────────────────────────────────────────────
    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) list.add(map(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ── Cancel (only if Pending) ───────────────────────────────────────────────
    public boolean cancelBooking(int bookingId) {
        String sql = "UPDATE bookings SET status = 'Cancelled' WHERE booking_id = ? AND status = 'Pending'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── Update status ──────────────────────────────────────────────────────────
    public boolean updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, bookingId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── Map ResultSet → Booking ────────────────────────────────────────────────
    private Booking map(ResultSet rs) throws SQLException {
        Booking b = new Booking();
        b.setBookingId(rs.getInt("booking_id"));
        b.setUserId(rs.getInt("user_id"));
        b.setServiceId(rs.getInt("service_id"));
        b.setServiceName(rs.getString("service_name"));
        b.setBookingDate(rs.getDate("booking_date"));
        b.setTimeSlot(rs.getString("time_slot"));
        b.setAddress(rs.getString("address"));
        b.setAmount(rs.getDouble("amount"));
        b.setStatus(rs.getString("status"));
        b.setCreatedAt(rs.getTimestamp("created_at"));
        return b;
    }
<<<<<<< HEAD
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
}
=======
}
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
