<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jakarta.servlet.http.HttpSession"%>
<%
HttpSession session1 = request.getSession(false);

if(session1 == null || session1.getAttribute("userId") == null){
    response.sendRedirect("Login.jsp");
    return;
}
%>

<h2>Dashboard</h2>

User ID :
<%= session1.getAttribute("userId") %>

<br><br>

User Name :
<%= session1.getAttribute("userName") %>
<br><br>

User Email :
<%= session1.getAttribute("userEmail") %>

<br><br>

User Role :
<%= session1.getAttribute("userRole") %>

<br><br>

<a href="Profile.jsp">Profile</a><br>
<a href="Booking.jsp">Booking</a><br>
<a href="ServiceManagement.jsp">Service Management</a><br><br>

<a href="logout">Logout</a>
    