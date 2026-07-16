<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services Listing | Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* NAVBAR (Home Page Design) */
        .navbar { background-color: #0f172a; color: white; padding: 16px 60px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 10px 15px -3px rgba(15, 23, 42, 0.08); }
        .brand-section { display: flex; align-items: center; gap: 14px; text-decoration: none; color: white; }
        .logo-icon { background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%); color: white; width: 44px; height: 44px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 22px; }
        .brand-name { font-size: 19px; font-weight: 700; }
        .brand-sub { font-size: 11px; color: #38bdf8; font-weight: 600; letter-spacing: 1px; }
        .nav-links { display: flex; gap: 36px; align-items: center; list-style: none; margin: 0; }
        .nav-links a { color: #94a3b8; text-decoration: none; font-size: 15px; font-weight: 500; }
        .nav-links a:hover { color: #ffffff; }
        .login-btn { background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%); color: white; padding: 10px 25px; border-radius: 8px; text-decoration: none; font-weight: 600; }

        /* CONTENT */
        .sidebar { background: white; padding: 20px; border-right: 1px solid #ddd; min-height: 80vh; }
        .sidebar li { cursor: pointer; padding: 10px; border-radius: 8px; transition: 0.3s; }
        .sidebar li:hover { background: #f1f5f9; }
        .card { border: none; box-shadow: 0 4px 10px rgba(0,0,0,0.1); border-radius: 12px; transition: 0.3s; }
        .btn-book { background-color: #3b82f6; color: white; border-radius: 6px; width: 100%; text-align: center; padding: 8px; text-decoration: none; display: block; }
        .star-rating { color: #ffc107; font-size: 0.9rem; font-weight: bold; }
        .search-bar { width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #ddd; }
        .highlight-card { border: 3px solid #3b82f6 !important; transform: scale(1.02); }
        .footer { padding: 40px; text-align: center; background: #0f172a; color: white; margin-top: 50px; }
    </style>
</head>
<body class="bg-light">

    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="index.jsp" class="brand-section">
            <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
            <div><div class="brand-name">Smart Service</div><div class="brand-sub">BOOKING SYSTEM</div></div>
        </a>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="viewServices.jsp">Services</a></li>
            <li><a href="index.jsp#about">About Us</a></li>
            <li><a href="index.jsp#contact">Contact Us</a></li>
        </ul>
        <a href="login.jsp" class="login-btn"><i class="fa-solid fa-user-lock"></i> Login</a>
    </nav>

    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-md-2 sidebar">
                <h6 class="text-uppercase text-muted fw-bold mb-4">Categories</h6>
                <ul class="list-unstyled">
                    <li onclick="filterServices('all')"><i class="fa-solid fa-list me-2 text-primary"></i> All Services</li>
                    <li onclick="filterServices('ac')"><i class="fa-solid fa-fan me-2 text-primary"></i> AC Repair</li>
                    <li onclick="filterServices('plumbing')"><i class="fa-solid fa-wrench me-2 text-primary"></i> Plumbing</li>
                    <li onclick="filterServices('electrician')"><i class="fa-solid fa-plug me-2 text-primary"></i> Electrician</li>
                    <li onclick="filterServices('cleaning')"><i class="fa-solid fa-broom me-2 text-primary"></i> Cleaning</li>
                    <li onclick="filterServices('laptop')"><i class="fa-solid fa-laptop me-2 text-primary"></i> Laptop Repair</li>
                    <li onclick="filterServices('painting')"><i class="fa-solid fa-brush me-2 text-primary"></i> Painting</li>
                </ul>
            </div>

            <div class="col-md-10 p-4">
                <!-- Search and Dropdown -->
                <div class="mb-4 d-flex gap-2">
                    <input type="text" id="searchInput" class="search-bar" placeholder="Search services..." onkeyup="filterServices('search')">
                    <select id="categorySelect" class="form-select" style="width: 200px;" onchange="filterServices(this.value)">
                        <option value="all">All Categories</option>
                        <option value="ac">AC Repair</option>
                        <option value="plumbing">Plumbing</option>
                        <option value="electrician">Electrician</option>
                        <option value="cleaning">Cleaning</option>
                        <option value="laptop">Laptop Repair</option>
                        <option value="painting">Painting</option>
                    </select>
                </div>

                <div class="row" id="serviceRow">
                    <div class="col-md-4 mb-4 service-card" data-name="ac"><div class="card p-3"><img src="https://static.vecteezy.com/system/resources/thumbnails/071/837/068/small/technician-repairing-white-wall-mounted-air-conditioner-in-modern-indoor-setting-free-photo.jpg" class="card-img-top rounded" height="180px"><h5 class="mt-3">AC Repair</h5><p class="text-muted m-0">Starting at ₹499</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.5</div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="plumbing"><div class="card p-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5Jm2CrpRrK-hoPZL8MLg9LeotVFGtGTqs2BCFOC_nfeEEKMZdj5QeFj7&s=10" class="card-img-top rounded" height="180px"><h5 class="mt-3">Plumbing</h5><p class="text-muted m-0">Starting at ₹299</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.3</div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="electrician"><div class="card p-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu9bbiccoQBIpCDcsi5_SLSR57Is2peIc5Qsy6JKmpALLGec5AQCby9c1E&s=10" class="card-img-top rounded" height="180px"><h5 class="mt-3">Electrician</h5><p class="text-muted m-0">Starting at ₹199</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.6</div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="cleaning"><div class="card p-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyYKaxdGp40pLNOS2WDrcLuhjYWEtbkjT0aq4lwh8AIYi3U5oXJISkiFtc&s=10" class="card-img-top rounded" height="180px"><h5 class="mt-3">Cleaning</h5><p class="text-muted m-0">Starting at ₹149</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.2</div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="laptop"><div class="card p-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU3vvKrTXWUIWgPlu01aOxQC7PlgSywksW6RcXggtKN5O_mFWI3V5AHgc&s=10" class="card-img-top rounded" height="180px"><h5 class="mt-3">Laptop Repair</h5><p class="text-muted m-0">Starting at ₹399</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.4</div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="painting"><div class="card p-3"><img src="https://www.indiapaintingservices.com/assets/images/service/ips-services-20.jpg" class="card-img-top rounded" height="180px"><h5 class="mt-3">Painting</h5><p class="text-muted m-0">Starting at ₹199</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.1</div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>Email: support@smartservice.com | Phone: +91 98765 43210</p>
        <p>Address: Office No. 201, Tech Hub Building, Hinjewadi, Pune - 411057</p>
    </footer>

    <script>
        function filterServices(val) {
            let input = (val === 'search') ? document.getElementById('searchInput').value.toLowerCase() : val;
            let cards = document.getElementsByClassName('service-card');
            for (let i = 0; i < cards.length; i++) {
                let name = cards[i].getAttribute('data-name');
                cards[i].classList.remove('highlight-card');
                if (val === 'all' || name.includes(input) || name === input) {
                    cards[i].style.display = "";
                    if(val !== 'all' && val !== 'search') cards[i].classList.add('highlight-card');
                } else {
                    cards[i].style.display = "none";
                }
            }
        }
    </script>
</body>
</html>