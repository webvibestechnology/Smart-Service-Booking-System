<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


<style>

.provider-sidebar{

    width:260px;
    height:100%;

    background:linear-gradient(180deg,#0f172a,#020617);

    display:flex;
    flex-direction:column;
    justify-content:space-between;

    padding:18px 12px;

    overflow:hidden;

    font-family:'Segoe UI',sans-serif;

}



/* Title */

.sidebar-title{

    color:white;

    text-align:center;

    font-size:20px;

    font-weight:700;

    padding:15px 0 25px;

    border-bottom:1px solid rgba(255,255,255,.15);

}


.sidebar-title i{

    color:#38bdf8;

    margin-right:8px;

}



/* Menu */

.top-menu{

    margin-top:20px;

}


.provider-sidebar a{

    display:flex;

    align-items:center;

    gap:15px;

    padding:13px 15px;

    margin:8px 0;

    color:#cbd5e1;

    text-decoration:none;

    border-radius:12px;

    font-size:15px;

    font-weight:500;

    transition:.3s;

}



/* Icon box */

.provider-sidebar a i{

    width:35px;

    height:35px;

    display:flex;

    align-items:center;

    justify-content:center;

    background:rgba(255,255,255,.08);

    border-radius:10px;

}



/* Hover */

.provider-sidebar a:hover{

    background:rgba(56,189,248,.15);

    color:#38bdf8;

    transform:translateX(5px);

}


.provider-sidebar a:hover i{

    background:#38bdf8;

    color:#0f172a;

}



/* Active */

.provider-sidebar a.active{

    background:linear-gradient(90deg,#2563eb,#06b6d4);

    color:white;

    box-shadow:0 5px 15px rgba(37,99,235,.4);

}


.provider-sidebar a.active i{

    background:white;

    color:#2563eb;

}



/* Logout */

.bottom-menu{

    border-top:1px solid rgba(255,255,255,.15);

    padding-top:15px;

}


.logout{

    color:#fb7185 !important;

}


.logout:hover{

    background:#dc2626 !important;

    color:white !important;

}



/* No scrollbar */

.provider-sidebar::-webkit-scrollbar{

    display:none;

}

</style>



<div class="provider-sidebar">


<div>


<div class="sidebar-title">

<i class="fa-solid fa-bolt"></i>

Provider Panel

</div>



<div class="top-menu">


<a href="providerDashboard.jsp" class="active">

<i class="fa-solid fa-house"></i>

Dashboard

</a>


<a href="manageBookings.jsp">

<i class="fa-solid fa-calendar-check"></i>

Manage Bookings

</a>


<a href="manageService.jsp">

<i class="fa-solid fa-screwdriver-wrench"></i>

Manage Service

</a>


</div>


</div>



<div class="bottom-menu">


<a href="../index.jsp" class="logout">

<i class="fa-solid fa-right-from-bracket"></i>

Logout

</a>


</div>


</div>