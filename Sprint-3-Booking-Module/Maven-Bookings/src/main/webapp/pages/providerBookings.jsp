<<<<<<< HEAD
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.booking.Booking, java.util.List" %>
<%-- BOOK-06: Provider Bookings Page (Screen 15 in mockup)
     Shows bookings assigned to this provider's service category.
     Data comes from request attribute "bookingList" (List<Booking>)
     Columns: Booking ID, Service, Customer, Date, Time Slot, Status, Action
     Provider can mark booking as "Completed" via Update button
     Reference: mockup screen 15
--%>
=======
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://sun.com" %>
<%@ taglib prefix="fmt" uri="http://sun.com" %>
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.booking.Booking, java.util.List" %>
<%
    List<Booking> bookingList = (List<Booking>) request.getAttribute("bookingList");
    Long totalBookings     = (Long) request.getAttribute("totalBookings");
    Long completedBookings = (Long) request.getAttribute("completedBookings");
    Long pendingBookings   = (Long) request.getAttribute("pendingBookings");
    String userName = (String) request.getSession(false) != null
                     ? (String) request.getSession(false).getAttribute("userName") : "Provider";
    String msgParam = request.getParameter("msg");
%>
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<<<<<<< HEAD
<<<<<<< HEAD
    <title>My Assigned Bookings - Smart Service</title>
    <!-- TODO: Add CSS styling matching the project theme -->
</head>
<body>

    

=======
    <title>Provider Dashboard - Bookings</title>
