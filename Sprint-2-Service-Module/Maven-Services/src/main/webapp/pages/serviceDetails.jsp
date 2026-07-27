<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.Service" %>
<%
    Service s = (Service) request.getAttribute("service");
    if (s == null) {
        response.sendRedirect(request.getContextPath() + "/viewServices");
        return;
    }
    java.util.Map<String,String> iconMap = new java.util.HashMap<>();
    iconMap.put("AC Maintenance",      "fa-fan");
    iconMap.put("Plumbing Services",   "fa-wrench");
    iconMap.put("Electrical Services", "fa-plug");
    iconMap.put("Cleaning Services",   "fa-broom");
    iconMap.put("IT & Repair",         "fa-laptop");
    iconMap.put("Painting Services",   "fa-brush");
    String icon = iconMap.getOrDefault(s.getCategory() != null ? s.getCategory() : "", "fa-toolbox");

    java.util.Map<String,String[]> imgMap = new java.util.HashMap<>();
    imgMap.put("AC Maintenance",      new String[]{"https://images.unsplash.com/photo-1631545806609-3b15b41da38c?w=600&q=80"});
    imgMap.put("Plumbing Services",   new String[]{"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&q=80"});
    imgMap.put("Electrical Services", new String[]{"https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=600&q=80"});
    imgMap.put("Cleaning Services",   new String[]{"https://images.unsplash.com/photo-1563453392212-326f5e854473?w=600&q=80"});
    imgMap.put("IT & Repair",         new String[]{"https://images.unsplash.com/photo-1588702547919-26089e690ecc?w=600&q=80"});
    imgMap.put("Painting Services",   new String[]{"https://images.unsplash.com/photo-1562259949-e8e7689d7828?w=600&q=80"});
    String[] imgArr = imgMap.get(s.getCategory());
    String imgUrl = imgArr != null ? imgArr[0] : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= s.getServiceName() %> - Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background: #f8fafc; min-height: 100vh; display: flex; flex-direction: column; }

        .navbar { background: #0f172a; padding: 14px 50px; display: flex; justify-content: space-between; align-items: center; }
        .brand { display: flex; align-items: center; gap: 12px; text-decoration: none; color: white; }
        .logo-icon { background: linear-gradient(135deg,#3b82f6,#1d4ed8); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 18px; color: white; }
        .brand-name { font-size: 17px; font-weight: 700; }
        .brand-sub  { font-size: 10px; color: #38bdf8; letter-spacing: 1px; }
        .back-link { color: #94a3b8; text-decoration: none; font-size: 13px; font-weight: 500; display: flex; align-items: center; gap: 6px; }
        .back-link:hover { color: white; }

        /* Breadcrumb */
        .breadcrumb { padding: 16px 50px; font-size: 13px; color: #64748b; display: flex; align-items: center; gap: 8px; }
        .breadcrumb a { color: #2563eb; text-decoration: none; }
        .breadcrumb a:hover { text-decoration: underline; }

        /* Main layout */
        .main { flex: 1; padding: 0 50px 50px; }
        .detail-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 36px; align-items: start; }

        /* Left: Image + highlights */
        .img-section img {
            width: 100%; border-radius: 20px; object-fit: cover; height: 340px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }
        .img-placeholder {
            width: 100%; height: 340px; border-radius: 20px;
            background: linear-gradient(135deg,#e0e7ff,#dbeafe);
            display: flex; align-items: center; justify-content: center;
            font-size: 80px; color: #3b82f6;
        }
        .highlights { margin-top: 24px; display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
        .highlight-item { background: white; border: 1px solid #e2e8f0; border-radius: 12px; padding: 14px 16px; display: flex; align-items: center; gap: 10px; }
        .highlight-item i { width: 36px; height: 36px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 16px; flex-shrink: 0; }
        .highlight-item span { font-size: 13px; color: #475569; font-weight: 500; }

        /* Right: Info card */
        .info-card { background: white; border-radius: 20px; border: 1px solid #e2e8f0; padding: 32px; box-shadow: 0 4px 16px rgba(0,0,0,0.04); }
        .service-name { font-size: 26px; font-weight: 800; color: #0f172a; margin-bottom: 8px; }
        .star-row { display: flex; align-items: center; gap: 6px; margin-bottom: 16px; }
        .stars { color: #f59e0b; font-size: 15px; }
        .rating-text { font-size: 13px; color: #64748b; }
        .category-badge { display: inline-block; background: #eff6ff; color: #2563eb; padding: 4px 12px; border-radius: 50px; font-size: 12px; font-weight: 600; margin-bottom: 20px; }
        .divider { border: none; border-top: 1px solid #f1f5f9; margin: 20px 0; }
        .section-label { font-size: 13px; font-weight: 700; color: #334155; margin-bottom: 8px; text-transform: uppercase; letter-spacing: 0.5px; }
        .description { font-size: 14px; color: #475569; line-height: 1.7; }
        .price-row { display: flex; align-items: baseline; gap: 6px; margin: 20px 0 8px; }
        .price-main { font-size: 34px; font-weight: 900; color: #0f172a; }
        .price-label { font-size: 13px; color: #64748b; }

        .includes-list { list-style: none; margin-top: 8px; }
        .includes-list li { font-size: 13.5px; color: #475569; padding: 5px 0; display: flex; align-items: center; gap: 8px; }
        .includes-list li i { color: #16a34a; font-size: 13px; }

        .book-now-btn {
            display: block; width: 100%; text-align: center;
            background: linear-gradient(135deg,#2563eb,#1d4ed8);
            color: white; border: none; padding: 15px;
            border-radius: 12px; font-size: 16px; font-weight: 700;
            cursor: pointer; text-decoration: none;
            box-shadow: 0 4px 14px rgba(37,99,235,0.35);
            transition: all 0.2s; margin-top: 24px;
        }
        .book-now-btn:hover { background: linear-gradient(135deg,#1d4ed8,#1e40af); transform: translateY(-1px); box-shadow: 0 6px 20px rgba(37,99,235,0.45); }

        .status-row { display: flex; align-items: center; gap: 8px; margin-top: 12px; font-size: 13px; color: #64748b; }
        .dot-green { width: 8px; height: 8px; background: #22c55e; border-radius: 50%; }
        .dot-red   { width: 8px; height: 8px; background: #ef4444; border-radius: 50%; }

        footer { background: #0f172a; color: #64748b; text-align: center; padding: 18px; font-size: 13px; }
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
    <a href="${pageContext.request.contextPath}/viewServices" class="back-link">
        <i class="fa-solid fa-arrow-left"></i> Back to Services
    </a>
</nav>

<!-- Breadcrumb -->
<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/viewServices">Home</a>
    <i class="fa-solid fa-chevron-right" style="font-size:10px;"></i>
    <a href="${pageContext.request.contextPath}/viewServices">Services</a>
    <i class="fa-solid fa-chevron-right" style="font-size:10px;"></i>
    <span style="color:#0f172a;font-weight:600;"><%= s.getServiceName() %></span>
</div>

<main class="main">
    <div class="detail-grid">

        <!-- Left -->
        <div class="img-section">
            <% if (imgUrl != null) { %>
                <img src="<%= imgUrl %>" alt="<%= s.getServiceName() %>"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex';">
                <div class="img-placeholder" style="display:none;"><i class="fa-solid <%= icon %>"></i></div>
            <% } else { %>
                <div class="img-placeholder"><i class="fa-solid <%= icon %>"></i></div>
            <% } %>

            <div class="highlights">
                <div class="highlight-item">
                    <i style="background:#eff6ff;color:#2563eb;" class="fa-solid fa-user-shield"></i>
                    <span>Verified Professionals</span>
                </div>
                <div class="highlight-item">
                    <i style="background:#f0fdf4;color:#16a34a;" class="fa-solid fa-clock"></i>
                    <span>On-time Service</span>
                </div>
                <div class="highlight-item">
                    <i style="background:#fffbeb;color:#d97706;" class="fa-solid fa-star"></i>
                    <span>4.5+ Rated</span>
                </div>
                <div class="highlight-item">
                    <i style="background:#fef2f2;color:#ef4444;" class="fa-solid fa-headset"></i>
                    <span>24/7 Support</span>
                </div>
            </div>
        </div>

        <!-- Right -->
        <div class="info-card">
            <div class="category-badge"><i class="fa-solid <%= icon %>" style="margin-right:5px;"></i><%= s.getCategory() != null ? s.getCategory() : "Service" %></div>
            <div class="service-name"><%= s.getServiceName() %></div>
            <div class="star-row">
                <div class="stars">
                    <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i>
                </div>
                <span class="rating-text">4.0 (128 reviews)</span>
            </div>

            <hr class="divider">

            <p class="section-label">Description</p>
            <p class="description">
                <% if (s.getDescription() != null && !s.getDescription().isEmpty()) { %>
                    <%= s.getDescription() %>
                <% } else { %>
                    Professional <%= s.getServiceName() %> service by verified and background-checked technicians. We provide all types of repair and maintenance services at your doorstep.
                <% } %>
            </p>

            <hr class="divider">

            <p class="section-label">Price</p>
            <div class="price-row">
                <div class="price-main">₹<%= String.format("%.0f", s.getPrice()) %></div>
                <div class="price-label">onwards</div>
            </div>
            <p style="font-size:12px;color:#94a3b8;">Final price depends on scope of work</p>

            <hr class="divider">

            <p class="section-label">Includes</p>
            <ul class="includes-list">
                <li><i class="fa-solid fa-circle-check"></i> Free inspection & diagnosis</li>
                <li><i class="fa-solid fa-circle-check"></i> Gas refilling (if applicable)</li>
                <li><i class="fa-solid fa-circle-check"></i> 30-day service warranty</li>
                <li><i class="fa-solid fa-circle-check"></i> Performance check after service</li>
            </ul>

            <div class="status-row">
                <% if ("Active".equals(s.getStatus())) { %>
                    <div class="dot-green"></div> Currently Available
                <% } else { %>
                    <div class="dot-red"></div> Currently Unavailable
                <% } %>
            </div>

            <%-- Book Now — wired to Sprint 3 booking servlet --%>
            <a href="http://localhost:8080/Maven-Bookings/bookService?serviceId=<%= s.getServiceId() %>&serviceName=<%= java.net.URLEncoder.encode(s.getServiceName(), "UTF-8") %>&amount=<%= s.getPrice() %>"
               class="book-now-btn">
                <i class="fa-solid fa-calendar-check" style="margin-right:8px;"></i> Book Now
            </a>

            <p style="text-align:center;font-size:12px;color:#94a3b8;margin-top:12px;">
                Service ID: #<%= s.getServiceId() %>
            </p>
        </div>

    </div>
</main>

<footer>© 2026 Smart Service Booking System | All Rights Reserved.</footer>
</body>
</html>
