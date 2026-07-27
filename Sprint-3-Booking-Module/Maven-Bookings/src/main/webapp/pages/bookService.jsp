<<<<<<< HEAD
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- BOOK-02: Book Service Page (Screen 7 in mockup)
     This page shows a booking form for a selected service.
     Fields: Service Date, Time Slot (dropdown), Address, Additional Notes
     On submit → POST to /bookService servlet
     Reference: mockup screen 7
--%>
=======
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Read service info from URL params passed by Sprint 2 serviceDetails page
    String serviceId   = request.getParameter("serviceId");
    String serviceName = request.getParameter("serviceName");
    String amountStr   = request.getParameter("amount");
    String errorMsg    = (String) request.getAttribute("error");

    // Provide fallbacks
    if (serviceName == null || serviceName.isEmpty()) serviceName = "Service";
    if (amountStr   == null || amountStr.isEmpty())   amountStr   = "0";
    if (serviceId   == null || serviceId.isEmpty())   serviceId   = "0";

    // Image map based on service name keywords
    String imgUrl = "https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=400&q=80";
    String lcName = serviceName.toLowerCase();
    if (lcName.contains("ac") || lcName.contains("air"))
        imgUrl = "https://images.unsplash.com/photo-1631545806609-3b15b41da38c?w=400&q=80";
    else if (lcName.contains("plumb"))
        imgUrl = "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&q=80";
    else if (lcName.contains("electr"))
        imgUrl = "https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=400&q=80";
    else if (lcName.contains("clean"))
        imgUrl = "https://images.unsplash.com/photo-1563453392212-326f5e854473?w=400&q=80";
    else if (lcName.contains("laptop") || lcName.contains("it"))
        imgUrl = "https://images.unsplash.com/photo-1588702547919-26089e690ecc?w=400&q=80";
    else if (lcName.contains("paint"))
        imgUrl = "https://images.unsplash.com/photo-1562259949-e8e7689d7828?w=400&q=80";
%>
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<<<<<<< HEAD
    <title>Book Service - Smart Service</title>
    <!-- TODO: Add CSS styling matching the project theme -->
</head>
<body>

   

