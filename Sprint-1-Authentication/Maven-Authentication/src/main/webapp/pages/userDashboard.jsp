<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.authentication.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Smart Service</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f8fafc; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        .box { background: white; padding: 50px 60px; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 20px rgba(0,0,0,0.05); }
        .badge { display: inline-block; background: #eff6ff; color: #2563eb; font-size: 12px; font-weight: 700; padding: 4px 12px; border-radius: 50px; margin-bottom: 20px; letter-spacing: 1px; }
        h1 { color: #0f172a; font-size: 26px; margin-bottom: 8px; }
        p  { color: #64748b; font-size: 15px; margin-bottom: 30px; }
        a  { display: inline-block; background: #ef4444; color: white; text-decoration: none; padding: 11px 28px; border-radius: 8px; font-size: 14px; font-weight: 600; }
        a:hover { background: #dc2626; }
    </style>
</head>
<body>
    <div class="box">
        <div class="badge">USER</div>
        <h1>Welcome, <%= loggedInUser.getName() %>!</h1>
        <p>User dashboard will be built in the dashboard sprint.</p>
        <div style="display:flex;gap:12px;justify-content:center;flex-wrap:wrap;margin-bottom:16px;">
            <a href="http://localhost:8080/Maven-Services/auth?role=USER&name=<%= java.net.URLEncoder.encode(loggedInUser.getName(), "UTF-8") %>&redirect=viewServices"
               style="display:inline-block;background:linear-gradient(135deg,#2563eb,#1d4ed8);color:white;text-decoration:none;padding:11px 28px;border-radius:8px;font-size:14px;font-weight:600;">
                Browse Services
            </a>
            <a href="${pageContext.request.contextPath}/logout"
               style="display:inline-block;background:#ef4444;color:white;text-decoration:none;padding:11px 28px;border-radius:8px;font-size:14px;font-weight:600;">
                Logout
            </a>
        </div>
    </div>
</body>
</html>
