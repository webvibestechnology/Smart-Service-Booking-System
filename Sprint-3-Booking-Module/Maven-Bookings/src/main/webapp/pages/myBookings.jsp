<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.booking.Booking, java.util.List" %>
<%
    List<Booking> bookingList = (List<Booking>) request.getAttribute("bookingList");
    String msg = request.getParameter("msg");
    String err = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings - Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background: #f4f6f9; min-height: 100vh; display: flex; flex-direction: column; }

        /* Navbar */
        header { background: #0b153a; color: white; padding: 14px 50px; display: flex; justify-content: space-between; align-items: center; }
        .logo-section { display: flex; align-items: center; gap: 10px; text-decoration: none; color: white; }
        .logo-icon { background: #3b82f6; width: 36px; height: 36px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 16px; }
        .logo-text h2 { font-size: 17px; margin: 0; font-weight: 700; }
        .logo-text p  { font-size: 11px; color: #3d84db; margin: 0; }
        .logout-btn { background: #ef4444; color: white; text-decoration: none; padding: 8px 18px; border-radius: 7px; font-size: 13px; font-weight: 600; display: flex; align-items: center; gap: 6px; }
        .logout-btn:hover { background: #dc2626; }

        /* Main */
        .main { flex: 1; padding: 32px 50px; }
        .page-title { font-size: 22px; font-weight: 800; color: #0f172a; margin-bottom: 24px; }

        /* Alerts */
        .alert { padding: 12px 18px; border-radius: 8px; font-size: 13.5px; font-weight: 500; margin-bottom: 20px; display: flex; align-items: center; gap: 8px; }
        .alert-success { background: #f0fdf4; border: 1px solid #bbf7d0; color: #16a34a; }
        .alert-error   { background: #fef2f2; border: 1px solid #fecaca; color: #dc2626; }

        /* Table card */
        .table-card { background: white; border-radius: 14px; border: 1px solid #e2e8f0; box-shadow: 0 4px 12px rgba(0,0,0,0.04); overflow: hidden; }
        table { width: 100%; border-collapse: collapse; }
        thead th { background: #f8fafc; font-size: 11.5px; font-weight: 700; color: #64748b; letter-spacing: 0.8px; text-transform: uppercase; padding: 13px 20px; border-bottom: 1px solid #e2e8f0; text-align: left; }
        tbody td { padding: 15px 20px; border-bottom: 1px solid #f1f5f9; font-size: 13.5px; color: #1e293b; vertical-align: middle; }
        tbody tr:last-child td { border-bottom: none; }
        tbody tr:hover { background: #fafbfc; }

        .booking-id { color: #94a3b8; font-size: 12px; font-weight: 600; }

        /* Status badges */
        .badge { padding: 4px 12px; border-radius: 50px; font-size: 12px; font-weight: 600; }
        .badge-pending   { background: #fffbeb; color: #d97706; border: 1px solid #fde68a; }
        .badge-completed { background: #f0fdf4; color: #16a34a; border: 1px solid #bbf7d0; }
        .badge-cancelled { background: #fef2f2; color: #dc2626; border: 1px solid #fecaca; }
        .badge-confirmed { background: #eff6ff; color: #2563eb; border: 1px solid #bfdbfe; }

        /* Action buttons */
        .btn-cancel { padding: 6px 14px; border-radius: 6px; text-decoration: none; font-size: 12.5px; font-weight: 600; background: #fef2f2; color: #dc2626; border: 1px solid #fecaca; transition: all 0.15s; }
        .btn-cancel:hover { background: #dc2626; color: white; }
        .btn-view   { padding: 6px 14px; border-radius: 6px; text-decoration: none; font-size: 12.5px; font-weight: 600; background: #f8fafc; color: #64748b; border: 1px solid #e2e8f0; }

        /* Empty state */
        .empty-state { text-align: center; padding: 60px 20px; color: #94a3b8; }
        .empty-state i { font-size: 42px; margin-bottom: 12px; display: block; }

        footer { background: #1a295f; color: #a5b4fc; text-align: center; padding: 14px; font-size: 13px; }
    </style>
</head>
<body>

<header>
    <a href="${pageContext.request.contextPath}/myBookings" class="logo-section">
        <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
        <div class="logo-text">
            <h2>Smart Service</h2>
            <p>Booking System</p>
        </div>
    </a>
    <a href="http://localhost:8080/Maven-Authentication/logout" class="logout-btn">
        <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>
</header>

<main class="main">
    <h2 class="page-title"><i class="fa-solid fa-calendar-check" style="color:#3b82f6;margin-right:10px;"></i>My Bookings</h2>

    <%-- Feedback messages --%>
    <% if ("cancelled".equals(msg)) { %>
        <div class="alert alert-success"><i class="fa-solid fa-circle-check"></i> Booking cancelled successfully.</div>
    <% } %>
    <% if ("cannotcancel".equals(err)) { %>
        <div class="alert alert-error"><i class="fa-solid fa-circle-exclamation"></i> This booking cannot be cancelled (already completed or cancelled).</div>
    <% } %>

    <div class="table-card">
        <% if (bookingList == null || bookingList.isEmpty()) { %>
            <div class="empty-state">
                <i class="fa-solid fa-calendar-xmark"></i>
                <p>No bookings found.</p>
                <a href="http://localhost:8080/Maven-Services/viewServices" style="color:#2563eb;font-weight:600;">Browse Services</a>
            </div>
        <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Service</th>
                    <th>Date</th>
                    <th>Time Slot</th>
                    <th>Amount</th>
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
                    <td style="font-weight:700;color:#2563eb;">₹<%= String.format("%.0f", b.getAmount()) %></td>
                    <td>
                        <% String status = b.getStatus(); %>
                        <% if ("Pending".equals(status)) { %>
                            <span class="badge badge-pending">Pending</span>
                        <% } else if ("Completed".equals(status)) { %>
                            <span class="badge badge-completed">Completed</span>
                        <% } else if ("Cancelled".equals(status)) { %>
                            <span class="badge badge-cancelled">Cancelled</span>
                        <% } else { %>
                            <span class="badge badge-confirmed"><%= status %></span>
                        <% } %>
                    </td>
                    <td style="text-align:center;">
                        <% if ("Pending".equals(b.getStatus())) { %>
                            <a href="${pageContext.request.contextPath}/cancelBooking?id=<%= b.getBookingId() %>"
                               class="btn-cancel"
                               onclick="return confirm('Cancel this booking?')">
                                <i class="fa-solid fa-xmark"></i> Cancel
                            </a>
                        <% } else { %>
                            <span class="btn-view">—</span>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
    </div>
</main>

<footer>&copy; 2026 Smart Service Booking System. All rights reserved.</footer>
</body>
</html>
