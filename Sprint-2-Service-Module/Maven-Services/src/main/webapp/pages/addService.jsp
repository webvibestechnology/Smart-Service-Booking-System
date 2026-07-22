<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Service - Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background: #f8fafc; min-height: 100vh; display: flex; flex-direction: column; }

        .navbar { background: #0f172a; padding: 16px 60px; display: flex; justify-content: space-between; align-items: center; }
        .brand { display: flex; align-items: center; gap: 12px; text-decoration: none; color: white; }
        .logo-icon { background: linear-gradient(135deg,#3b82f6,#1d4ed8); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 18px; color: white; }
        .brand-name { font-size: 18px; font-weight: 700; }
        .brand-sub  { font-size: 11px; color: #38bdf8; letter-spacing: 1px; }
        .nav-actions { display: flex; gap: 12px; align-items: center; }
        .nav-btn { padding: 9px 20px; border-radius: 8px; text-decoration: none; font-size: 13px; font-weight: 600; display: flex; align-items: center; gap: 6px; }
        .btn-outline { border: 1px solid #334155; color: #94a3b8; }
        .btn-outline:hover { background: #1e293b; color: white; }
        .btn-primary-nav { background: linear-gradient(135deg,#2563eb,#1d4ed8); color: white; }

        .main { flex: 1; display: flex; justify-content: center; align-items: flex-start; padding: 50px 20px; }
        .card {
            background: white; width: 100%; max-width: 620px;
            border-radius: 20px; border: 1px solid #e2e8f0;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05); overflow: hidden;
        }
        .card-header {
            background: linear-gradient(135deg,#0f172a,#1e293b);
            padding: 28px 36px; color: white;
        }
        .card-header h2 { font-size: 22px; font-weight: 700; margin-bottom: 4px; }
        .card-header p  { color: #94a3b8; font-size: 13px; }
        .card-body { padding: 36px; }

        .alert-error   { background:#fef2f2; border:1px solid #fecaca; color:#dc2626; padding:12px 16px; border-radius:8px; margin-bottom:20px; font-size:13.5px; display:flex; align-items:center; gap:8px; }
        .alert-success { background:#f0fdf4; border:1px solid #bbf7d0; color:#16a34a; padding:12px 16px; border-radius:8px; margin-bottom:20px; font-size:13.5px; display:flex; align-items:center; gap:8px; }

        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .form-group { display: flex; flex-direction: column; }
        .form-group.full { grid-column: span 2; }
        label { font-size: 13px; font-weight: 600; color: #334155; margin-bottom: 6px; }
        input, select, textarea {
            padding: 11px 14px; border: 1px solid #cbd5e1; border-radius: 8px;
            font-size: 14px; color: #0f172a; outline: none;
            transition: border-color 0.2s, box-shadow 0.2s; background: #f8fafc;
        }
        input:focus, select:focus, textarea:focus {
            border-color: #2563eb; box-shadow: 0 0 0 3px rgba(37,99,235,0.1); background: white;
        }
        textarea { resize: vertical; min-height: 90px; }

        .btn-submit {
            grid-column: span 2; width: 100%; padding: 13px;
            background: linear-gradient(135deg,#2563eb,#1d4ed8);
            color: white; border: none; border-radius: 10px;
            font-size: 15px; font-weight: 600; cursor: pointer;
            box-shadow: 0 4px 14px rgba(37,99,235,0.3);
            transition: all 0.2s; margin-top: 6px;
        }
        .btn-submit:hover { background: linear-gradient(135deg,#1d4ed8,#1e40af); transform: translateY(-1px); }
        .back-link { text-align: center; margin-top: 18px; font-size: 13px; color: #64748b; }
        .back-link a { color: #2563eb; font-weight: 600; text-decoration: none; }
    </style>
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/viewServices" class="brand">
        <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
        <div>
            <div class="brand-name">Smart Service</div>
            <div class="brand-sub">ADMIN PANEL</div>
        </div>
    </a>
    <div class="nav-actions">
        <a href="${pageContext.request.contextPath}/viewServices" class="nav-btn btn-outline">
            <i class="fa-solid fa-list"></i> View Services
        </a>
    </div>
</nav>

<main class="main">
    <div class="card">
        <div class="card-header">
            <h2><i class="fa-solid fa-circle-plus" style="color:#38bdf8;margin-right:10px;"></i>Add New Service</h2>
            <p>Fill in the details to add a new service to the platform.</p>
        </div>
        <div class="card-body">

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="alert-error"><i class="fa-solid fa-circle-exclamation"></i> <%= error %></div>
            <% } %>

            <form action="${pageContext.request.contextPath}/addService" method="post" class="form-grid">

                <div class="form-group full">
                    <label for="serviceName">Service Name</label>
                    <input type="text" id="serviceName" name="serviceName" placeholder="e.g. AC Repair" required>
                </div>

                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" name="category" required>
                        <option value="" disabled selected>Select category</option>
                        <option value="AC Maintenance">AC Maintenance</option>
                        <option value="Plumbing Services">Plumbing Services</option>
                        <option value="Electrical Services">Electrical Services</option>
                        <option value="Cleaning Services">Cleaning Services</option>
                        <option value="IT & Repair">IT &amp; Repair</option>
                        <option value="Painting Services">Painting Services</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="price">Price (₹)</label>
                    <input type="number" id="price" name="price" placeholder="e.g. 499" min="0" step="0.01" required>
                </div>

                <div class="form-group full">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" placeholder="Brief description of the service..."></textarea>
                </div>

                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status" required>
                        <option value="Active" selected>Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>

                <div class="form-group" style="align-self:end;">
                    <!-- spacer -->
                </div>

                <button type="submit" class="btn-submit">
                    <i class="fa-solid fa-floppy-disk"></i> &nbsp;Save Service
                </button>
            </form>

            <p class="back-link">
                <a href="${pageContext.request.contextPath}/manageServices">
                    <i class="fa-solid fa-arrow-left"></i> Back to Services List
                </a>
            </p>
        </div>
    </div>
</main>

</body>
</html>
