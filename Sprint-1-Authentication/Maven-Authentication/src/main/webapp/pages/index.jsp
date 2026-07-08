<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Service Booking System - Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; }
        body { background-color: #f8fafc; color: #1e293b; line-height: 1.5; }

        
        .navbar {
            background-color: #0f172a;
            color: white;
            padding: 18px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .brand-section { display: flex; align-items: center; gap: 12px; }
        .logo-icon {
            background-color: #2563eb;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .brand-name { font-size: 18px; font-weight: 700; letter-spacing: 0.5px; }
        .brand-sub { font-size: 11px; color: #94a3b8; font-weight: 500; }
        .nav-links { display: flex; gap: 32px; align-items: center; list-style: none; }
        .nav-links a { color: #94a3b8; text-decoration: none; font-size: 15px; font-weight: 500; transition: color 0.2s; }
        .nav-links a:hover { color: #ffffff; }
        
        .login-btn {
            background-color: #2563eb;
            color: white;
            padding: 10px 26px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.2s, transform 0.1s;
        }
        .login-btn:hover { background-color: #1d4ed8; transform: translateY(-1px); }

        /* HERO SECTION */
        .hero-container {
            display: flex;
            padding: 60px;
            justify-content: space-between;
            align-items: center;
            min-height: 460px;
            background: linear-gradient(135deg, #eff6ff 0%, #f8fafc 100%);
        }
        .hero-left { flex: 1.2; max-width: 580px; }
        .hero-left h1 { font-size: 46px; color: #0f172a; font-weight: 800; margin-bottom: 20px; line-height: 1.15; }
        .hero-left p { font-size: 17px; color: #475569; margin-bottom: 32px; font-weight: 400; }
        
        /* SEARCH COMPONENT */
        .search-box { 
            display: flex; 
            background: white; 
            padding: 6px; 
            border-radius: 8px; 
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05); 
            width: 100%; 
            max-width: 480px; 
            border: 1px solid #e2e8f0; 
        }
        .search-box input { flex: 1; border: none; padding: 12px 16px; outline: none; font-size: 15px; color: #334155; }
        .search-box button { background-color: #2563eb; color: white; border: none; padding: 0 28px; border-radius: 6px; font-size: 14px; font-weight: 600; cursor: pointer; transition: background-color 0.2s; }
        .search-box button:hover { background-color: #1d4ed8; }

        /* HERO RIGHT: VECTOR ART REPLACEMENT */
        .hero-right { flex: 0.8; display: flex; justify-content: flex-end; }
        .hero-artwork {
            width: 320px;
            height: 320px;
            background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
            border-radius: 30% 70% 65% 35% / 40% 35% 65% 60%;
            box-shadow: 0 20px 25px -5px rgba(37, 99, 235, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 72px;
        }

        /* POPULAR SERVICES Section */
        .services-section { padding: 20px 60px 60px 60px; }
        .services-section h2 { font-size: 22px; color: #0f172a; font-weight: 700; margin-bottom: 24px; letter-spacing: -0.3px; }
        .services-grid { display: flex; gap: 20px; justify-content: space-between; flex-wrap: wrap; }
        
        /* CARD PRODUCTION COMPONENT */
        .service-card {
            background: white;
            flex: 1;
            min-width: 180px;
            padding: 28px 20px;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            border: 1px solid #e2e8f0;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .service-card:hover { transform: translateY(-4px); box-shadow: 0 12px 20px -5px rgba(0, 0, 0, 0.05); border-color: #cbd5e1; }
        .icon-container { font-size: 34px; margin-bottom: 20px; display: flex; align-items: center; justify-content: center; height: 50px; }
        
        .ic-ac { color: #64748b; }
        .ic-plumb { color: #3b82f6; }
        .ic-elec { color: #eab308; }
        .ic-clean { color: #10b981; }
        .ic-laptop { color: #6366f1; }

        .service-card h3 { font-size: 15px; color: #0f172a; font-weight: 700; margin-bottom: 8px; }
        .service-card p { font-size: 13px; color: #64748b; font-weight: 500; }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="brand-section">
            <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
            <div>
                <div class="brand-name">Smart Service</div>
                <div class="brand-sub">BOOKING PORTAL</div>
            </div>
        </div>
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
        
        <a href="${pageContext.request.contextPath}/pages/login.jsp" class="login-btn">Login</a>
    </nav>

    <header class="hero-container">
        <div class="hero-left">
            <h1>Book Trusted<br>Services Easily</h1>
            <p>We connect you with verified, highly-rated professionals for all your essential home and commercial service needs.</p>
            <div class="search-box">
                <input type="text" placeholder="Search for services (e.g., AC, Plumbing)...">
                <button type="button">Search</button>
            </div>
        </div>
        <div class="hero-right">
            <div class="hero-artwork">
                <i class="fa-solid fa-screwdriver-wrench"></i>
            </div>
        </div>
    </header>

    <main class="services-section">
        <h2>Popular Services</h2>
        <div class="services-grid">
            
            <div class="service-card">
                <div class="icon-container ic-ac"><i class="fa-solid fa-snowflake"></i></div>
                <h3>AC Repair</h3>
                <p>Starting at ₹499</p>
            </div>

            <div class="service-card">
                <div class="icon-container ic-plumb"><i class="fa-solid fa-faucet"></i></div>
                <h3>Plumbing</h3>
                <p>Starting at ₹299</p>
            </div>

            <div class="service-card">
                <div class="icon-container ic-elec"><i class="fa-solid fa-plug"></i></div>
                <h3>Electrician</h3>
                <p>Starting at ₹199</p>
            </div>

            <div class="service-card">
                <div class="icon-container ic-clean"><i class="fa-solid fa-sparkles"></i></div>
                <h3>Cleaning</h3>
                <p>Starting at ₹149</p>
            </div>

            <div class="service-card">
                <div class="icon-container ic-laptop"><i class="fa-solid fa-laptop"></i></div>
                <h3>Laptop Repair</h3>
                <p>Starting at ₹399</p>
            </div>

        </div>
    </main>

</body>
</html>