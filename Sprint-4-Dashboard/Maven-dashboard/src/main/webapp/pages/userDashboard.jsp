<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


<style>

.user-sidebar{

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


.user-sidebar a{

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



/* Icon */

.user-sidebar a i{

    width:35px;

    height:35px;

    display:flex;

    align-items:center;

    justify-content:center;

    background:rgba(255,255,255,.08);

    border-radius:10px;

}



/* Hover */

.user-sidebar a:hover{

    background:rgba(56,189,248,.15);

    color:#38bdf8;

    transform:translateX(5px);

}


.user-sidebar a:hover i{

    background:#38bdf8;

    color:#0f172a;

}



/* Active */

.user-sidebar a.active{

    background:linear-gradient(90deg,#2563eb,#06b6d4);

    color:white;

    box-shadow:0 5px 15px rgba(37,99,235,.4);

}


.user-sidebar a.active i{

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



.user-sidebar::-webkit-scrollbar{

    display:none;

}

</style>



<div class="user-sidebar">


<div>


<div class="sidebar-title">

<i class="fa-solid fa-user"></i>

User Panel

</div>



<div class="top-menu">


<a href="userDashboard.jsp" class="active">

<i class="fa-solid fa-house"></i>

Dashboard

</a>



<a href="myBooking.jsp">

<i class="fa-solid fa-calendar-check"></i>

My Booking

</a>



<a href="serviceDetails.jsp">

<i class="fa-solid fa-list"></i>

Services

</a>



<a href="changePassword.jsp">

<i class="fa-solid fa-key"></i>

Change Password

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