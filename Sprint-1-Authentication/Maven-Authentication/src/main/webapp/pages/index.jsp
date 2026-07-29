<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Provider Dashboard - Smart Service</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }
        body {
            background-color: #f8fafc;
            color: #1e293b;
            line-height: 1.5;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* --- EXACT HOME PAGE NAVBAR STYLES --- */
        .navbar { 
            background-color: #0f172a; 
            color: white; 
            padding: 16px 60px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            box-shadow: 0 10px 15px -3px rgba(15, 23, 42, 0.08); 
            position: sticky; 
            top: 0; 
            z-index: 1000; 
            border-bottom: 1px solid rgba(255, 255, 255, 0.05); 
        }
        .brand-section { 
            display: flex; 
            align-items: center; 
            gap: 14px; 
        }
        .logo-icon { 
            background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%); 
            color: white; 
            width: 44px; 
            height: 44px; 
            border-radius: 10px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 22px; 
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25); 
        }
        .brand-name { 
            font-size: 19px; 
            font-weight: 700; 
            color: white; 
        }
        .brand-sub { 
            font-size: 11px; 
            color: #38bdf8; 
            font-weight: 600; 
            letter-spacing: 1px; 
        }

        /* Profile Badge in Header */
        .header-actions {
            display: flex;
            align-items: center;
        }
        .header-user-profile {
            background: rgba(255, 255, 255, 0.08);
            padding: 8px 18px;
            border-radius: 30px;
            border: 1px solid rgba(255, 255, 255, 0.15);
            color: white;
            font-weight: 600;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .header-user-profile i.avatar-icon {
            background: #3b82f6;
            width: 28px;
            height: 28px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
        }

        /* --- MAIN DASHBOARD CONTENT --- */
        .main-container {
            flex: 1;
            padding: 40px 60px;
            max-width: 1300px;
            margin: 0 auto;
            width: 100%;
        }

        /* Stat Cards */
        .stat-card {
            background: white;
            border-radius: 16px;
            padding: 22px;
            display: flex;
            align-items: center;
            gap: 18px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.03);
            transition: all 0.2s ease;
        }
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05);
        }
        .icon-box {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4rem;
            color: white;
            flex-shrink: 0;
        }
        .bg-icon-blue { background-color: #2563eb; }
        .bg-icon-green { background-color: #16a34a; }
        .bg-icon-orange { background-color: #ea580c; }
        .bg-icon-red { background-color: #dc2626; }

        .stat-title {
            font-size: 0.85rem;
            color: #64748b;
            margin: 0;
            font-weight: 600;
        }
        .stat-value {
            font-size: 1.6rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
            line-height: 1.2;
        }

        /* Table Section */
        .table-section {
            background: white;
            border-radius: 20px;
            padding: 30px;
            margin-top: 35px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.03);
        }
        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }
        .table-header h5 {
            font-weight: 700;
            color: #0f172a;
            margin: 0;
            font-size: 1.25rem;
        }
        .view-all-link {
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: color 0.2s ease;
        }
        .view-all-link:hover {
            color: #1d4ed8;
            text-decoration: underline;
        }

        /* Custom Table */
        .custom-table {
            width: 100%;
            border-collapse: collapse;
        }
        .custom-table th {
            color: #475569;
            font-weight: 700;
            font-size: 0.9rem;
            padding: 16px;
            border-bottom: 2px solid #f1f5f9;
            text-align: left;
        }
        .custom-table td {
            background: #ffffff;
            padding: 18px 16px;
            font-size: 0.95rem;
            color: #334155;
            vertical-align: middle;
            border-bottom: 1px solid #f1f5f9;
        }

        .action-cell {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        /* Status Badges */
        .badge-pending {
            background-color: #fff7ed;
            color: #ea580c;
            border: 1px solid #ffedd5;
            padding: 6px 14px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.82rem;
        }
        .badge-completed {
            background-color: #f0fdf4;
            color: #16a34a;
            border: 1px solid #dcfce7;
            padding: 6px 14px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.82rem;
        }

        .btn-view-action {
            border: 1px solid #3b82f6;
            background: white;
            color: #2563eb;
            padding: 6px 16px;
            border-radius: 8px;
            font-size: 0.85rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s ease;
        }
        .btn-view-action:hover {
            background-color: #2563eb;
            color: white;
        }

        /* --- EXACT HOME PAGE CONTACT & FOOTER STYLES --- */
        .contact-section {
            padding: 60px 60px; 
            text-align: center; 
            background: #0f172a; 
            color: white;
            margin-top: 60px;
        }
        footer {
            background: #020617;
            color: #94a3b8;
            text-align: center;
            padding: 20px;
            font-size: 14px;
            margin-top: auto;
        }
    </style>
</head>
<body>

    <!-- Fetch Backend Attributes -->
    <%
        Object totalJobs = request.getAttribute("totalJobs");
        Object completedJobs = request.getAttribute("completedJobs");
        Object pendingJobs = request.getAttribute("pendingJobs");
        Object cancelledJobs = request.getAttribute("cancelledJobs");
        
        List todaysBookings = (List) request.getAttribute("todaysBookings");
    %>

    <!-- EXACT NAVBAR HEADER AS HOME PAGE -->
    <nav class="navbar">
        <div class="brand-section">
            <div class="logo-icon">
                <i class="fa-solid fa-bolt-lightning"></i>
            </div>
            <div>
                <div class="brand-name">Smart Service</div>
                <div class="brand-sub">BOOKING SYSTEM</div>
            </div>
        </div>

        <div class="header-actions">
            <div class="header-user-profile">
                <i class="fa-solid fa-user avatar-icon"></i>
                <span>Provider Dashboard</span>
            </div>
        </div>
    </nav>

    <!-- FULL WIDTH DASHBOARD CONTENT -->
    <main class="main-container">
        
        <div class="mb-4">
            <h3 class="fw-bold mb-1" style="color: #0f172a;">Welcome, Provider!</h3>
            <p class="text-muted mb-0">Overview of your recent bookings and service statistics</p>
        </div>

        <!-- 4 Statistic Cards -->
        <div class="row g-4">
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="icon-box bg-icon-blue"><i class="fa-solid fa-clipboard-list"></i></div>
                    <div>
                        <p class="stat-title">Assigned Bookings</p>
                        <h4 class="stat-value"><%= (totalJobs != null) ? totalJobs : "10" %></h4>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <div class="icon-box bg-icon-green"><i class="fa-solid fa-circle-check"></i></div>
                    <div>
                        <p class="stat-title">Completed</p>
                        <h4 class="stat-value"><%= (completedJobs != null) ? completedJobs : "6" %></h4>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <div class="icon-box bg-icon-orange"><i class="fa-solid fa-clock"></i></div>
                    <div>
                        <p class="stat-title">Pending</p>
                        <h4 class="stat-value"><%= (pendingJobs != null) ? pendingJobs : "3" %></h4>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <div class="icon-box bg-icon-red"><i class="fa-solid fa-circle-xmark"></i></div>
                    <div>
                        <p class="stat-title">Cancelled</p>
                        <h4 class="stat-value"><%= (cancelledJobs != null) ? cancelledJobs : "1" %></h4>
                    </div>
                </div>
            </div>
        </div>

        <!-- Today's Bookings Table -->
        <div class="table-section">
            <div class="table-header">
                <h5>Today's Bookings</h5>
                <a href="${pageContext.request.contextPath}/provider/allBookings" class="view-all-link">View All <i class="fa-solid fa-arrow-right ms-1"></i></a>
            </div>

            <div class="table-responsive">
                <table class="custom-table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Service</th>
                            <th>Date Time</th>
                            <th>Time Slot</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (todaysBookings != null && !todaysBookings.isEmpty()) {
                                for (Object item : todaysBookings) {
                                    String bookingId = "", serviceName = "", bookingDate = "", timeSlot = "", status = "";
                                    try {
                                        bookingId = String.valueOf(item.getClass().getMethod("getBookingId").invoke(item));
                                        serviceName = String.valueOf(item.getClass().getMethod("getServiceName").invoke(item));
                                        bookingDate = String.valueOf(item.getClass().getMethod("getBookingDate").invoke(item));
                                        timeSlot = String.valueOf(item.getClass().getMethod("getTimeSlot").invoke(item));
                                        status = String.valueOf(item.getClass().getMethod("getStatus").invoke(item));
                                    } catch (Exception e) {
                                        bookingId = item.toString();
                                    }
                        %>
                                        <tr>
                                            <td>#<%= bookingId %></td>
                                            <td><%= serviceName %></td>
                                            <td><%= bookingDate %></td>
                                            <td><%= timeSlot %></td>
                                            <td>
                                                <div class="action-cell">
                                                    <span class="<%= "Completed".equalsIgnoreCase(status) ? "badge-completed" : "badge-pending" %>">
                                                        <%= status %>
                                                    </span>
                                                    <a href="#" class="btn-view-action">View</a>
                                                </div>
                                            </td>
                                        </tr>
                        <%          
                                }
                            } else { 
                        %>
                                <!-- Fallback Data -->
                                <tr>
                                    <td>#101</td>
                                    <td>AC Repair</td>
                                    <td>20 May 2024</td>
                                    <td>10:00 AM - 12:00 PM</td>
                                    <td>
                                        <div class="action-cell">
                                            <span class="badge-pending">Pending</span>
                                            <a href="#" class="btn-view-action">View</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#102</td>
                                    <td>Plumbing</td>
                                    <td>20 May 2024</td>
                                    <td>02:00 PM - 04:00 PM</td>
                                    <td>
                                        <div class="action-cell">
                                            <span class="badge-pending">Pending</span>
                                            <a href="#" class="btn-view-action">View</a>
                                        </div>
                                    </td>
                                </tr>
                        <% 
                            } 
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- EXACT HOME PAGE CONTACT SECTION -->
    <section id="contact" class="contact-section">
        <h2>Contact Us</h2>
        <p style="margin-top: 15px; color: #94a3b8;">Email: support@smartservice.com | Phone: +91 98765 43210</p>
        <p style="margin-top: 10px; color: #94a3b8;">Address: Office No. 201, Tech Hub Building, Hinjewadi, Pune - 411057</p>
    </section>

    <!-- EXACT HOME PAGE FOOTER -->
    <footer>
        © 2026 Smart Service Booking System | All Rights Reserved.
    </footer>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>