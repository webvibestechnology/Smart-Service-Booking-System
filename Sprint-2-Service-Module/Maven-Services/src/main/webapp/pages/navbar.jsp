<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="dashboard.jsp">🔧 ServicePortal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="dashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add-service.jsp">Add Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view-services.jsp">View Services</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <!-- Auth Module Integration Check -->
                <span class="navbar-text me-3 text-light">
                    Welcome, <strong>${sessionScope.user.name != null ? sessionScope.user.name : 'User'}</strong>
                </span>
                <a class="btn btn-outline-danger btn-sm" href="logout">Logout</a>
            </div>
        </div>
    </div>
</nav>
