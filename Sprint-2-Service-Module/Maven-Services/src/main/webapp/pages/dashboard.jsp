<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Authentication Module Guard: Redirect to login if session is invalid
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Dashboard</title>
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://jsdelivr.net" rel="stylesheet">
    <link rel="stylesheet" href="css_styles.css">
</head>
<body class="bg-light">

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Main Content Container -->
    <main class="container my-5">
        <header class="row mb-4">
            <div class="col">
                <h1 class="h2 text-secondary">Service Management Dashboard</h1>
                <p class="text-muted">Overview of system utilities and active offerings.</p>
            </div>
        </header>

        <!-- Quick Summary Cards -->
        <section class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h5 class="card-title text-muted text-uppercase small">Total Services</h5>
                            <h2 class="display-6 fw-bold my-2 text-primary">12</h2>
                        </div>
                        <a href="view-services.jsp" class="btn btn-sm btn-link p-0 text-start">Manage services →</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h5 class="card-title text-muted text-uppercase small">System Status</h5>
                            <h2 class="display-6 fw-bold my-2 text-success">Active</h2>
                        </div>
                        <span class="text-muted small">All systems operational</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h5 class="card-title text-muted text-uppercase small">Quick Actions</h5>
                            <p class="text-muted small">Deploy a brand new catalog feature instantly.</p>
                        </div>
                        <a href="add-service.jsp" class="btn btn-primary btn-sm w-100">Create New Service</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Recent Activity Table Section -->
        <section class="row">
            <div class="col-12">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white py-3 border-0">
                        <h5 class="mb-0 text-secondary">Recent System Changes</h5>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>Service ID</th>
                                    <th>Service Name</th>
                                    <th>Category</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#SRV-092</td>
                                    <td class="fw-semibold">Cloud Migration Setup</td>
                                    <td>Infrastructure</td>
                                    <td><span class="badge bg-success-subtle text-success border border-success-subtle">Live</span></td>
                                </tr>
                                <tr>
                                    <td>#SRV-087</td>
                                    <td class="fw-semibold">Database Optimization</td>
                                    <td>Maintenance</td>
                                    <td><span class="badge bg-warning-subtle text-warning border border-warning-subtle">Pending Review</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Bootstrap Bundle with Popper JS CDN -->
    <script src="https://jsdelivr.net"></script>
</body>
</html>
