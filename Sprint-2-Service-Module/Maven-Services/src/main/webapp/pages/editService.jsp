<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Services (Admin) - Screen 10 As It Is</title>
    <style>
        /* Exact layout styling based on Swati's Presentation */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background-color: #f4f7f6;
            color: #333;
            padding-bottom: 40px;
        }

        /* Top Admin Panel Navbar Header */
        .navbar {
            background-color: #212529;
            color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            font-size: 20px;
            font-weight: bold;
        }
        .navbar-text {
            color: #ccc;
            font-size: 14px;
        }

        /* Main Center Card Grid Setup */
        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .main-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #f1f1f1;
            padding-bottom: 15px;
        }
        .card-title h3 {
            font-size: 24px;
            color: #222;
            margin-bottom: 5px;
        }
        .card-title p {
            font-size: 14px;
            color: #777;
        }

        /* Clickable Add New Service Trigger Link button */
        .btn-add {
            background-color: #0d6efd;
            color: white;
            text-decoration: none;
            padding: 12px 24px;
            font-weight: 600;
            font-size: 14px;
            border-radius: 6px;
            transition: background 0.2s;
            display: inline-block;
            border: none;
            cursor: pointer;
        }
        .btn-add:hover {
            background-color: #0b5ed7;
        }

        /* Table Data Grid CSS */
        .table-responsive {
            width: 100%;
            overflow-x: auto;
        }
        .custom-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }
        .custom-table th {
            background-color: #f8f9fa;
            color: #495057;
            font-weight: 600;
            padding: 15px;
            border-bottom: 2px solid #dee2e6;
            font-size: 15px;
        }
        .custom-table td {
            padding: 15px;
            border-bottom: 1px solid #dee2e6;
            vertical-align: middle;
            font-size: 15px;
        }
        .custom-table tr:hover {
            background-color: #f8f9fa;
        }

        /* Table Content Elements Layout */
        .text-id {
            color: #6c757d;
            font-weight: bold;
        }
        .service-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #ddd;
            display: block;
        }
        .service-name {
            font-weight: bold;
            color: #212529;
        }
        .text-price {
            font-weight: bold;
            color: #0d6efd;
            font-size: 16px;
        }

        /* Clickable Action Link Buttons Utilities */
        .action-cell {
            text-align: center;
        }
        .btn-action {
            padding: 8px 18px;
            font-size: 13px;
            font-weight: 500;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-block;
            border: 1px solid transparent;
        }
        .btn-edit {
            background-color: transparent;
            color: #212529;
            border-color: #212529;
            margin-right: 8px;
        }
        .btn-edit:hover {
            background-color: #212529;
            color: #fff;
        }
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
        }
        .btn-delete:hover {
            background-color: #bb2d3b;
        }
    </style>
</head>
<body>

    <!-- Header Navigation Section -->
    <nav class="navbar">
        <div class="navbar-brand">⚙️ Admin Dashboard</div>
        <div class="navbar-text">Smart Service Booking System</div>
    </nav>

    <!-- Main Dynamic Layout Box -->
    <div class="container">
        <div class="main-card">
            
            <!-- Card Header Area with Add Service Action Link -->
            <div class="card-header">
                <div class="card-title">
                    <h3>Manage Services</h3>
                    <p>Screen 10 Tabular Grid View - Actions mapped directly to Java Servlets.</p>
                </div>
                <!-- 100% CLICKABLE ADD BUTTON: Links to editService.jsp page -->
                <a href="addService.jsp" class="btn-add">+ Add New Service</a>
            </div>

            <!-- 5 Dynamic Rows Data Grid Layout -->
            <div class="table-responsive">
                <table class="custom-table">
                    <thead>
                        <tr>
                            <th style="width: 10%;">ID</th>
                            <th style="width: 15%;">Real Image</th>
                            <th style="width: 35%;">Service Name</th>
                            <th style="width: 20%;">Price</th>
                            <th style="width: 20%; text-align: center;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <!-- Row 1: AC Repair -->
                        <tr>
                            <td class="text-id">#101</td>
                            <td><img src="https://vecteezy.com" alt="AC Repair" class="service-img"></td>
                            <td class="service-name">AC Repair & Maintenance</td>
                            <td class="text-price">₹499</td>
                            <td class="action-cell">
                                <!-- CLICKABLE EDIT: Redirects to your editService.jsp form for data processing -->
                                <a href="editService.jsp?id=101" class="btn-action btn-edit">Edit</a>
                                <!-- CLICKABLE DELETE: Straight clean link mapping to Delete Servlet -->
                                <a href="DeleteServiceServlet?id=101" class="btn-action btn-delete">Delete</a>
                            </td>
                        </tr>

                        <!-- Row 2: Laptop Repair -->
                        <tr>
                            <td class="text-id">#102</td>
                            <td><img src="https://vecteezy.com" alt="Laptop Repair" class="service-img"></td>
                            <td class="service-name">Laptop OS & Software Fix</td>
                            <td class="text-price">₹799</td>
                            <td class="action-cell">
                                <a href="editService.jsp?id=102" class="btn-action btn-edit">Edit</a>
                                <a href="DeleteServiceServlet?id=102" class="btn-action btn-delete">Delete</a>
                            </td>
                        </tr>

                        <!-- Row 3: Home Painting -->
                        <tr>
                            <td class="text-id">#103</td>
                            <td><img src="https://vecteezy.com" alt="Home Painting" class="service-img"></td>
                            <td class="service-name">Premium Home Wall Painting</td>
                            <td class="text-price">₹2,499</td>
                            <td class="action-cell">
                                <a href="editService.jsp?id=103" class="btn-action btn-edit">Edit</a>
                                <a href="DeleteServiceServlet?id=103" class="btn-action btn-delete">Delete</a>
                            </td>
                        </tr>

                        <!-- Row 4: Sofa Cleaning -->
                        <tr>
                            <td class="text-id">#104</td>
                            <td><img src="https://vecteezycom" alt="Sofa Cleaning" class="service-img"></td>
                            <td class="service-name">Sofa & Carpet Vacuum Cleaning</td>
                            <td class="text-price">₹599</td>
                            <td class="action-cell">
                                <a href="editService.jsp?id=104" class="btn-action btn-edit">Edit</a>
                                <a href="DeleteServiceServlet?id=104" class="btn-action btn-delete">Delete</a>
                            </td>
                        </tr>

                        <!-- Row 5: Plumbing Services -->
                        <tr>
                            <td class="text-id">#105</td>
                            <td><img src="https://vecteezy.com" alt="Plumbing Services" class="service-img"></td>
                            <td class="service-name">Emergency Pipe Leakage Repair</td>
                            <td class="text-price">₹299</td>
                             <td class="action-cell">
                                <a href="editService.jsp?id=104" class="btn-action btn-edit">Edit</a>
                                <a href="DeleteServiceServlet?id=104" class="btn-action btn-delete">Delete</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

