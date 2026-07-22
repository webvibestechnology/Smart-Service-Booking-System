<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.Service, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services | Smart Service Booking System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background: #f8fafc; min-height: 100vh; display: flex; flex-direction: column; }

        /* ── Navbar ─────────────────────────────────────────────────────────── */
        .navbar {
            background: #0f172a; padding: 14px 50px;
            display: flex; justify-content: space-between; align-items: center;
            position: sticky; top: 0; z-index: 100;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        .brand { display: flex; align-items: center; gap: 12px; text-decoration: none; color: white; }
        .logo-icon { background: linear-gradient(135deg,#3b82f6,#1d4ed8); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 18px; color: white; }
        .brand-name { font-size: 17px; font-weight: 700; }
        .brand-sub  { font-size: 10px; color: #38bdf8; letter-spacing: 1px; }
        .nav-links  { display: flex; gap: 28px; list-style: none; align-items: center; }
        .nav-links a { color: #94a3b8; text-decoration: none; font-size: 14px; font-weight: 500; transition: color 0.2s; }
        .nav-links a:hover { color: white; }
        .nav-links a.active { color: white; }
        .nav-right { display: flex; gap: 10px; align-items: center; }
        .search-wrap { display: flex; align-items: center; background: rgba(255,255,255,0.07); border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; padding: 7px 14px; gap: 8px; }
        .search-wrap input { background: transparent; border: none; outline: none; color: white; font-size: 13px; width: 180px; }
        .search-wrap input::placeholder { color: #64748b; }
        .search-wrap i { color: #64748b; font-size: 13px; }
        .admin-btn { background: linear-gradient(135deg,#7c3aed,#5b21b6); color: white; text-decoration: none; padding: 8px 18px; border-radius: 8px; font-size: 13px; font-weight: 600; display: flex; align-items: center; gap: 6px; }

        /* ── Layout ─────────────────────────────────────────────────────────── */
        .page-body { display: flex; flex: 1; }

        /* ── Sidebar ────────────────────────────────────────────────────────── */
        .sidebar {
            width: 220px; flex-shrink: 0; background: white;
            border-right: 1px solid #e2e8f0; padding: 28px 16px;
        }
        .sidebar h6 { font-size: 11px; font-weight: 700; color: #94a3b8; letter-spacing: 1.5px; text-transform: uppercase; margin-bottom: 16px; padding-left: 12px; }
        .cat-item {
            display: flex; align-items: center; gap: 10px;
            padding: 10px 12px; border-radius: 8px; cursor: pointer;
            font-size: 14px; font-weight: 500; color: #475569;
            transition: all 0.15s; margin-bottom: 4px; border: none; background: none; width: 100%; text-align: left;
        }
        .cat-item:hover { background: #f1f5f9; color: #0f172a; }
        .cat-item.active { background: #eff6ff; color: #2563eb; font-weight: 600; }
        .cat-item i { width: 18px; text-align: center; }

        /* ── Main content ───────────────────────────────────────────────────── */
        .main-content { flex: 1; padding: 30px 36px; }
        .content-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; flex-wrap: wrap; gap: 12px; }
        .content-header h2 { font-size: 20px; font-weight: 800; color: #0f172a; }
        .filters { display: flex; gap: 10px; align-items: center; }
        .filter-select { padding: 8px 14px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 13px; color: #334155; outline: none; cursor: pointer; }
        .filter-select:focus { border-color: #2563eb; }

        /* Alert */
        .alert { padding: 12px 18px; border-radius: 8px; font-size: 13px; font-weight: 500; margin-bottom: 20px; display: flex; align-items: center; gap: 8px; }
        .alert-success { background:#f0fdf4; border:1px solid #bbf7d0; color:#16a34a; }
        .alert-error   { background:#fef2f2; border:1px solid #fecaca; color:#dc2626; }

        /* ── Service Grid ───────────────────────────────────────────────────── */
        .services-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); gap: 20px; }

        .service-card {
            background: white; border-radius: 16px; overflow: hidden;
            border: 1px solid #e2e8f0; transition: all 0.25s;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }
        .service-card:hover { transform: translateY(-5px); box-shadow: 0 12px 24px rgba(0,0,0,0.09); }

        .card-img { width: 100%; height: 160px; object-fit: cover; background: #f1f5f9; }
        .card-img-placeholder { width: 100%; height: 160px; background: linear-gradient(135deg,#e0e7ff,#dbeafe); display: flex; align-items: center; justify-content: center; font-size: 40px; color: #3b82f6; }

        .card-body { padding: 16px; }
        .card-body h3 { font-size: 15px; font-weight: 700; color: #0f172a; margin-bottom: 4px; }
        .card-category { font-size: 12px; color: #64748b; margin-bottom: 8px; }
        .card-desc { font-size: 12.5px; color: #64748b; line-height: 1.5; margin-bottom: 10px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
        .card-footer-row { display: flex; justify-content: space-between; align-items: center; margin-top: 12px; }
        .card-price { font-size: 17px; font-weight: 800; color: #0f172a; }
        .card-price span { font-size: 12px; color: #64748b; font-weight: 400; }
        .star-row { font-size: 12px; color: #f59e0b; margin-bottom: 4px; }
        .star-row span { color: #64748b; }
        .book-btn {
            background: linear-gradient(135deg,#2563eb,#1d4ed8);
            color: white; border: none; padding: 8px 18px;
            border-radius: 8px; font-size: 13px; font-weight: 600;
            cursor: pointer; text-decoration: none; display: inline-block;
            transition: all 0.2s;
        }
        .book-btn:hover { background: linear-gradient(135deg,#1d4ed8,#1e40af); transform: translateY(-1px); }

        .badge-active   { background:#f0fdf4; color:#16a34a; padding:3px 10px; border-radius:50px; font-size:11px; font-weight:600; }
        .badge-inactive { background:#fef2f2; color:#dc2626; padding:3px 10px; border-radius:50px; font-size:11px; font-weight:600; }

        .empty-state { text-align: center; padding: 80px 20px; color: #94a3b8; grid-column: 1/-1; }
        .empty-state i { font-size: 48px; margin-bottom: 16px; display: block; }

        /* Footer */
        footer { background: #0f172a; color: #64748b; text-align: center; padding: 20px; font-size: 13px; }
    </style>
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/viewServices" class="brand">
        <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
        <div>
            <div class="brand-name">Smart Service</div>
            <div class="brand-sub">BOOKING SYSTEM</div>
        </div>
    </a>
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/viewServices" class="active">Services</a></li>
        <li><a href="http://localhost:8080/Maven-Authentication/pages/index.jsp">Home</a></li>
    </ul>
    <div class="nav-right">
        <div class="search-wrap">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" id="searchInput" placeholder="Search services..." onkeyup="filterCards()">
        </div>
        <%-- Only show Add Service button to ADMIN --%>
        <%
            String sessionRole = null;
            jakarta.servlet.http.HttpSession sess = request.getSession(false);
            if (sess != null) { sessionRole = (String) sess.getAttribute("role"); }
        %>
        <% if ("ADMIN".equals(sessionRole)) { %>
        <a href="${pageContext.request.contextPath}/addService" class="admin-btn">
            <i class="fa-solid fa-plus"></i> Add Service
        </a>
        <% } %>
    </div>
</nav>

<div class="page-body">
    <!-- Sidebar -->
    <aside class="sidebar">
        <h6>Categories</h6>
        <button class="cat-item active" onclick="filterByCategory('all', this)">
            <i class="fa-solid fa-list" style="color:#2563eb;"></i> All Services
        </button>
        <button class="cat-item" onclick="filterByCategory('AC Maintenance', this)">
            <i class="fa-solid fa-fan" style="color:#0ea5e9;"></i> AC Repair
        </button>
        <button class="cat-item" onclick="filterByCategory('Plumbing Services', this)">
            <i class="fa-solid fa-wrench" style="color:#2563eb;"></i> Plumbing
        </button>
        <button class="cat-item" onclick="filterByCategory('Electrical Services', this)">
            <i class="fa-solid fa-plug" style="color:#eab308;"></i> Electrician
        </button>
        <button class="cat-item" onclick="filterByCategory('Cleaning Services', this)">
            <i class="fa-solid fa-broom" style="color:#16a34a;"></i> Cleaning
        </button>
        <button class="cat-item" onclick="filterByCategory('IT & Repair', this)">
            <i class="fa-solid fa-laptop" style="color:#7c3aed;"></i> Laptop Repair
        </button>
        <button class="cat-item" onclick="filterByCategory('Painting Services', this)">
            <i class="fa-solid fa-brush" style="color:#ef4444;"></i> Painting
        </button>
    </aside>

    <!-- Main -->
    <main class="main-content">
        <div class="content-header">
            <div>
                <h2>All Services</h2>
                <p style="font-size:13px;color:#64748b;margin-top:3px;">Find and book trusted professionals</p>
            </div>
            <div class="filters">
                <select class="filter-select" onchange="filterBySelect(this.value)">
                    <option value="all">All Categories</option>
                    <option value="AC Maintenance">AC Maintenance</option>
                    <option value="Plumbing Services">Plumbing Services</option>
                    <option value="Electrical Services">Electrical Services</option>
                    <option value="Cleaning Services">Cleaning Services</option>
                    <option value="IT & Repair">IT &amp; Repair</option>
                    <option value="Painting Services">Painting Services</option>
                </select>
            </div>
        </div>

        <%-- Feedback messages --%>
        <% String msg = request.getParameter("msg"); String err = request.getParameter("error"); %>
        <% if ("updatesuccess".equals(msg)) { %><div class="alert alert-success"><i class="fa-solid fa-circle-check"></i> Service updated successfully.</div><% } %>
        <% if ("deletesuccess".equals(msg)) { %><div class="alert alert-success"><i class="fa-solid fa-circle-check"></i> Service deleted successfully.</div><% } %>
        <% if (err != null) { %><div class="alert alert-error"><i class="fa-solid fa-circle-exclamation"></i> An error occurred. Please try again.</div><% } %>

        <%
            // Category icon mapping
            java.util.Map<String,String> iconMap = new java.util.HashMap<>();
            iconMap.put("AC Maintenance",      "fa-fan");
            iconMap.put("Plumbing Services",   "fa-wrench");
            iconMap.put("Electrical Services", "fa-plug");
            iconMap.put("Cleaning Services",   "fa-broom");
            iconMap.put("IT & Repair",         "fa-laptop");
            iconMap.put("Painting Services",   "fa-brush");

            java.util.Map<String,String[]> imgMap = new java.util.HashMap<>();
            imgMap.put("AC Maintenance",      new String[]{"https://images.unsplash.com/photo-1631545806609-3b15b41da38c?w=400&q=80","#e0f2fe"});
            imgMap.put("Plumbing Services",   new String[]{"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&q=80","#eff6ff"});
            imgMap.put("Electrical Services", new String[]{"https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=400&q=80","#fffbeb"});
            imgMap.put("Cleaning Services",   new String[]{"https://images.unsplash.com/photo-1563453392212-326f5e854473?w=400&q=80","#f0fdf4"});
            imgMap.put("IT & Repair",         new String[]{"https://images.unsplash.com/photo-1588702547919-26089e690ecc?w=400&q=80","#f5f3ff"});
            imgMap.put("Painting Services",   new String[]{"https://images.unsplash.com/photo-1562259949-e8e7689d7828?w=400&q=80","#fef2f2"});
        %>

        <div class="services-grid" id="servicesGrid">
            <%
                List<Service> serviceList = (List<Service>) request.getAttribute("serviceList");
                if (serviceList == null || serviceList.isEmpty()) {
            %>
                <div class="empty-state">
                    <i class="fa-solid fa-folder-open"></i>
                    <p>No services found. <a href="${pageContext.request.contextPath}/addService" style="color:#2563eb;font-weight:600;">Add one now</a>.</p>
                </div>
            <%
                } else {
                    for (Service s : serviceList) {
                        String cat = s.getCategory() != null ? s.getCategory() : "";
                        String icon = iconMap.getOrDefault(cat, "fa-toolbox");
                        String[] imgData = imgMap.get(cat);
                        String imgUrl = imgData != null ? imgData[0] : null;
                        String bg     = imgData != null ? imgData[1] : "#f1f5f9";
            %>
            <div class="service-card" data-category="<%= cat %>">
                <% if (imgUrl != null) { %>
                    <img class="card-img" src="<%= imgUrl %>" alt="<%= s.getServiceName() %>" onerror="this.style.display='none';this.nextElementSibling.style.display='flex';">
                    <div class="card-img-placeholder" style="display:none;background:<%= bg %>;"><i class="fa-solid <%= icon %>"></i></div>
                <% } else { %>
                    <div class="card-img-placeholder" style="background:<%= bg %>;"><i class="fa-solid <%= icon %>"></i></div>
                <% } %>
                <div class="card-body">
                    <div class="star-row"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i> <span>(128)</span></div>
                    <h3><%= s.getServiceName() %></h3>
                    <p class="card-category"><%= cat %></p>
                    <% if (s.getDescription() != null && !s.getDescription().isEmpty()) { %>
                        <p class="card-desc"><%= s.getDescription() %></p>
                    <% } %>
                    <div class="card-footer-row">
                        <div>
                            <div class="card-price">₹<%= String.format("%.0f", s.getPrice()) %> <span>onwards</span></div>
                            <% if ("Active".equals(s.getStatus())) { %>
                                <span class="badge-active">Available</span>
                            <% } else { %>
                                <span class="badge-inactive">Unavailable</span>
                            <% } %>
                        </div>
                        <% if ("ADMIN".equals(sessionRole)) { %>
                            <a href="${pageContext.request.contextPath}/updateService?id=<%= s.getServiceId() %>" class="book-btn" style="background:linear-gradient(135deg,#7c3aed,#5b21b6);margin-right:6px;">Edit</a>
                        <% } %>
                        <a href="${pageContext.request.contextPath}/serviceDetails?id=<%= s.getServiceId() %>" class="book-btn">Book Now</a>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </main>
</div>

<footer>© 2026 Smart Service Booking System | All Rights Reserved.</footer>

<script>
function filterCards() {
    const q = document.getElementById("searchInput").value.toLowerCase();
    document.querySelectorAll(".service-card").forEach(function(card) {
        card.style.display = card.textContent.toLowerCase().includes(q) ? "" : "none";
    });
}

function filterByCategory(cat, btn) {
    document.querySelectorAll(".cat-item").forEach(function(b) { b.classList.remove("active"); });
    btn.classList.add("active");
    document.querySelectorAll(".service-card").forEach(function(card) {
        card.style.display = (cat === "all" || card.dataset.category === cat) ? "" : "none";
    });
    document.getElementById("searchInput").value = "";
}

function filterBySelect(cat) {
    document.querySelectorAll(".cat-item").forEach(function(b) { b.classList.remove("active"); });
    document.querySelectorAll(".service-card").forEach(function(card) {
        card.style.display = (cat === "all" || card.dataset.category === cat) ? "" : "none";
    });
}
</script>
</body>
</html>