</body>
</html>
=======
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book <%= serviceName %> - Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        html, body { height: 100%; }
        body { background: #ecf5fb; color: #333; display: flex; flex-direction: column; }

        /* Header */
        header { background: #0b153a; color: white; padding: 14px 60px; display: flex; justify-content: space-between; align-items: center; }
        .logo-section { display: flex; align-items: center; gap: 10px; text-decoration: none; color: white; }
        .logo-icon { background: #3b82f6; width: 36px; height: 36px; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 16px; }
        .logo-text h2 { font-size: 17px; margin: 0; font-weight: 700; }
        .logo-text p  { font-size: 11px; color: #3d84db; margin: 0; }
        .header-right { display: flex; align-items: center; gap: 14px; }
        .back-link { color: #94a3b8; text-decoration: none; font-size: 13px; display: flex; align-items: center; gap: 5px; }
        .back-link:hover { color: white; }
        .my-bookings-link { background: #16a34a; color: white; text-decoration: none; padding: 7px 16px; border-radius: 7px; font-size: 13px; font-weight: 600; display: flex; align-items: center; gap: 5px; }

        /* Breadcrumbs */
        .breadcrumbs { font-size: 13px; color: #64748b; padding: 14px 50px; display: flex; align-items: center; gap: 6px; }
        .breadcrumbs a { color: #2563eb; text-decoration: none; }
        .breadcrumbs a:hover { text-decoration: underline; }

        /* Page wrapper */
        .page-wrapper { max-width: 1100px; margin: 0 auto; padding: 0 40px 40px; flex: 1; width: 100%; }

        /* 2-col grid */
        .booking-grid { display: grid; grid-template-columns: 1fr 1.6fr; gap: 28px; align-items: start; }

        .card { background: white; border-radius: 12px; padding: 26px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); border: 1px solid #e2e8f0; }
        .card-title { font-size: 18px; font-weight: 700; margin: 0 0 20px; color: #0f172a; }

        /* Service image */
        .svc-img-wrap { width: 100%; height: 160px; border-radius: 8px; overflow: hidden; margin-bottom: 18px; }
        .svc-img-wrap img { width: 100%; height: 100%; object-fit: cover; }

        .svc-name  { font-size: 18px; font-weight: 700; margin-bottom: 6px; color: #0f172a; }
        .svc-price { font-size: 22px; font-weight: 900; color: #2563eb; margin-bottom: 4px; }
        .svc-id    { font-size: 12px; color: #94a3b8; margin-bottom: 18px; }
        .svc-desc-label { font-size: 13px; font-weight: 700; color: #334155; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 6px; }
        .svc-desc  { font-size: 13.5px; color: #475569; line-height: 1.6; }

        .includes { list-style: none; margin-top: 16px; }
        .includes li { font-size: 13px; color: #475569; padding: 4px 0; display: flex; align-items: center; gap: 7px; }
        .includes li i { color: #16a34a; }

        /* Form */
        .alert-error { background: #fef2f2; border: 1px solid #fecaca; color: #dc2626; padding: 12px 16px; border-radius: 8px; font-size: 13.5px; margin-bottom: 18px; display: flex; align-items: center; gap: 8px; }
        .form-group { margin-bottom: 18px; }
        .form-group label { display: block; font-size: 13.5px; font-weight: 600; color: #334155; margin-bottom: 7px; }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%; padding: 10px 13px; border: 1px solid #cbd5e1; border-radius: 8px;
            font-size: 14px; color: #0f172a; background: #f8fafc; outline: none; transition: border-color 0.2s, box-shadow 0.2s;
        }
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
            border-color: #2563eb; box-shadow: 0 0 0 3px rgba(37,99,235,0.1); background: white;
        }
        .form-group textarea { resize: vertical; min-height: 80px; }

        .btn-book {
            background: linear-gradient(135deg,#2563eb,#1d4ed8);
            color: white; border: none; padding: 14px; width: 100%;
            border-radius: 10px; font-size: 15px; font-weight: 700;
            cursor: pointer; box-shadow: 0 4px 14px rgba(37,99,235,0.3);
            transition: all 0.2s; display: flex; align-items: center; justify-content: center; gap: 8px;
        }
        .btn-book:hover { background: linear-gradient(135deg,#1d4ed8,#1e40af); transform: translateY(-1px); }

        footer { background: #1a295f; color: #a5b4fc; text-align: center; padding: 14px; font-size: 13px; margin-top: auto; border-top: 3px solid #3b82f6; }
    </style>
</head>
<body>

<header>
    <a href="http://localhost:8080/Maven-Services/viewServices" class="logo-section">
        <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
        <div class="logo-text">
            <h2>Smart Service</h2>
            <p>Booking System</p>
        </div>
    </a>
    <div class="header-right">
        <a href="http://localhost:8080/Maven-Services/viewServices" class="back-link">
            <i class="fa-solid fa-arrow-left"></i> Back to Services
        </a>
        <a href="${pageContext.request.contextPath}/myBookings" class="my-bookings-link">
            <i class="fa-solid fa-calendar-check"></i> My Bookings
        </a>
    </div>
</header>

<div class="breadcrumbs">
    <a href="http://localhost:8080/Maven-Services/viewServices">Services</a>
    <i class="fa-solid fa-chevron-right" style="font-size:10px;"></i>
    <a href="http://localhost:8080/Maven-Services/serviceDetails?id=<%= serviceId %>"><%= serviceName %></a>
    <i class="fa-solid fa-chevron-right" style="font-size:10px;"></i>
    <span style="color:#0f172a;font-weight:600;">Book Service</span>
</div>

<div class="page-wrapper">
    <div class="booking-grid">

        <!-- Left: Service Details -->
        <div class="card">
            <h3 class="card-title">Service Details</h3>

            <div class="svc-img-wrap">
                <img src="<%= imgUrl %>" alt="<%= serviceName %>"
                     onerror="this.src='https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=400&q=80';">
            </div>

            <div class="svc-name"><%= serviceName %></div>
            <div class="svc-price">₹<%= amountStr %></div>
            <div class="svc-id">Service ID: #<%= serviceId %></div>

            <div class="svc-desc-label">Includes</div>
            <ul class="includes">
                <li><i class="fa-solid fa-circle-check"></i> Free inspection & diagnosis</li>
                <li><i class="fa-solid fa-circle-check"></i> Skilled verified professional</li>
                <li><i class="fa-solid fa-circle-check"></i> 30-day service warranty</li>
                <li><i class="fa-solid fa-circle-check"></i> On-time guaranteed service</li>
            </ul>
        </div>

        <!-- Right: Booking Form -->
        <div class="card">
            <h3 class="card-title">Booking Information</h3>

            <% if (errorMsg != null) { %>
                <div class="alert-error">
                    <i class="fa-solid fa-circle-exclamation"></i> <%= errorMsg %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/bookService" method="POST">

                <%-- Hidden fields passed to servlet --%>
                <input type="hidden" name="serviceId"   value="<%= serviceId %>">
                <input type="hidden" name="serviceName" value="<%= serviceName %>">
                <input type="hidden" name="amount"      value="<%= amountStr %>">

                <div class="form-group">
                    <label for="bookingDate"><i class="fa-regular fa-calendar" style="margin-right:5px;color:#2563eb;"></i>Select Date</label>
                    <input type="date" id="bookingDate" name="bookingDate" required>
                </div>

                <div class="form-group">
                    <label for="timeSlot"><i class="fa-regular fa-clock" style="margin-right:5px;color:#2563eb;"></i>Select Time Slot</label>
                    <select id="timeSlot" name="timeSlot" required>
                        <option value="">-- Select a time slot --</option>
                        <option value="10:00 AM - 12:00 PM">10:00 AM - 12:00 PM</option>
                        <option value="12:00 PM - 02:00 PM">12:00 PM - 02:00 PM</option>
                        <option value="02:00 PM - 04:00 PM">02:00 PM - 04:00 PM</option>
                        <option value="04:00 PM - 06:00 PM">04:00 PM - 06:00 PM</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="address"><i class="fa-solid fa-location-dot" style="margin-right:5px;color:#2563eb;"></i>Address</label>
                    <textarea id="address" name="address" placeholder="Enter your complete address" required></textarea>
                </div>

                <div class="form-group">
                    <label for="notes"><i class="fa-regular fa-note-sticky" style="margin-right:5px;color:#64748b;"></i>Additional Notes <span style="font-weight:400;color:#94a3b8;">(Optional)</span></label>
                    <textarea id="notes" name="notes" placeholder="Any special instructions..."></textarea>
                </div>

                <button type="submit" class="btn-book">
                    <i class="fa-solid fa-calendar-check"></i> Confirm Booking
                </button>
            </form>
        </div>

    </div>
</div>

<footer>
    <p>&copy; 2026 Smart Service Booking System. All rights reserved.</p>
</footer>

<script>
    // Set min date to today
    document.getElementById('bookingDate').setAttribute('min', new Date().toISOString().split('T')[0]);
</script>
</body>
</html>
<<<<<<< HEAD
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
=======
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
