<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://sun.com" prefix="c" %>
<%@ taglib uri="http://sun.com" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f6f9; }
        .wrapper { display: flex; }
        .main-content { flex: 1; padding: 30px; }
        .cards-container { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-bottom: 30px; }
        .card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .card h3 { margin: 0 0 10px 0; color: #7f8c8d; font-size: 14px; text-transform: uppercase; }
        .card .value { font-size: 28px; font-weight: bold; color: #2c3e50; }
        .table-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .table-container h3 { margin-top: 0; margin-bottom: 20px; color: #2c3e50; }
        table { width: 100%; border-collapse: collapse; text-align: left; }
        th, td { padding: 12px 15px; border-bottom: 1px solid #e2e8f0; }
        th { background-color: #f8fafc; color: #64748b; font-weight: 600; }
        .status { padding: 4px 8px; border-radius: 4px; font-size: 12px; font-weight: bold; }
        .status-pending { background: #fef3c7; color: #d97706; }
        .status-completed { background: #dcfce7; color: #15803d; }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Include Sidebar component -->
        <%@ include file="adminSidebar.jsp" %>

        <div class="main-content">
            <h1 style="margin-top: 0; margin-bottom: 30px; color: #2c3e50;">Dashboard Overview</h1>
            
            <!-- Statistical Cards -->
            <div class="cards-container">
                <div class="card">
                    <h3>Total Services</h3>
                    <div class="value">${totalServices}</div>
                </div>
                <div class="card">
                    <h3>Total Bookings</h3>
                    <div class="value">${totalBookings}</div>
                </div>
                <div class="card">
                    <h3>Pending Bookings</h3>
                    <div class="value" style="color: #e67e22;">${pendingBookings}</div>
                </div>
                <div class="card">
                    <h3>Revenue</h3>
                    <div class="value" style="color: #1bc562;">
                        <fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="$" />
                    </div>
                </div>
            </div>

            <!-- Recent Transactions Table -->
            <div class="table-container">
                <h3>Recent Bookings</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Service Name</th>
                            <th>Date Ordered</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${recentBookings}">
                            <tr>
                                <td>#${booking.id}</td>
                                <td><c:out value="${booking.service_name}" /></td>
                                <td><fmt:formatDate value="${booking.booking_date}" pattern="yyyy-MM-dd HH:mm" /></td>
                                <td>
                                    <span class="status ${booking.status == 'PENDING' ? 'status-pending' : 'status-completed'}">
                                        <c:out value="${booking.status}" />
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if var="hasNoBookings" test="${empty recentBookings}">
                            <tr>
                                <td colspan="4" style="text-align: center; color: #94a3b8;">No records found.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
