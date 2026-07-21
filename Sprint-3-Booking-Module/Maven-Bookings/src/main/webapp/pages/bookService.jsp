<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- BOOK-02: Book Service Page (Screen 7 in mockup)
     This page shows a booking form for a selected service.
     Fields: Service Date, Time Slot (dropdown), Address, Additional Notes
     On submit → POST to /bookService servlet
     Reference: mockup screen 7
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Service - Book Service</title>
    <!-- Font Awesome Link (For Lightning Icon) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            color: #333;
        }

        /* 1. Header & Logo Styling */
        header {
            background-color: #0b153a;
            color: white;
            padding: 12px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .logo-section {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .logo-icon {
            background-color: #3b82f6;
            width: 30px;
            height: 30px;
            border-radius: 10%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: #fff;
        }
        .logo-text h2 {
            margin: 0;
            font-size: 18px;
            font-weight: bold;
            line-height: 1.2;
        }
        .logo-text p {
            margin: 0;
            font-size: 12px;
            color: #3d84db;
        }
        
        /* Navbar User Section */
        .navbar-user {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
        }
        .user-avatar {
            width: 32px;
            height: 32px;
            background-color: #3b5998;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 13px;
            border: 2px solid #fff;
        }

        /* Container & Layout */
        .page-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 40px;
        }

        /* Breadcrumbs */
        .breadcrumbs {
            font-size: 13px;
            color: #777;
            margin-bottom: 25px;
        }
        .breadcrumbs a {
            color: #0056b3;
            text-decoration: none;
        }
        .breadcrumbs span {
            color: #333;
            font-weight: 500;
        }

        /* 2-Column Grid Layout */
        .booking-grid {
            display: grid;
            grid-template-columns: 1fr 1.6fr;
            gap: 30px;
            align-items: start;
        }

        .card {
            background: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
            border: 1px solid #eef2f5;
        }
        .card-title {
            font-size: 16px;
            font-weight: 600;
            margin-top: 0;
            margin-bottom: 20px;
            color: #111;
        }

        /* Left Side Card: Service Image Thumbnail */
        .service-thumbnail-container {
            width: 150px;
            height: 95px;
            background-color: #e2e8f0;
            border-radius: 6px;
            overflow: hidden;
            margin-bottom: 20px;
            border: 1px solid #e2eef0;
        }
        .service-thumbnail-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Typography for details */
        .service-title-text {
            font-size: 16px;
            font-weight: 700;
            margin: 0 0 6px 0;
            color: #111;
        }
        .service-price-text {
            font-size: 14px;
            color: #333;
            margin: 0 0 6px 0;
        }
        .service-id-text {
            font-size: 13px;
            color: #777;
            margin: 0 0 20px 0;
        }
        .section-heading-small {
            font-size: 14px;
            font-weight: 600;
            color: #111;
            margin: 0 0 6px 0;
        }
        .service-description-body {
            font-size: 13px;
            color: #555;
            line-height: 1.5;
            margin: 0;
        }

        /* Right Side Form Elements */
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #444;
            margin-bottom: 8px;
        }
        .form-group input, 
        .form-group select, 
        .form-group textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #c4e0fc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 13px;
            color: #333;
            background-color: #fff;
        }
        .form-group input:focus, 
        .form-group select:focus, 
        .form-group textarea:focus {
            outline: none;
            border-color: #0056b3;
        }

        /* Confirm Booking Button */
        .btn-submit-booking {
            background-color: #0056b3;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.15s ease;
        }
        .btn-submit-booking:hover {
            background-color: #004085;
        }
    </style>
</head>
<body>

    <!-- 1. Header Section  -->
    <header>
        <div class="logo-section">
            <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
            <div class="logo-text">
                <h2>Smart Service</h2>
                <p>Booking System</p>
            </div>
        </div>
    </header>

    <div class="page-wrapper">
        
        <!-- Breadcrumbs Navigation -->
        <div class="breadcrumbs">
            <a href="home">Home</a> &gt; <a href="services">Services</a> &gt; <a href="Ac Repair">Ac Repair<c:out value="${not empty service.name ? service.name : 'AC Repair'}"/></a> &gt; <span>Book Service</span>
        </div>

        <div class="booking-grid">
            
            <!-- 2. Left Panel: Service Details -->
            <div class="card">
                <h3 class="card-title">Service Details</h3>
                <!--image path-->
                <div class="service-thumbnail-container">
                    <img src="file:///C:/Users/ADMIN/Pictures/Saved%20Pictures/service-ac.jpg" alt="Service Preview" onerror="this.src='https://via.placeholder.com/140x95?text=AC+Repair';">
                </div>
                
                <h4 class="service-title-text">AC Repaire<c:out value="${not empty service.name ? service.name : 'AC Repair'}"/></h4>
                <div class="service-price-text">Price: ₹499<c:out value="${not empty service.price ? service.price : '499'}"/></div>
                <div class="service-id-text">Service ID:SV1001 <c:out value="${not empty service.id ? service.id : 'SV1001'}"/></div>
                
                <h5 class="section-heading-small">Description</h5>
                <p class="service-description-body">
                    An AC repair service restores a cooling system to peak efficiency by diagnosing, cleaning, and fixing components. This includes cleaning filters, checking gas levels, and replacing broken parts.
                </p>
            </div>

            <!-- 3. Right Panel: Booking Form -->
            <div class="card">
                <h3 class="card-title">Booking Information</h3>
                
                <form action="${pageContext.request.contextPath}/bookService" method="POST">
                    
                    <!-- Servlet hidden -->
                    <input type="hidden" name="serviceId" value="${not empty service.id ? service.id : '1001'}" />
                    <input type="hidden" name="serviceName" value="${not empty service.name ? service.name : 'AC Repair'}" />
                    <input type="hidden" name="amount" value="${not empty service.price ? service.price : '499'}" />

                    <!-- Date Field -->
                    <div class="form-group">
                        <label for="bookingDate">Select Date</label>
                        <input type="date" id="bookingDate" name="bookingDate" required />
                    </div>

                    <!-- Time Slot Dropdown -->
                    <div class="form-group">
                        <label for="timeSlot">Select Time Slot</label>
                        <select id="timeSlot" name="timeSlot" required>
                            <option value="10:00 AM - 12:00 PM">10:00 AM - 12:00 PM</option>
                            <option value="12:00 PM - 02:00 PM">12:00 PM - 02:00 PM</option>
                            <option value="02:00 PM - 04:00 PM">02:00 PM - 04:00 PM</option>
                            <option value="04:00 PM - 06:00 PM">04:00 PM - 06:00 PM</option>
                        </select>
                    </div>

                    <!-- Address Textarea -->
                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3" placeholder="Enter your complete address" required></textarea>
                    </div>

                    <!-- Notes Textarea -->
                    <div class="form-group">
                        <label for="notes">Additional Notes (Optional)</label>
                        <textarea id="notes" name="notes" rows="2" placeholder="Enter any special instructions"></textarea>
                    </div>

                    <!-- Button Trigger -->
                    <button type="submit" class="btn-submit-booking">Confirm Booking</button>
                </form>
            </div>

        </div>
    </div>

    <script>
        (function() {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById('bookingDate').setAttribute('min', today);
        })();
    </script>
</body>
</html>
