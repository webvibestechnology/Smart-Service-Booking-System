<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        /* Fixed Footer sathi Wrapper */
        .content-wrapper {
            flex: 1;
        }
        /* Top Navigation Navbar Fixes */
        .navbar-top {
            background-color: #0b1c3f;
            color: white;
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
        .user-profile-top img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            object-fit: cover;
        }
        /* Sidebar Navigation */
        .sidebar {
            background-color: white;
            min-height: calc(100vh - 60px);
            box-shadow: 2px 0 5px rgba(0,0,0,0.05);
            padding-top: 20px;
        }
        .sidebar .nav-link {
            color: #64748b;
            font-weight: 500;
            padding: 12px 20px;
            border-radius: 0px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-left: 4px solid transparent;
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
        /* Badges for Status */
        .badge-pending { background-color: #fef3c7; color: #d97706; }
        .badge-completed { background-color: #dcfce7; color: #15803d; }
        .badge-cancelled { background-color: #fee2e2; color: #b91c1c; }

        /* Footer Styling */
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
        <!-- 1.Header Bar -->
        <header class="navbar navbar-top sticky-top flex-md-nowrap p-0 shadow-sm">
            <div class="container-fluid px-4 d-flex justify-content-between align-items-center" style="height: 60px;">
                <div class="logo-section">
                    <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
                    <div class="logo-text">
                        <h2>Smart Service</h2>
                        <p>Booking System</p>
                    </div>
                </div>
                
                <div class="d-flex align-items-center gap-3">
                    
                    
                </div>
            </div>
        </header>

        <div class="container-fluid">
            <div class="row">
                
               

                <!-- 3. Main Dashboard Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
                    
                    <!-- Stat Cards Row -->
                    <div class="row g-3 mb-4">
                        <!-- Total Bookings -->
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="stat-card shadow-sm">
                                <div class="stat-icon-wrapper" style="background-color: #eff6ff; color: #2563eb;">
                                    <i class="fa-solid fa-list-check"></i>
                                </div>
                                <div>
                                    <div class="stat-label">Total Bookings</div>
                                    <div class="stat-value">12</div>
                                </div>
                            </div>
                        </div>

                        <!-- Completed -->
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="stat-card shadow-sm">
                                <div class="stat-icon-wrapper" style="background-color: #dcfce7; color: #16a34a;">
                                    <i class="fa-solid fa-circle-check"></i>
                                </div>
                                <div>
                                    <div class="stat-label">Completed</div>
                                    <div class="stat-value">6</div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending -->
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="stat-card shadow-sm">
                                <div class="stat-icon-wrapper" style="background-color: #fef3c7; color: #d97706;">
                                    <i class="fa-solid fa-clock"></i>
                                </div>
                                <div>
                                    <div class="stat-label">Pending</div>
                                    <div class="stat-value">5</div>
                                </div>
                            </div>
                        </div>

                        <!-- Cancelled -->
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="stat-card shadow-sm">
                                <div class="stat-icon-wrapper" style="background-color: #fee2e2; color: #dc2626;">
                                    <i class="fa-solid fa-circle-xmark"></i>
                                </div>
                                <div>
                                    <div class="stat-label">Cancelled</div>
                                    <div class="stat-value">1</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 4. Recent Bookings Table -->
                    <div class="table-container shadow-sm mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0 text-dark" style="font-weight: 600;">Recent Bookings</h5>
                            <a href="#" class="text-primary text-decoration-none fw-semibold" style="font-size: 14px;">View All</a>
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
                                    <tr>
                                        <td class="fw-semibold">#101</td>
                                        <td>AC Repair</td>
                                        <td>20 May 2024</td>
                                        <td><span class="badge badge-pending px-2.5 py-1.5 rounded">Pending</span></td>
                                        <td><a href="#" class="btn btn-sm btn-outline-primary px-3">View</a></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-semibold">#102</td>
                                        <td>Plumbing</td>
                                        <td>18 May 2024</td>
                                        <td><span class="badge badge-completed px-2.5 py-1.5 rounded">Completed</span></td>
                                        <td><a href="#" class="btn btn-sm btn-outline-primary px-3">View</a></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-semibold">#103</td>
                                        <td>Electrician</td>
                                        <td>15 May 2024</td>
                                        <td><span class="badge badge-pending px-2.5 py-1.5 rounded">Pending</span></td>
                                        <td><a href="#" class="btn btn-sm btn-outline-primary px-3">View</a></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-semibold">#104</td>
                                        <td>Cleaning</td>
                                        <td>10 May 2024</td>
                                        <td><span class="badge badge-cancelled px-2.5 py-1.5 rounded">Cancelled</span></td>
                                        <td><a href="#" class="btn btn-sm btn-outline-primary px-3">View</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </main>
            </div>
        </div>
    </div>

    <!-- 5. Added Clean Footer -->
    <footer class="mt-auto">
        <div class="container-fluid px-4">
            <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center gap-2">
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