// BOOK-01: Model class for Booking table
// booking_id, user_id, service_id, service_name, booking_date,
// time_slot, address, amount, status, created_at
// TODO: Add private fields matching the database columns
// TODO: Add default constructor
// TODO: Add getters and setters for all fields
package com.webvibes.booking;

import java.sql.Date;
import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private int userId;
    private int serviceId;
    private String serviceName;
    private Date bookingDate;
    private String timeSlot;
    private String address;
    private String amount;
    private String status;
    private Timestamp createdAt;

    // Default Constructor
    public Booking() {}

    // Parameterized Constructor
    public Booking(int userId, int serviceId, String serviceName, Date bookingDate, String timeSlot, String address, String amount) {
        this.userId = userId;
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.bookingDate = bookingDate;
        this.timeSlot = timeSlot;
        this.address = address;
        this.amount = amount;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getServiceId() { return serviceId; }
    public void setServiceId(int serviceId) { this.serviceId = serviceId; }

    public String getServiceName() { return serviceName; }
    public void setServiceName(String serviceName) { this.serviceName = serviceName; }

    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }

    public String getTimeSlot() { return timeSlot; }
    public void setTimeSlot(String timeSlot) { this.timeSlot = timeSlot; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getAmount() { return amount; }
    public void setAmount(String amount) { this.amount = amount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}