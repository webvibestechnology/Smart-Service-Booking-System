<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Smart Service Booking System</title>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    
    <style>
        html { scroll-behavior: smooth; }
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; }
        body { background-color: #f8fafc; color: #1e293b; line-height: 1.5; min-height: 100vh; display: flex; flex-direction: column; }

        /* NAVBAR */
        .navbar { background-color: #0f172a; color: white; padding: 16px 60px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 10px 15px -3px rgba(15, 23, 42, 0.08); position: sticky; top: 0; z-index: 1000; border-bottom: 1px solid rgba(255, 255, 255, 0.05); }
        .brand-section { display: flex; align-items: center; gap: 14px; }
        .logo-icon { background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%); color: white; width: 44px; height: 44px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 22px; box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25); }
        .brand-name { font-size: 19px; font-weight: 700; color: white; }
        .brand-sub { font-size: 11px; color: #38bdf8; font-weight: 600; letter-spacing: 1px; }
        
        .nav-links { display: flex; gap: 36px; align-items: center; list-style: none; }
        .nav-links a { color: #94a3b8; text-decoration: none; font-size: 15px; font-weight: 500; transition: all 0.2s ease; position: relative; }
        .nav-links a:hover { color: #ffffff; }
        .nav-links a::after { content: ''; position: absolute; width: 0; height: 2px; bottom: -6px; left: 0; background-color: #3b82f6; transition: width 0.2s ease; }
        .nav-links a:hover::after { width: 100%; }

        /* Clickable Admin Profile Button */
        .admin-profile-btn { display: flex; align-items: center; gap: 12px; background: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.12); padding: 6px 14px; border-radius: 30px; color: white; font-weight: 600; font-size: 14px; text-decoration: none; transition: all 0.2s ease; cursor: pointer; }
        .admin-profile-btn:hover { background: rgba(255, 255, 255, 0.15); border-color: #3b82f6; }
        .admin-profile-btn img { width: 34px; height: 34px; border-radius: 50%; object-fit: cover; border: 2px solid #3b82f6; }

        /* MAIN LAYOUT */
        .main-container { display: flex; flex: 1; width: 100%; }
        
        /* Sidebar */
        .sidebar { width: 260px; min-width: 260px; background: white; border-right: 1px solid #e2e8f0; padding: 30px 20px; display: flex; flex-direction: column; gap: 10px; }
        .sidebar a { display: flex; align-items: center; gap: 14px; padding: 12px 16px; color: #64748b; text-decoration: none; font-size: 15px; font-weight: 600; border-radius: 10px; transition: all 0.2s ease; }
        .sidebar a:hover, .sidebar a.active { background-color: #eff6ff; color: #2563eb; }
        .sidebar a i { font-size: 18px; }

        /* CONTENT AREA - Properly Centered */
        .content-area { flex: 1; padding: 40px; background-color: #f8fafc; display: flex; justify-content: center; align-items: flex-start; }
        .content-wrapper { width: 100%; max-width: 1100px; display: flex; flex-direction: column; align-items: center; }
        
        /* Top Bar for Total Users & Wide Search Bar side by side layout */
        .top-action-bar { display: flex; justify-content: space-between; align-items: center; width: 100%; margin-bottom: 25px; gap: 20px; flex-wrap: wrap; }

        /* TOTAL USERS CARD */
        .stat-card { background: white; padding: 14px 22px; border-radius: 12px; border: 1px solid #e2e8f0; display: inline-flex; align-items: center; gap: 16px; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .stat-icon { background-color: #eff6ff; color: #2563eb; width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 16px; }
        .stat-info h3 { font-size: 11px; color: #64748b; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; }
        .stat-info p { font-size: 18px; color: #0f172a; font-weight: 700; margin-top: 1px; }

        /* LARGER SEARCH BAR */
        .search-box { display: flex; background: white; padding: 10px 16px; border-radius: 12px; width: 100%; max-width: 450px; border: 1px solid #cbd5e1; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .search-box input { flex: 1; border: none; padding: 4px; outline: none; font-size: 14px; color: #0f172a; background: transparent; }
        .search-box i { color: #94a3b8; align-self: center; padding-right: 10px; font-size: 16px; }

        /* TABLE DESIGN - Centered & Clean */
        .table-card { background: white; border-radius: 16px; border: 1px solid #e2e8f0; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.02); width: 100%; }
        table { width: 100%; border-collapse: collapse; text-align: left; }
        th { background-color: #f8fafc; color: #475569; font-size: 13px; font-weight: 700; text-transform: uppercase; padding: 16px 24px; border-bottom: 1px solid #e2e8f0; letter-spacing: 0.5px; }
        td { padding: 16px 24px; color: #334155; font-size: 14px; border-bottom: 1px solid #f1f5f9; }
        tr:last-child td { border-bottom: none; }
        tr:hover { background-color: #f8fafc; }

        /* HIGHLIGHT CLASS FOR SEARCH & SCROLL */
        .highlight-row { background-color: #eff6ff !important; outline: 2px solid #3b82f6; }

        /* ROLE BADGE */
        .role-badge { background-color: #f1f5f9; color: #475569; padding: 4px 10px; border-radius: 6px; font-size: 12px; font-weight: 600; text-transform: uppercase; }

        /* VIEW BUTTON */
        .view-btn { background-color: #3b82f6; color: white; padding: 6px 18px; border-radius: 6px; text-decoration: none; font-size: 13px; font-weight: 600; transition: background 0.2s; display: inline-block; box-shadow: 0 2px 4px rgba(59, 130, 246, 0.2); }
        .view-btn:hover { background-color: #2563eb; }

        /* FOOTER */
        footer { background: #020617; color: white; text-align: center; padding: 20px; font-size: 14px; }
    </style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <div class="brand-section">
            <div class="logo-icon">
                <i class="fa-solid fa-bolt-lightning"></i>
            </div>
            <div>
                <div class="brand-name">Smart Service</div>
                <div class="brand-sub">BOOKING SYSTEM</div>
            </div>
        </div>

        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/index.jsp#home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp#services">Services</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp#about">About Us</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Contact Us</a></li>
        </ul>

        <!-- Clickable Admin Profile Link/Button -->
        <a href="${pageContext.request.contextPath}/pages/adminDashboard.jsp" class="admin-profile-btn">
            <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=100&q=80" alt="Admin">
            <span>Admin</span>
        </a>
    </nav>

    <!-- MAIN BODY CONTAINER -->
    <div class="main-container">
        
        <!-- SIDEBAR -->
        <aside class="sidebar">
            <jsp:include page="adminSidebar.jsp" />
        </aside>

        <!-- CONTENT SECTION -->
        <main class="content-area">
            <div class="content-wrapper">
                
                <!-- Top Action Bar (Total Users & Larger Search Bar) -->
                <div class="top-action-bar">
                    <!-- Total Users Card -->
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fa-solid fa-users"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Total Users</h3>
                            <p>${not empty userList ? userList.size() : '0'}</p>
                        </div>
                    </div>

                    <!-- Larger Search Bar -->
                    <div class="search-box">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <input type="text" id="userSearchInput" placeholder="Search by ID, email, name..." onkeyup="searchAndHighlightTable()">
                    </div>
                </div>

                <!-- Users Table Card (Centered & Clean) -->
                <div class="table-card">
                    <table id="userTable">
                        <thead>
                            <tr>
                                <th>User ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Role</th>
                                <th>Joined Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Iterating over actual database records fetched by servlet -->
                            <c:forEach var="user" items="${userList}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.fullName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.mobile}</td>
                                    <td>
                                        <c:if test="${not empty user.role}">
                                            <span class="role-badge">${user.role}</span>
                                        </c:if>
                                    </td>
                                    <td>${user.createdAt}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/pages/adminSidebar.jsp?id=${user.id}" class="view-btn">View</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            
                            <!-- Message if no records found -->
                            <c:if test="${empty userList}">
                                <tr>
                                    <td colspan="7" style="text-align: center; color: #94a3b8; padding: 30px;">No users found in database.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>

    <!-- FOOTER -->
    <footer>
        © 2026 Smart Service Booking System | All Rights Reserved.
    </footer>

    <script>
        function searchAndHighlightTable() {
            let input = document.getElementById("userSearchInput").value.trim().toLowerCase();
            let rows = document.querySelectorAll("#userTable tbody tr");
            
            rows.forEach(row => row.classList.remove("highlight-row"));

            if (input === "") {
                rows.forEach(row => row.style.display = "");
                return;
            }

            let firstMatch = null;

            rows.forEach(row => {
                let text = row.innerText.toLowerCase();
                if (text.includes(input)) {
                    row.style.display = "";
                    row.classList.add("highlight-row");
                    if (!firstMatch) {
                        firstMatch = row;
                    }
                } else {
                    row.style.display = "none";
                }
            });

            if (firstMatch) {
                firstMatch.scrollIntoView({
                    behavior: "smooth",
                    block: "center"
                });
            }
        }
    </script>
</body>
</html>