=======
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Provider Bookings - Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background: #f4f6f9; min-height: 100vh; display: flex; flex-direction: column; }

        /* Navbar */
        header { background: #0f172a; padding: 14px 50px; display: flex; justify-content: space-between; align-items: center; }
        .brand { display: flex; align-items: center; gap: 12px; text-decoration: none; color: white; }
        .logo-icon { background: linear-gradient(135deg,#059669,#047857); width: 38px; height: 38px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 16px; color: white; }
        .brand-name { font-size: 17px; font-weight: 700; }
        .brand-sub  { font-size: 10px; color: #34d399; letter-spacing: 1px; }
        .provider-badge { background: rgba(52,211,153,0.15); border: 1px solid rgba(52,211,153,0.3); color: #34d399; padding: 4px 12px; border-radius: 50px; font-size: 12px; font-weight: 600; }
        .logout-btn { background: #ef4444; color: white; text-decoration: none; padding: 8px 18px; border-radius: 7px; font-size: 13px; font-weight: 600; display: flex; align-items: center; gap: 6px; }
        .logout-btn:hover { background: #dc2626; }

        /* Main */
        .main { flex: 1; padding: 32px 50px; }

        /* Welcome */
        .welcome-card { background: linear-gradient(135deg,#022c22,#064e3b); color: white; padding: 28px 36px; border-radius: 16px; margin-bottom: 28px; box-shadow: 0 8px 24px rgba(6,78,59,0.25); }
        .welcome-card h2 { font-size: 22px; font-weight: 800; margin-bottom: 4px; }
        .welcome-card h2 span { color: #34d399; }
        .welcome-card p { color: #6ee7b7; font-size: 14px; }

        /* Stats */
        .stats-row { display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px; margin-bottom: 28px; }
        .stat-card { background: white; border-radius: 12px; padding: 22px 24px; border: 1px solid #e2e8f0; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
        .stat-label { font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.8px; margin-bottom: 8px; }
        .stat-value { font-size: 32px; font-weight: 900; }
        .stat-blue   .stat-value { color: #2563eb; }
        .stat-green  .stat-value { color: #16a34a; }
        .stat-orange .stat-value { color: #d97706; }

        /* Alert */
        .alert-success { background: #f0fdf4; border: 1px solid #bbf7d0; color: #16a34a; padding: 12px 18px; border-radius: 8px; font-size: 13px; font-weight: 500; margin-bottom: 20px; display: flex; align-items: center; gap: 8px; }

        /* Table */
        .table-card { background: white; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 4px 12px rgba(0,0,0,0.04); overflow: hidden; }
        .table-header { padding: 20px 24px; border-bottom: 1px solid #f1f5f9; }
        .table-header h3 { font-size: 17px; font-weight: 700; color: #0f172a; }

        table { width: 100%; border-collapse: collapse; }
        thead th { background: #f8fafc; font-size: 11.5px; font-weight: 700; color: #64748b; letter-spacing: 0.8px; text-transform: uppercase; padding: 13px 20px; border-bottom: 1px solid #e2e8f0; text-align: left; }
        tbody td { padding: 14px 20px; border-bottom: 1px solid #f1f5f9; font-size: 13.5px; color: #1e293b; vertical-align: middle; }
        tbody tr:last-child td { border-bottom: none; }
        tbody tr:hover { background: #fafbfc; }

        .booking-id { color: #94a3b8; font-size: 12px; font-weight: 600; }

        .badge { padding: 4px 12px; border-radius: 50px; font-size: 12px; font-weight: 600; }
        .badge-pending   { background: #fffbeb; color: #d97706; border: 1px solid #fde68a; }
        .badge-completed { background: #f0fdf4; color: #16a34a; border: 1px solid #bbf7d0; }
        .badge-cancelled { background: #fef2f2; color: #dc2626; border: 1px solid #fecaca; }
        .badge-confirmed { background: #eff6ff; color: #2563eb; border: 1px solid #bfdbfe; }

        .btn-complete { background: #16a34a; color: white; border: none; padding: 7px 16px; border-radius: 7px; font-size: 12.5px; font-weight: 600; cursor: pointer; transition: background 0.15s; }
        .btn-complete:hover { background: #15803d; }

        .empty-state { text-align: center; padding: 60px 20px; color: #94a3b8; }
        .empty-state i { font-size: 42px; margin-bottom: 12px; display: block; }

        footer { background: #0f172a; color: #64748b; text-align: center; padding: 14px; font-size: 13px; }
    </style>
</head>
<body>

<header>
    <div style="display:flex;align-items:center;gap:20px;">
        <a href="${pageContext.request.contextPath}/providerBookings" class="brand">
            <div class="logo-icon"><i class="fa-solid fa-screwdriver-wrench"></i></div>
            <div>
                <div class="brand-name">Smart Service</div>
                <div class="brand-sub">PROVIDER PORTAL</div>
            </div>
        </a>
        <span class="provider-badge"><i class="fa-solid fa-hard-hat"></i> Provider</span>
    </div>
    <a href="http://localhost:8080/Maven-Authentication/logout" class="logout-btn">
        <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>
</header>

<main class="main">

    <div class="welcome-card">
        <h2>Welcome, <span><%= userName %></span>!</h2>
        <p>Manage your assigned jobs and update booking statuses below.</p>
    </div>

    <% if ("updated".equals(msgParam)) { %>
        <div class="alert-success"><i class="fa-solid fa-circle-check"></i> Booking marked as completed successfully.</div>
    <% } %>

    <!-- Stats -->
    <div class="stats-row">
        <div class="stat-card stat-blue">
            <div class="stat-label">Total Bookings</div>
            <div class="stat-value"><%= totalBookings != null ? totalBookings : 0 %></div>
        </div>
        <div class="stat-card stat-green">
            <div class="stat-label">Completed Jobs</div>
            <div class="stat-value"><%= completedBookings != null ? completedBookings : 0 %></div>
        </div>
        <div class="stat-card stat-orange">
            <div class="stat-label">Pending Tasks</div>
            <div class="stat-value"><%= pendingBookings != null ? pendingBookings : 0 %></div>
        </div>
    </div>

    <!-- Bookings Table -->
    <div class="table-card">
        <div class="table-header">
            <h3>Assigned Bookings</h3>
        </div>

        <% if (bookingList == null || bookingList.isEmpty()) { %>
            <div class="empty-state">
                <i class="fa-solid fa-calendar-xmark"></i>
                <p>No bookings assigned yet.</p>
            </div>
        <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Service</th>
                    <th>Date</th>
                    <th>Time Slot</th>
                    <th>Status</th>
                    <th style="text-align:center;">Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking b : bookingList) { %>
                <tr>
                    <td class="booking-id">#<%= b.getBookingId() %></td>
                    <td style="font-weight:600;"><%= b.getServiceName() %></td>
                    <td><%= b.getBookingDate() %></td>
                    <td><%= b.getTimeSlot() != null ? b.getTimeSlot() : "—" %></td>
                    <td>
                        <% String st = b.getStatus(); %>
                        <% if ("Pending".equals(st))   { %><span class="badge badge-pending">Pending</span>
                        <% } else if ("Completed".equals(st)) { %><span class="badge badge-completed">Completed</span>
                        <% } else if ("Cancelled".equals(st)) { %><span class="badge badge-cancelled">Cancelled</span>
                        <% } else { %><span class="badge badge-confirmed"><%= st %></span><% } %>
                    </td>
                    <td style="text-align:center;">
                        <% if ("Pending".equals(b.getStatus()) || "Confirmed".equals(b.getStatus())) { %>
                            <form action="${pageContext.request.contextPath}/providerBookings" method="POST" style="margin:0;">
                                <input type="hidden" name="bookingId" value="<%= b.getBookingId() %>">
                                <button type="submit" class="btn-complete"
                                        onclick="return confirm('Mark booking #<%= b.getBookingId() %> as Completed?')">
                                    <i class="fa-solid fa-check"></i> Mark Complete
                                </button>
                            </form>
                        <% } else { %>
                            <span style="color:#94a3b8;font-size:12px;">—</span>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
    </div>
<<<<<<< HEAD
</div>
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
=======
</main>

<footer>&copy; 2026 Smart Service Booking System. All rights reserved.</footer>
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
</body>
</html>
