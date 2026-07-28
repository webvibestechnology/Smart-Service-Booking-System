<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="mr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Service - User Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #edf6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .content-wrapper {
            flex: 1;
        }
        .navbar-top {
            background-color: #0b1c3f;
            padding: 10px 24px;
        }
        .logo-section {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .logo-icon {
            background-color: #2563eb;
            color: white;
            width: 35px;
            height: 35px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }
        .logo-text h2 {
            font-size: 18px;
            font-weight: 700;
            margin: 0;
            color: white;
            line-height: 1.2;
        }
        .logo-text p {
            font-size: 11px;
            margin: 0;
            color: #3b82f6;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        /* Nav Links Custom Styling */
        .navbar-dark .navbar-nav .nav-link {
            color: #cbd5e1;
            font-weight: 500;
            padding: 8px 16px;
            transition: color 0.3s ease;
        }
        .navbar-dark .navbar-nav .nav-link:hover {
            color: #3b82f6;
        }
        
        /* Profile Dropdown Custom Styling */
        .profile-dropdown .dropdown-toggle {
            background-color: rgba(255, 255, 255, 0.1);
            color: white !important;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 6px 14px;
            border-radius: 50px;
        }
        .profile-dropdown .dropdown-toggle:hover {
            background-color: #2563eb;
            border-color: #2563eb;
        }
        .profile-dropdown .dropdown-menu {
            border: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 8px;
            min-width: 200px;
        }

        /* Sidebar Navigation */
        .sidebar {
            background-color: white;
            min-height: calc(100vh - 70px);
            box-shadow: 2px 0 5px rgba(0,0,0,0.05);
            padding-top: 20px;
        }
        .sidebar .nav-link {
            color: #64748b;
            font-weight: 500;
            padding: 12px 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-left: 4px solid transparent;
            text-decoration: none;
        }
        .sidebar .nav-link:hover {
            background-color: #f1f5f9;
            color: #0f172a;
        }
        .sidebar .nav-link.active {
            background-color: #eff6ff;
            color: #2563eb;
            border-left: 4px solid #2563eb;
            font-weight: 600;
        }

        /* Stats Dashboard Cards */
        .stat-card {
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            background: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .stat-icon-wrapper {
            width: 45px;
            height: 45px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .stat-label {
            font-size: 12px;
            color: #22262b;
            text-transform: uppercase;
            font-weight: 600;
            margin-bottom: 2px;
        }
        .stat-value {
            font-size: 22px;
            font-weight: 700;
            color: #1e293b;
            line-height: 1;
        }

        /* Custom Table Styling */
        .table-container {
            background: white;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            padding: 20px;
        }
        .table th {
            color: #0d0e0e;
            font-weight: 600;
            font-size: 14px;
            background-color: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            padding: 12px;
        }
        .table td {
            padding: 14px 12px;
            color: #52657f;
            font-size: 14px;
            vertical-align: middle;
        }
        
        /* Dynamic Status Badges */
        .badge-pending { background-color: #fef3c7; color: #d97706; }
        .badge-completed { background-color: #dcfce7; color: #15803d; }
        .badge-cancelled { background-color: #fee2e2; color: #b91c1c; }

        footer {
            background-color: #0b1c3f;
            color: #94a3b8;
            font-size: 14px;
            padding: 15px 0;
            border-top: 1px solid rgba(255,255,255,0.1);
        }
    </style>
</head>
<body>

    <div class="content-wrapper">
        <!-- Header Bar with Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark navbar-top sticky-top shadow-sm">
            <div class="container-fluid px-4">
                <a class="navbar-brand logo-section" href="dashboard">
                    <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
                    <div class="logo-text">
                        <h2>Smart Service</h2>
                        <p>Booking System</p>
                    </div>
                </a>
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav align-items-lg-center gap-2 my-2 my-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="home"></i> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="services"></i> Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about"></i> About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact"></i> Contact Us</a>
                        </li>
                        
                        <!-- Contact Us Profile Dropdown -->
                        <li class="nav-item dropdown profile-dropdown ms-lg-2">
                            <a class="nav-link dropdown-toggle d-flex align-items-center gap-2" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-circle-user fs-5"></i> Profile
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                                <li><h6 class="dropdown-header">Welcome, User</h6></li>
                                <li><hr class="dropdown-divider"></li>
                                <!-- dashboard joind the link-->
                                <li><a class="dropdown-menu-item dropdown-item" href="admin/dashboard"><i class="fa-solid fa-gauge-high me-2 text-primary"></i> Admin Dashboard</a></li>
                                <li><a class="dropdown-menu-item dropdown-item" href="Provider/dashboard"><i class="fa-solid fa-shop me-2 text-success"></i> Provider Dashboard</a></li>
                                <li><a class="dropdown-menu-item dropdown-item" href="user/dSashboard"><i class="fa-solid fa-user me-2 text-secondary"></i> User Dashboard</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="logout"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                
               

                <!-- Main Dashboard Content Area -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
                    
                    <!-- Dynamic Stats Row -->
                    <div class="row g-3 mb-4">
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="stat-card shadow-sm">
                                <div class="stat-icon-wrapper" style="background-color: #eff6ff; color: #2563eb;">
                                    <i class="fa-solid fa-list-check"></i>
                                </div>
                                <div>
                                    <div class="stat-label">Total Bookings</div>
                                    <div class="stat-value"><c:out value="${not empty totalBookings ? totalBookings : '0'}" /></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="stat-card shadow-sm">
                                <div class="stat-icon-wrapper" style="background-color: #dcfce7; color: #16a34a;">
                                    <i class="fa-solid fa-circle-check"></i>
                                </div>
                                <div>
                                    <div class="stat-label">Completed</div>
                                    <div class="stat-value"><c:out value="${not empty completedBookings ? completedBookings : '0'}" /></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="stat-card shadow-sm">
                                <div class="stat-icon-wrapper" style="background-color: #fef3c7; color: #d97706;">
                                    <i class="fa-solid fa-clock"></i>
                                </div>
                                <div>
                                    <div class="stat-label">Pending</div>
                                    <div class="stat-value"><c:out value="${not empty pendingBookings ? pendingBookings : '0'}" /></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="stat-card shadow-sm">
                                <div class="stat-icon-wrapper" style="background-color: #fee2e2; color: #dc2626;">
                                    <i class="fa-solid fa-circle-xmark"></i>
                                </div>
                                <div>
                                    <div class="stat-label">Cancelled</div>
                                    <div class="stat-value"><c:out value="${not empty cancelledBookings ? cancelledBookings : '0'}" /></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Dynamic Bookings Table Container -->
                    <div class="table-container shadow-sm mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0 text-dark" style="font-weight: 600;">Recent Bookings</h5>
                            <a href="bookings" class="text-primary text-decoration-none fw-semibold" style="font-size: 14px;">View All</a>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table align-middle">
                                <thead>
                                    <tr>
                                        <th scope="col">Booking ID</th>
                                        <th scope="col">Service</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty bookingList}">
                                            <c:forEach var="booking" items="${bookingList}">
                                                <tr>
                                                    <td class="fw-semibold">#<c:out value="${booking.id}"/></td>
                                                    <td><c:out value="${booking.serviceName}"/></td>
                                                    <td><c:out value="${booking.date}"/></td>
                                                    <td>
                                                        <span class="badge px-3 py-1 rounded 
                                                            <c:choose>
                                                                <c:when test="${booking.status == 'Pending'}">badge-pending</c:when>
                                                                <c:when test="${booking.status == 'Completed'}">badge-completed</c:when>
                                                                <c:when test="${booking.status == 'Cancelled'}">badge-cancelled</c:when>
                                                                <c:otherwise>bg-secondary text-white</c:otherwise>
                                                            </c:choose>">
                                                            <c:out value="${booking.status}"/>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <a href="view-booking?id=${booking.id}" class="btn btn-sm btn-outline-primary px-3">View</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="text-center py-4 text-muted"></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </main>
            </div>
        </div>
    </div>

    <!-- Layout Footer -->
    <footer class="mt-auto">
        <div class="container-fluid px-4">
            <div class="d-flex flex-column justify-content-center align-items-center text-center gap-2">
                <div>
                    <span>&copy; 2026 Smart Service Booking System. All rights reserved.</span>
                </div>
                <div class="d-flex gap-3">
                    <a href="#" class="text-decoration-none text-muted">Privacy Policy</a>
                    <a href="#" class="text-decoration-none text-muted">Terms of Service</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap Bundle with Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>