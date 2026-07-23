<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.booking.Booking, java.util.List" %>
<%-- BOOK-05: Manage Bookings Page - Admin (Screen 12 in mockup)
     Shows all bookings across all users with status update capability.
     Data comes from request attribute "bookingList" (List<Booking>)
     Columns: Booking ID, User, Service, Date, Status, Actions
     Admin can change status via dropdown: Pending → Confirmed → Completed
     Reference: mockup screen 12
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Bookings (Admin) - Smart Service</title>
    <!-- TODO: Add CSS styling matching the project theme -->
<<<<<<< HEAD
</head>
<body>

   
=======
     body{
    margin:0;
    padding:0;
    font-family:Arial,Helvetica,sans-serif;
    background:#f4f6f9;
}

.container{
    width:95%;
    margin:30px auto;
    background:#fff;
    padding:20px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.15);
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.header h2{
    color:#1e3a8a;
}

.search input{
    padding:8px;
    width:220px;
    border:1px solid #ccc;
    border-radius:5px;
}

.search button{
    padding:8px 15px;
    background:#2563eb;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#1e3a8a;
    color:white;
    padding:12px;
}

td{
    padding:10px;
    border-bottom:1px solid #ddd;
    text-align:center;
}

.status{
    padding:5px;
    border-radius:5px;
}

.updateBtn{
    background:#2563eb;
    color:white;
    border:none;
    padding:6px 12px;
    border-radius:5px;
    cursor:pointer;
}

</style>

</head>
<body>
<div class="container">

<div class="header">

<h2>Manage Bookings</h2>

<form class="search">
<input type="text" placeholder="Search Booking ID">
<button>Search</button>
</form>

</div>

<table>

<tr>
<th>Booking ID</th>
<th>User ID</th>
<th>Service</th>
<th>Date</th>
<th>Status</th>
<th>Action</th>
</tr>
<%
if (bookingList != null && !bookingList.isEmpty()) {

    for (Booking booking : bookingList) {
%>

<tr>

<td><%= booking.getBookingId() %></td>

<td><%= booking.getUserId() %></td>

<td><%= booking.getServiceName() %></td>

<td><%= booking.getBookingDate() %></td>

<td>

<form action="<%=request.getContextPath()%>/manageBookings" method="post">

<input type="hidden" name="bookingId"
value="<%=booking.getBookingId()%>">

<select name="newStatus" class="status">

<option value="Pending"
<%= "Pending".equals(booking.getStatus()) ? "selected" : "" %>>
Pending
</option>

<option value="Confirmed"
<%= "Confirmed".equals(booking.getStatus()) ? "selected" : "" %>>
Confirmed
</option>

<option value="Completed"
<%= "Completed".equals(booking.getStatus()) ? "selected" : "" %>>
Completed
</option>

<option value="Cancelled"
<%= "Cancelled".equals(booking.getStatus()) ? "selected" : "" %>>
Cancelled
</option>

</select>

</td>

<td>

<input type="submit" value="Update" class="updateBtn">

</form>

</td>

</tr>

<%
    }

} else {
%>

<tr>

<td colspan="6">No Bookings Found</td>

</tr>

<%
}
%>
</table>

<%
String msg = request.getParameter("msg");

if(msg != null && msg.equals("updated")){
%>

<p style="color:green;
text-align:center;
font-weight:bold;
margin-top:20px;">

Booking Status Updated Successfully!

</p>

<%
}
%>

</div>
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
    
</body>
</html>
