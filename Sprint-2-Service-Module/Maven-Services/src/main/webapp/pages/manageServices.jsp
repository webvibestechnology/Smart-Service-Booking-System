<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.Service, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Services (Admin) - Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background: #f8fafc; min-height: 100vh; display: flex; flex-direction: column; }

        /* Navbar */
        .navbar { background: #0f172a; padding: 14px 40px; display: flex; justify-content: space-between; align-items: center; }
        .brand { display: flex; align-items: center; gap: 12px; text-decoration: none; color: white; }
        .logo-icon { background: linear-gradient(135deg,#3b82f6,#1d4ed8); width: 38px; height: 38px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 16px; color: white; }
        .brand-name { font-size: 16px; font-weight: 700; }
        .brand-sub  { font-size: 10px; color: #38bdf8; letter-spacing: 1px; }
        .admin-tag { background: rgba(124,58,237,0.15); color: #a78bfa; border: 1px solid rgba(124,58,237,0.3); padding: 4px 12px; border-radius: 50px; font-size: 12px; font-weight: 600; }
        .add-btn { background: linear-gradient(135deg,#2563eb,#1d4ed8); color: white; text-decoration: none; padding: 9px 20px; border-radius: 8px; font-size: 13px; font-weight: 600; display: flex; align-items: center; gap: 6px; transition: all 0.2s; }
        .add-btn:hover { transform: translateY(-1px); box-shadow: 0 4px 12px rgba(37,99,235,0.4); }

        /* Layout */
        .main { flex: 1; padding: 32px 40px; }

        /* Alerts */
        .alert { padding: 12px 18px; border-radius: 8px; font-size: 13px; font-weight: 500; margin-bottom: 20px; display: flex; align-items: center; gap: 8px; }
        .alert-success { background:#f0fdf4; border:1px solid #bbf7d0; color:#16a34a; }
        .alert-error   { background:#fef2f2; border:1px solid #fecaca; color:#dc2626; }

        /* Table Card */
        .table-card { background: white; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 4px 16px rgba(0,0,0,0.04); overflow: hidden; }

        .table-header { padding: 22px 28px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px; border-bottom: 1px solid #f1f5f9; }
        .table-header h2 { font-size: 18px; font-weight: 800; color: #0f172a; }
        .table-header p  { font-size: 12.5px; color: #64748b; margin-top: 2px; }
        .search-bar { padding: 8px 14px 8px 36px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 13px; color: #0f172a; outline: none; width: 220px; position: relative; }
        .search-wrap { position: relative; }
        .search-wrap i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #94a3b8; font-size: 13px; }
        .search-bar:focus { border-color: #2563eb; }

        table { width: 100%; border-collapse: collapse; }
        thead th { background: #f8fafc; font-size: 11.5px; font-weight: 700; color: #64748b; letter-spacing: 0.8px; text-transform: uppercase; padding: 13px 20px; border-bottom: 1px solid #e2e8f0; text-align: left; }
        tbody td { padding: 15px 20px; border-bottom: 1px solid #f1f5f9; font-size: 13.5px; color: #1e293b; vertical-align: middle; }
        tbody tr:last-child td { border-bottom: none; }
        tbody tr:hover { background: #fafbfc; }

        .svc-id { color: #94a3b8; font-size: 12px; font-weight: 600; }
        .svc-name { font-weight: 700; color: #0f172a; }
        .svc-price { font-weight: 800; color: #2563eb; font-size: 15px; }
        .badge-active   { background:#f0fdf4; color:#16a34a; padding:4px 10px; border-radius:50px; font-size:11.5px; font-weight:600; }
        .badge-inactive { background:#fef2f2; color:#dc2626; padding:4px 10px; border-radius:50px; font-size:11.5px; font-weight:600; }

        .btn-edit   { padding:6px 14px; border-radius:6px; text-decoration:none; font-size:12.5px; font-weight:600; display:inline-flex; align-items:center; gap:5px; border:1px solid #334155; color:#334155; margin-right:5px; transition:all 0.15s; }
        .btn-edit:hover { background:#0f172a; color:white; border-color:#0f172a; }
        .btn-delete { padding:6px 14px; border-radius:6px; text-decoration:none; font-size:12.5px; font-weight:600; display:inline-flex; align-items:center; gap:5px; background:#ef4444; color:white; border:1px solid #ef4444; transition:all 0.15s; }
        .btn-delete:hover { background:#dc2626; }

        .empty-state { text-align:center; padding:60px; color:#94a3b8; }
        .empty-state i { font-size:42px; margin-bottom:12px; display:block; }

        footer { background:#0f172a; color:#64748b; text-align:center; padding:18px; font-size:13px; }
    </style>
</head>
<body>

<nav class="navbar">
    <div style="display:flex;align-items:center;gap:20px;">
        <a href="${pageContext.request.contextPath}/viewServices" class="brand">
            <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
            <div>
                <div class="brand-name">Smart Service</div>
                <div class="brand-sub">BOOKING SYSTEM</div>
            </div>
        </a>
        <span class="admin-tag"><i class="fa-solid fa-shield-halved"></i> Admin</span>
    </div>
    <a href="${pageContext.request.contextPath}/addService" class="add-btn">
        <i class="fa-solid fa-plus"></i> Add New Service
    </a>
</nav>

<main class="main">
    <%-- Feedback --%>
    <% String msg = request.getParameter("msg"); String err = request.getParameter("error"); %>
    <% if ("updatesuccess".equals(msg)) { %><div class="alert alert-success"><i class="fa-solid fa-circle-check"></i> Service updated successfully.</div><% } %>
    <% if ("deletesuccess".equals(msg)) { %><div class="alert alert-success"><i class="fa-solid fa-circle-check"></i> Service deleted successfully.</div><% } %>
    <% if (err != null) { %><div class="alert alert-error"><i class="fa-solid fa-circle-exclamation"></i> An error occurred. Please try again.</div><% } %>

    <div class="table-card">
        <div class="table-header">
            <div>
                <h2>Manage Services</h2>
                <p>View, edit, or remove services from the platform.</p>
            </div>
            <div class="search-wrap">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" class="search-bar" id="searchInput" placeholder="Search services..." onkeyup="filterTable()">
            </div>
        </div>

        <%
            List<Service> serviceList = (List<Service>) request.getAttribute("serviceList");
            if (serviceList == null || serviceList.isEmpty()) {
        %>
            <div class="empty-state">
                <i class="fa-solid fa-folder-open"></i>
                <p>No services found. <a href="${pageContext.request.contextPath}/addService" style="color:#2563eb;font-weight:600;">Add one now</a>.</p>
            </div>
        <% } else { %>
        <table id="serviceTable">
            <thead>
                <tr>
                    <th style="width:8%">ID</th>
                    <th style="width:28%">Service Name</th>
                    <th style="width:22%">Category</th>
                    <th style="width:14%">Price</th>
                    <th style="width:12%">Status</th>
                    <th style="width:16%;text-align:center;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Service s : serviceList) { %>
                <tr>
                    <td class="svc-id">#<%= s.getServiceId() %></td>
                    <td class="svc-name"><%= s.getServiceName() %></td>
                    <td><%= s.getCategory() != null ? s.getCategory() : "—" %></td>
                    <td class="svc-price">₹<%= String.format("%.0f", s.getPrice()) %></td>
                    <td>
                        <% if ("Active".equals(s.getStatus())) { %>
                            <span class="badge-active">Active</span>
                        <% } else { %>
                            <span class="badge-inactive">Inactive</span>
                        <% } %>
                    </td>
                    <td style="text-align:center;">
                        <a href="${pageContext.request.contextPath}/updateService?id=<%= s.getServiceId() %>" class="btn-edit">
                            <i class="fa-solid fa-pen"></i> Edit
                        </a>
                        <a href="${pageContext.request.contextPath}/deleteService?id=<%= s.getServiceId() %>"
                           class="btn-delete"
                           onclick="return confirm('Are you sure you want to delete this service?')">
                            <i class="fa-solid fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
    </div>
</main>

<footer>© 2026 Smart Service Booking System | All Rights Reserved.</footer>

<script>
function filterTable() {
    const q = document.getElementById("searchInput").value.toLowerCase();
    document.querySelectorAll("#serviceTable tbody tr").forEach(function(row) {
        row.style.display = row.textContent.toLowerCase().includes(q) ? "" : "none";
    });
}
</script>
</body>
</html>
