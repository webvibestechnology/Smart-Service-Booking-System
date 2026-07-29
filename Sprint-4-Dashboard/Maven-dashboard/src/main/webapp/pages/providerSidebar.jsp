<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

.provider-sidebar{
    width:260px;
    min-height:calc(100vh - 80px);
    background:#0f172a;
    color:white;
    display:flex;
    flex-direction:column;
}

.sidebar-header{
    padding:20px;
    border-bottom:1px solid #1e293b;
}

.sidebar-header h3{
    font-size:22px;
    margin:0;
    color:#38bdf8;
}

.sidebar-header p{
    font-size:12px;
    color:#94a3b8;
    margin-top:5px;
}

.menu{
    flex:1;
    padding-top:15px;
}

.menu-title{
    color:#94a3b8;
    font-size:12px;
    padding:0 20px 10px;
    text-transform:uppercase;
}

.menu a{
    display:block;
    text-decoration:none;
    color:white;
    padding:15px 20px;
    font-size:15px;
    transition:.3s;
}

.menu a i{
    width:22px;
}

.menu a:hover{
    background:#1e293b;
}

.menu a.active{
    background:#2563eb;
}

.logout{
    border-top:1px solid #1e293b;
}

.logout a{
    display:block;
    color:#ff6b6b;
    text-decoration:none;
    padding:18px 20px;
    font-size:15px;
}

.logout a:hover{
    background:#1e293b;
}

</style>

<div class="provider-sidebar">

    <div class="sidebar-header">
        <h3>Smart Service</h3>
        <p>Provider Panel</p>
    </div>

    <div class="menu">

        <div class="menu-title">Links</div>

        <a href="providerDashboard.jsp" class="active">
            <i class="fa-solid fa-house"></i>
            Dashboard
        </a>

        <a href="manageServices.jsp">
            <i class="fa-solid fa-screwdriver-wrench"></i>
            Services
        </a>

        <a href="manageBookings.jsp">
            <i class="fa-solid fa-calendar-check"></i>
            Manage Bookings
        </a>

        <a href="changePassword.jsp">
            <i class="fa-solid fa-key"></i>
            Change Password
        </a>

    </div>

    <div class="logout">
        <a href="../index.jsp">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>
    </div>

</div>