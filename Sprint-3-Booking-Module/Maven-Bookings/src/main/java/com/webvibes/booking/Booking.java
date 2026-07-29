package com.webvibes.booking;

import java.sql.Date;
import java.sql.Timestamp;

public class Booking {

    private int       bookingId;
    private int       userId;
    private int       serviceId;
    private String    serviceName;
    private Date      bookingDate;
    private String    timeSlot;
    private String    address;
    private double    amount;      // double — consistent with DB DECIMAL and JSP formatting
    private String    status;
    private Timestamp createdAt;

    public Booking() {}

    // Getters and Setters
    public int       getBookingId()                { return bookingId; }
    public void      setBookingId(int bookingId)   { this.bookingId = bookingId; }

    public int       getUserId()                   { return userId; }
    public void      setUserId(int userId)         { this.userId = userId; }

    public int       getServiceId()                { return serviceId; }
    public void      setServiceId(int serviceId)   { this.serviceId = serviceId; }

    public String    getServiceName()                      { return serviceName; }
    public void      setServiceName(String serviceName)    { this.serviceName = serviceName; }

    public Date      getBookingDate()              { return bookingDate; }
    public void      setBookingDate(Date date)     { this.bookingDate = date; }

    public String    getTimeSlot()                 { return timeSlot; }
    public void      setTimeSlot(String timeSlot)  { this.timeSlot = timeSlot; }

    public String    getAddress()                  { return address; }
    public void      setAddress(String address)    { this.address = address; }

    public double    getAmount()                   { return amount; }
    public void      setAmount(double amount)      { this.amount = amount; }

    public String    getStatus()                   { return status; }
    public void      setStatus(String status)      { this.status = status; }

    public Timestamp getCreatedAt()                { return createdAt; }
    public void      setCreatedAt(Timestamp ts)    { this.createdAt = ts; }
}
