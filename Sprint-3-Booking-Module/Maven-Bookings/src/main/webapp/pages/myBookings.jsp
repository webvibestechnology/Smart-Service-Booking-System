<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookings - Smart Service</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
   
<style>

body{
    background:#f4f7fb;
    font-family:'Segoe UI',sans-serif;
}
.navbar{
    background:#0f172a;
    padding:15px 60px;
    position:sticky;
    top:0;
    z-index:1000;
    box-shadow:0 4px 10px rgba(0,0,0,.2);
}
.navbar-toggler{
    border:1px solid white;
}

.brand{
    display:flex;
    align-items:center;
    color:white;
    text-decoration:none;
}
.logo{
    width:50px;
    height:50px;
    background:linear-gradient(135deg,#3b82f6,#2563eb);
    border-radius:12px;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:22px;
    color:white;
    margin-right:12px;
}
.brand h3{
    margin:0;
    font-size:26px;
}
.brand small{
    color:#38bdf8;
}
.navbar-nav .nav-link{
    color:#cbd5e1;
    margin:0 10px;
    font-size:16px;
}
.brand:hover{
    color:white;
}

.navbar-nav .nav-link:hover{
    color:white;
}


.admin{
    color:white;
    display:flex;
    align-items:center;
}

.admin img{
    width:40px;
    height:40px;
    border-radius:50%;
    margin-right:10px;
}


.main-card{

    background:#fff;
    border-radius:20px;
    padding:35px;
    margin-top:40px;
    border:none;
    box-shadow:0 10px 35px rgba(0,0,0,.08);
    transition:.3s;
}
.main-card:hover{

    transform:translateY(-4px);
}
.table{
    border-radius:12px;
    overflow:hidden;
}
.table thead th{
    background:#0f172a;
    color:white;
    border:none;
    padding:12px;
    text-align:center;
}

.table tbody td{
    padding:16px;
    vertical-align:middle;
}


.table tbody tr{

    transition:.25s;

}

.table tbody tr:hover{

    background:#f1f5f9;

    cursor:pointer;

}

.logo-section{
    display:flex;
    align-items:center;
    gap:15px;
}

.logo{
    width:55px;
    height:55px;
    object-fit:contain;
}

.logo-text h2{
    margin:0;
    color:white;
    font-size:24px;
}

.logo-text span{
    color:#ddd;
    font-size:13px;
    letter-spacing:1px;
}

nav{
    display:flex;
    gap:30px;
}

nav a{
    color:white;
    text-decoration:none;
    font-size:16px;
    transition:.3s;
}


nav a:hover{
    color:#ffd43b;
}

.profile{
    display:flex;
    align-items:center;
    gap:10px;
}

.profile-img{
    width:40px;
    height:40px;
    border-radius:50%;
    object-fit:cover;
}

.profile span{
    color:white;
    font-weight:bold;
}

.user{
    font-size:16px;
}
.container {
width:100%;
max-width:1600px;
}
table{
    width:100%;
    border-collapse:collapse;
    border:1px solid #e5e7eb;
    border-radius:12px;
    overflow:hidden;
}
th{
    background:#ffffff;
    color:#333;
    padding:18px;
    border-bottom:1px solid #ddd;
}

td{
    padding:18px;
    text-align:center;
    border-bottom:1px solid #eee;
}


.pending{
    background:#fff4d6;
    color:#d28b00;
    padding:6px 14px;
    border-radius:5px;
    font-weight:bold;
}

.completed{
    background:#dff7e6;
    color:green;
    padding:6px 14px;
    border-radius:5px;
    font-weight:bold;
}

.cancelled{
    background:#fde3e3;
    color:red;
    padding:6px 14px;
    border-radius:5px;
    font-weight:bold;
}

.viewBtn{
    padding:8px 18px;
    border:2px solid #4a7dff;
    background:white;
    color:#4a7dff;
    border-radius:6px;
    text-decoration:none;
    font-weight:bold;
}

.viewBtn:hover{
    background:#4a7dff;
    color:white;
}

.footer{
    margin-top:40px;
    background:#0f172a;
    color:white;
    padding:20px;
    text-align:center;
}
</style>

</head>


<body>
<div class="container">

<!-- Header -->
<nav class="navbar navbar-expand-lg">

    <div class="container-fluid">

        <!-- Logo -->
        <a class="brand text-decoration-none" href="dashboard.jsp">

            <div class="logo">
                <i class="fa-solid fa-bolt-lightning"></i>
            </div>

            <div class="ms-2">
                <h3 class="mb-0">Smart Service</h3>
                <small>BOOKING SYSTEM</small>
            </div>

        </a>

        <!-- Mobile Menu Button -->
        <button class="navbar-toggler bg-light"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#menu">

            <span class="navbar-toggler-icon"></span>

        </button>

        <!-- Navigation -->
        <div class="collapse navbar-collapse justify-content-center" id="menu">

            <ul class="navbar-nav">

                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="services.jsp">Services</a>
                </li>
                
                <li class="nav-item">
					<a class="nav-link" href="#">About</a>
				</li>

                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>

            </ul>

        </div>

</nav>


    <div class="main-card">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2 class="mb-1">My Bookings</h2>
        </div>

        <a href="services.jsp" class="btn btn-primary">
            <i class="fa-solid fa-plus"></i> Book Service
        </a>

    </div>

    <div class="table-responsive">

 <table class="table table-hover align-middle mb-0">

            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Service</th>
                    <th>Date</th>
                    <th>Time Slot</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>       

            <tbody>

                <tr>
                    <td>#101</td>
                    <td><i class="fa-solid fa-fan text-primary"></i> AC Repair</td>
                    <td>20 May 2026</td>
                    <td>10:00 AM - 12:00 PM</td>
                    <td>₹450</td>
                    <td><span class="badge bg-warning text-dark px-3 py-2"> Pending</span></td>
                    <td><a href="#" class="viewBtn">View</a></td>
                </tr>              
                <tr> 
                    <td>#102</td>
                    <td><i class="fa-solid fa-faucet-drip text-info"></i> Plumbing</td>
                    <td>18 May 2026</td> 
                    <td>02:00 PM - 04:00 PM</td> 
                    <td>₹290</td>
                    <td><span class="badge bg-success px-3 py-2">Completed</span></td>
                    <td><a href="#" class="viewBtn">View</a></td> 
                </tr> 
                <tr> 
                    <td>#103</td> 
                    <td><i class="fa-solid fa-bolt text-warning"></i> Electrician</td>
                	<td>15 May 2026</td> 
                	<td>11:00 AM - 01:00 PM</td> 
                	<td>₹199</td> 
                	<td><span class="badge bg-warning text-dark px-3 py-2"> Pending</span></td>
                	<td><a href="#" class="viewBtn">View</a></td> 
                </tr> 
                <tr> 
                	<td>#104</td> 
                	<td><i class="fa-solid fa-broom text-success"></i> Cleaning</td>
                	<td>10 May 2026</td> 
                	<td>09:00 AM - 11:00 AM</td> 
                	<td>₹149</td> 
                	<td><span class="badge bg-danger px-3 py-2"> Cancelled</span></td>
                	<td><a href="#" class="viewBtn">View</a></td> 
                 </tr> 
                 <tr> 
                 	<td>#105</td> 
                 	<td><i class="fa-solid fa-laptop text-dark"></i> Laptop Repair</td>
                 	<td>05 May 2026</td> 
                 	<td>03:00 PM - 05:00 PM</td> 
                 	<td>₹350</td> 
                 	<td><span class="badge bg-success px-3 py-2">Completed</span></td>
                 	<td><a href="#" class="viewBtn">View</a></td> 
                 </tr>

            </tbody>

        </table>

</div>
</div>
<div class="footer">

© 2026 Smart Service Booking System

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
