<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://sun.com" %>
<%@ taglib prefix="fmt" uri="http://sun.com" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Provider Dashboard - Bookings</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f4f6f9; color: #333; }
        .container { max-width: 1100px; margin: 0 auto; }
        .welcome-box { background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); margin-bottom: 25px; }
        .stats-container { display: flex; gap: 20px; margin-bottom: 30px; }
        .card { flex: 1; padding: 20px; border-radius: 8px; color: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .card-blue { background: #007bff; } .card-green { background: #28a745; } .card-orange { background: #fd7e14; }
        .card h3 { margin: 0 0 10px 0; font-size: 1.1rem; opacity: 0.9; }
        .card .value { font-size: 1.8rem; font-weight: bold; }
        .table-section { background: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; color: #555; }
        .status { padding: 5px 10px; border-radius: 4px; font-size: 0.85rem; font-weight: bold; }
        .status-pending { background: #ffeeba; color: #856404; }
        .status-completed { background: #d4edda; color: #155724; }
        .btn-complete { background: #28a745; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer; font-size: 0.85rem; }
        .btn-complete:hover { background: #218838; }
        .alert { padding: 10px 15px; margin-bottom: 20px; border-radius: 4px; }
        .alert-success { background: #d4edda; color: #155724; }
    </style>
</head>
<body>
<div class="container">

    <!-- Welcome Message -->
    <div class="welcome-box">
        <h2>Welcome back, ${sessionScope.username}!</h2>
        <p>Service Type Portfolio: <strong>${sessionScope.serviceType}</strong></p>
    </div>

    <!-- Alert Notifications -->
    <c:if test="${not empty sessionScope.message}">
        <div class="alert alert-success">${sessionScope.message}</div>
        <c:remove var="message" scope="session"/>
    </c:if>

    <!-- Statistics Cards -->
    <div class="stats-container">
        <div class="card card-blue">
            <h3>Total Assignments</h3>
            <div class="value">${totalBookings}</div>
        </div>
        <div class="card card-green">
            <h3>Completed Jobs</h3>
            <div class="value">${completedBookings}</div>
        </div>
        <div class="card card-orange">
            <h3>Pending Tasks</h3>
            <div class="value">${pendingBookings}</div>
        </div>
    </div>

    <!-- Booking Table -->
    <div class="table-section">
        <h3>Assigned Bookings Schedule</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>Appointment Date</th>
                    <th>Current Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>#${booking.id}</td>
                        <td><c:out value="${booking.customerName}"/></td>
                        <td><fmt:formatDate value="${booking.bookingDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <span class="status ${booking.status == 'Pending' ? 'status-pending' : 'status-completed'}">
                                ${booking.status}
                            </span>
                        </td>
                        <td>
                            <c:if test="${booking.status == 'Pending'}">
                                <form action="${pageContext.request.contextPath}/provider/bookings" method="POST" style="margin:0;">
                                    <input type="hidden" name="bookingId" value="${booking.id}">
                                    <button type="submit" class="btn-complete">Mark Complete</button>
                                </form>
                            </c:if>
                            <c:if test="${booking.status != 'Pending'}">
                                <span style="color: #6c757d; font-size: 0.85rem;">No actions</span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty bookings}">
                    <tr>
                        <td colspan="5" style="text-align: center; color: #888;">No job bookings found for your service profile.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
