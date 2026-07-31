package com.webvibes.booking;

import java.time.LocalDate;

public class Booking {
    private int bookingId;
    private String userName;
    private int userId;
    private int serviceId;
    private String serviceName;
    private LocalDate bookingDate;
    private String timeSlot;
    private String address;
    private String notes;
    private double amount;
    private String status;

   
    public Booking() {}

    
    public Booking(int userId,String userName,   int serviceId, String serviceName, LocalDate bookingDate, String timeSlot, String address, String notes, double amount, String status) {
        this.userId = userId;
        this.userName = userName;
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.bookingDate = bookingDate;
        this.timeSlot = timeSlot;
        this.address = address;
        this.notes = notes;
        this.amount = amount;
        this.status = status;
        
    }


    public Booking(int bookingId,String userName, int userId, int serviceId, String serviceName, LocalDate bookingDate, String timeSlot, String address, String notes, double amount, String status) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.userName = userName;
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.bookingDate = bookingDate;
        this.timeSlot = timeSlot;
        this.address = address;
        this.notes = notes;
        this.amount = amount;
        this.status = status;
    }

  
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getServiceId() { return serviceId; }
    public void setServiceId(int serviceId) { this.serviceId = serviceId; }

    public String getServiceName() { return serviceName; }
    public void setServiceName(String serviceName) { this.serviceName = serviceName; }

    public LocalDate getBookingDate() { return bookingDate; }
    public void setBookingDate(LocalDate bookingDate) { this.bookingDate = bookingDate; }

    public String getTimeSlot() { return timeSlot; }
    public void setTimeSlot(String timeSlot) { this.timeSlot = timeSlot; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}