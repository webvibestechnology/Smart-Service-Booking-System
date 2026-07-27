<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webvibes.authentication.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Service Booking System - Home</title>
  <link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    
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
        
        .login-btn { background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%); color: white; padding: 11px 28px; text-decoration: none; border-radius: 8px; font-size: 14px; font-weight: 600; box-shadow: 0 4px 14px rgba(37, 99, 235, 0.3); transition: all 0.2s ease; display: flex; align-items: center; gap: 8px; }
        .login-btn:hover { background: linear-gradient(135deg, #1d4ed8 0%, #1e40af 100%); transform: translateY(-2px); box-shadow: 0 6px 20px rgba(37, 99, 235, 0.4); }

        /* HERO */
        .hero-container { display: flex; padding: 60px 60px; justify-content: space-between; align-items: center; background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); color: white; border-bottom-left-radius: 40px; border-bottom-right-radius: 40px; gap: 40px; }
        .hero-left { flex: 1.2; max-width: 620px; }
        .hero-left h1 { font-size: 52px; font-weight: 800; margin-bottom: 24px; }
        .hero-left h1 span { color: #38bdf8; }
        .hero-left p { font-size: 18px; color: #94a3b8; margin-bottom: 36px; }
        .search-box { display: flex; background: rgba(255, 255, 255, 0.05); padding: 8px; border-radius: 12px; width: 100%; max-width: 520px; border: 1px solid rgba(255, 255, 255, 0.1); }
        .search-box input { flex: 1; border: none; padding: 12px 16px; outline: none; font-size: 16px; color: #ffffff; background: transparent; }
        .search-box button { background: #3b82f6; color: white; border: none; padding: 0 32px; border-radius: 8px; font-weight: 600; cursor: pointer; }
        .hero-right { flex: 0.8; display: flex; justify-content: center; }
        .hero-image-frame { width: 100%; max-width: 420px; height: 380px; overflow: hidden; border-radius: 24px; }
        .hero-image-frame img { width: 100%; height: 100%; object-fit: cover; }

        /* SERVICES */
        .services-section { padding: 80px 60px; background-color: #f8fafc; }
        .services-section h2 { font-size: 28px; color: #0f172a; font-weight: 800; text-align: center; margin-bottom: 45px; }
        .services-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 24px; }
        .service-card { background: white; padding: 35px 24px; border-radius: 20px; border: 1px solid #e2e8f0; display: flex; flex-direction: column; align-items: center; text-align: center; transition: all 0.3s; position: relative; }
        .service-card:hover { transform: translateY(-8px); box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05); }
        .highlight-card { border: 3px solid #3b82f6 !important; transform: scale(1.05); }
        .icon-container { font-size: 38px; width: 70px; height: 70px; border-radius: 16px; margin-bottom: 24px; display: flex; align-items: center; justify-content: center; }
        .ic-ac { background-color: #f1f5f9; color: #475569; }
        .ic-plumb { background-color: #eff6ff; color: #2563eb; }
        .ic-elec { background-color: #fffbeb; color: #ca8a04; }
        .ic-clean { background-color: #f0fdf4; color: #16a34a; }
        .ic-laptop { background-color: #e0e7ff; color: #4f46e5; }
        
        /* UPDATED ABOUT SECTION */
        .about-section { padding: 80px 60px; background: white; }
        .about-title { font-size: 28px; font-weight: 800; text-align: center; margin-bottom: 50px; color: #0f172a; }
        .about-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 30px; }
        .about-item { padding: 30px; border-radius: 20px; border: 1px solid #e2e8f0; transition: all 0.3s ease; text-align: center; }
        .about-item:hover { transform: translateY(-5px); border-color: #3b82f6; box-shadow: 0 10px 20px rgba(0,0,0,0.05); }
        .about-item i { font-size: 30px; color: #3b82f6; margin-bottom: 15px; }
        .about-item h4 { margin-bottom: 10px; color: #0f172a; }
        .about-item p { color: #64748b; font-size: 14px; }
    </style>
</head>
<body>

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
        <li><a href="#home">Home</a></li>
        <li><a href="#services">Services</a></li>
        <li><a href="#about">About Us</a></li>
        <li><a href="#contact">Contact Us</a></li>
    </ul>

    <div style="display:flex;gap:12px;">

        <a href="${pageContext.request.contextPath}/pages/login.jsp" class="login-btn">
            <i class="fa-solid fa-user-lock"></i>
            Login
        </a>

        <a href="${pageContext.request.contextPath}/pages/registration.jsp"
           class="login-btn"
           style="background:#16a34a;">
            <i class="fa-solid fa-user-plus"></i>
            Register
        </a>

    </div>
</nav>
    <header class="hero-container" id="home">
        <div class="hero-left">
            <h1>Book Trusted <span>Services Easily</span></h1>
            <p>We connect you with verified, highly-rated professionals for all your essential home and commercial service needs.</p>
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="Search (e.g. ac, plumbing, cleaning)...">
                <button type="button" onclick="searchService()">Search</button>
            </div>
        </div>
        <div class="hero-right"><div class="hero-image-frame"><img src="https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&w=600&q=80" alt="Technician"></div></div>
    </header>

    <main class="services-section" id="services">
        <h2>Popular Services</h2>
        <div class="services-grid">
           <div class="service-card"
     id="ac"
     onclick="openService('AC Repair')">

    <div class="icon-container ic-ac">
        <i class="fa-solid fa-snowflake"></i>
    </div>

    <h3>AC Repair</h3>
    <p>Starting at ₹499</p>

</div>
        <div class="service-card"
     id="plumbing"
     onclick="openService('Plumbing')">

    <div class="icon-container ic-ac">
        <i class="fa-solid fa-snowflake"></i>
    </div>

    <h3>Plumbing </h3>
    <p>Starting at ₹499</p>

</div>
          <div class="service-card"
     id="electrician"
     onclick="openService('Electrician')">

    <div class="icon-container ic-ac">
        <i class="fa-solid fa-snowflake"></i>
    </div>

    <h3>Electrician</h3>
    <p>Starting at ₹499</p>

</div>
 
        </div>
    </main>

    <section class="about-section" id="about">
        <h2 class="about-title">About Us</h2>
        <div class="about-grid">
            <div class="about-item"><i class="fa-solid fa-rocket"></i><h4>Our Mission</h4><p>Providing seamless service booking experiences by connecting users with top-tier professionals in their area with ease and trust.</p></div>
            <div class="about-item"><i class="fa-solid fa-shield-halved"></i><h4>Verified Quality</h4><p>We ensure that every service partner on our platform goes through a strict background check to maintain high-quality standards for you.</p></div>
            <div class="about-item"><i class="fa-solid fa-headset"></i><h4>Reliable Support</h4><p>Our dedicated support team is available 24/7 to assist you with any booking or service-related queries you may have.</p></div>
        </div>
    </section>

    <section id="contact" style="padding: 80px 60px; text-align: center; background: #0f172a; color: white;">
        <h2>Contact Us</h2>
        <p style="margin-top: 15px;">Email: support@smartservice.com | Phone: +91 98765 43210</p>
        <p style="margin-top: 10px;">Address: Office No. 201, Tech Hub Building, Hinjewadi, Pune - 411057</p>
    </section>
<footer
style="
background:#020617;
color:white;
text-align:center;
padding:20px;">

    © 2026 Smart Service Booking System |
    All Rights Reserved.

</footer>
    <script>
    function searchService() {

        let input = document.getElementById("searchInput")
                        .value
                        .trim()
                        .toLowerCase();

        let target = document.getElementById(input);

        document.querySelectorAll(".service-card")
            .forEach(card => card.classList.remove("highlight-card"));

        if (target) {

            target.classList.add("highlight-card");

            target.scrollIntoView({
                behavior: "smooth",
                block: "center"
            });

        } else {

            alert("Service not found!");

        }
    }

    function openService(serviceName){
        // Go to Sprint 2 services listing page
        window.location.href =
                "http://localhost:8080/Maven-Services/viewServices";
    }
    </script>
</body>
</html>