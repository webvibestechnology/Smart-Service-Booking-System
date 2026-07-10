<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <title>Smart Service Booking System - Home</title>
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; }
        body { background-color: #f8fafc; color: #1e293b; line-height: 1.5; min-height: 100vh; display: flex; flex-direction: column; }

        /* PREMIUM NAVBAR */
        .navbar {
            background-color: #0f172a;
            color: white;
            padding: 16px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 10px 15px -3px rgba(15, 23, 42, 0.08);
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        .brand-section { display: flex; align-items: center; gap: 14px; }
        .logo-icon {
            background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
            color: white;
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25);
        }
        .brand-name { font-size: 19px; font-weight: 700; color: white; }
        .brand-sub { font-size: 11px; color: #38bdf8; font-weight: 600; letter-spacing: 1px; }
        
        .nav-links { display: flex; gap: 36px; align-items: center; list-style: none; }
        .nav-links a { color: #94a3b8; text-decoration: none; font-size: 15px; font-weight: 500; transition: all 0.2s ease; position: relative; }
        .nav-links a:hover { color: #ffffff; }
        .nav-links a::after { content: ''; position: absolute; width: 0; height: 2px; bottom: -6px; left: 0; background-color: #3b82f6; transition: width 0.2s ease; }
        .nav-links a:hover::after { width: 100%; }
        
        .login-btn {
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            color: white;
            padding: 11px 28px;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            box-shadow: 0 4px 14px rgba(37, 99, 235, 0.3);
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .login-btn:hover { background: linear-gradient(135deg, #1d4ed8 0%, #1e40af 100%); transform: translateY(-2px); box-shadow: 0 6px 20px rgba(37, 99, 235, 0.4); }

        /* HERO LAYOUT */
        .hero-container {
            display: flex;
            padding: 60px 60px;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: white;
            position: relative;
            overflow: hidden;
            border-bottom-left-radius: 40px;
            border-bottom-right-radius: 40px;
            gap: 40px;
        }
        .hero-left { flex: 1.2; max-width: 620px; z-index: 2; }
        .hero-left h1 { font-size: 52px; font-weight: 800; margin-bottom: 24px; }
        .hero-left h1 span { color: #38bdf8; }
        .hero-left p { font-size: 18px; color: #94a3b8; margin-bottom: 36px; }
        
        /* SEARCH BOX */
        .search-box { 
            display: flex; 
            background: rgba(255, 255, 255, 0.05); 
            padding: 8px; 
            border-radius: 12px; 
            width: 100%; 
            max-width: 520px; 
            border: 1px solid rgba(255, 255, 255, 0.1); 
        }
        .search-box input { flex: 1; border: none; padding: 12px 16px; outline: none; font-size: 16px; color: #ffffff; background: transparent; }
        .search-box button { background: #3b82f6; color: white; border: none; padding: 0 32px; border-radius: 8px; font-weight: 600; cursor: pointer; }

        /* HERO RIGHT */
        .hero-right { flex: 0.8; display: flex; justify-content: center; z-index: 2; }
        .hero-image-frame {
            width: 100%; max-width: 420px; height: 380px; overflow: hidden; border-radius: 24px;
        }
        .hero-image-frame img { width: 100%; height: 100%; object-fit: cover; }

        /* SERVICES SECTION */
        .services-section { padding: 80px 60px; background-color: #f8fafc; }
        .services-section h2 { font-size: 28px; color: #0f172a; font-weight: 800; text-align: center; margin-bottom: 45px; }
        .services-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 24px; }
        
        /* SERVICE CARD WITH HOVER LIGHT BACKGROUNDS */
        .service-card {
            background: white; padding: 35px 24px; border-radius: 20px; border: 1px solid #e2e8f0;
            display: flex; flex-direction: column; align-items: center; text-align: center;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); position: relative; overflow: hidden;
        }
        .service-card::after {
            content: ''; position: absolute; bottom: 0; left: 0; width: 100%; height: 4px; background: #2563eb; transform: scaleX(0); transition: transform 0.3s ease;
        }
        .service-card:hover { 
            transform: translateY(-8px); 
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05); 
            border-color: #cbd5e1; 
        }
        .service-card:hover::after { transform: scaleX(1); }
        
        .icon-container { font-size: 38px; width: 70px; height: 70px; border-radius: 16px; margin-bottom: 24px; display: flex; align-items: center; justify-content: center; transition: all 0.3s ease; }
        .service-card:hover .icon-container { transform: scale(1.1); }
        
        /* CARD ICON CONTAINER BACKGROUND THEMES */
        .ic-ac { background-color: #f1f5f9; color: #475569; }
        .ic-plumb { background-color: #eff6ff; color: #2563eb; }
        .ic-elec { background-color: #fffbeb; color: #ca8a04; }
        .ic-clean { background-color: #f0fdf4; color: #16a34a; }
        .ic-laptop { background-color: #e0e7ff; color: #4f46e5; }

        /* HOVER EFFECTS FOR LIGHT STYLES */
        .service-card:hover.card-ac { background-color: #f8fafc; }
        .service-card:hover.card-plumb { background-color: #f0f7ff; }
        .service-card:hover.card-elec { background-color: #fefce8; }
        .service-card:hover.card-clean { background-color: #f0fdf4; }
        .service-card:hover.card-laptop { background-color: #f5f3ff; }

        .service-card h3 { font-size: 18px; color: #0f172a; font-weight: 700; margin-bottom: 10px; }
        .service-card p { font-size: 14px; color: #2563eb; font-weight: 600; background-color: rgba(37, 99, 235, 0.06); padding: 4px 12px; border-radius: 12px; }
        
        /* Uniform layout for cleaning badges */
        .card-clean p { color: #16a34a; background-color: rgba(22, 163, 74, 0.06); }
    </style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <div class="brand-section">
            <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
            <div>
                <div class="brand-name">Smart Service</div>
                <div class="brand-sub">BOOKING SYSTEM</div>
            </div>
        </div>
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
        
        <a href="${pageContext.request.contextPath}/pages/login.jsp" id="loginLink" class="login-btn">
            <i class="fa-solid fa-user-lock"></i> Login
        </a>
    </nav>

    <!-- HERO SECTION -->
    <header class="hero-container">
        <div class="hero-left">
            <h1>Book Trusted <span>Services Easily</span></h1>
            <p>We connect you with verified, highly-rated professionals for all your essential home and commercial service needs.</p>
            <div class="search-box">
                <input type="text" placeholder="Search for services (e.g., AC, Plumbing)...">
                <button type="button">Search</button>
            </div>
        </div>
        
        <div class="hero-right">
            <div class="hero-image-frame">
                <img src="https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&w=600&q=80" alt="Technician">
            </div>
        </div>
    </header>

    <!-- POPULAR SERVICES -->
    <main class="services-section">
        <h2>Popular Services</h2>
        
        <div class="services-grid">
            <div class="service-card card-ac">
                <div class="icon-container ic-ac"><i class="fa-solid fa-snowflake"></i></div>
                <h3>AC Repair</h3>
                <p>Starting at ₹499</p>
            </div>
            <div class="service-card card-plumb">
                <div class="icon-container ic-plumb"><i class="fa-solid fa-faucet"></i></div>
                <h3>Plumbing</h3>
                <p>Starting at ₹299</p>
            </div>
            <div class="service-card card-elec">
                <div class="icon-container ic-elec"><i class="fa-solid fa-plug"></i></div>
                <h3>Electrician</h3>
                <p>Starting at ₹199</p>
            </div>
            <div class="service-card card-clean">
                <div class="icon-container ic-clean"><i class="fa-solid fa-broom"></i></div>
                <h3>Cleaning</h3>
                <p>Starting at ₹149</p>
            </div>
            <div class="service-card card-laptop">
                <div class="icon-container ic-laptop"><i class="fa-solid fa-laptop"></i></div>
                <h3>Laptop Repair</h3>
                <p>Starting at ₹399</p>
            </div>
        </div>
    </main>

    <script>
        (function() {
            var link = document.getElementById("loginLink");
            if (link && (link.getAttribute("href").indexOf("pageContext") !== -1 || link.getAttribute("href").indexOf("{") !== -1)) {
                link.setAttribute("href", "login.jsp");
            }
        })();
    </script>
</body>
</html>