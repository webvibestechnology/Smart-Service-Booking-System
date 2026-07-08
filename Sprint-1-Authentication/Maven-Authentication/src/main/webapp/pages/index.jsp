<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Service Booking System - Home</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; }
        body { background-color: #f8fafc; color: #1e293b; line-height: 1.5; min-height: 100vh; display: flex; flex-direction: column; }

        /* PREMIUM GLASSMORPHIC NAVBAR */
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
        .brand-name { font-size: 19px; font-weight: 700; letter-spacing: 0.5px; background: linear-gradient(to right, #ffffff, #cbd5e1); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
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

        
        .hero-container {
            display: flex;
            padding: 80px 60px;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: white;
            position: relative;
            overflow: hidden;
            border-bottom-left-radius: 40px;
            border-bottom-right-radius: 40px;
        }
        .hero-container::before {
            content: ''; position: absolute; width: 300px; height: 300px; background: rgba(37, 99, 235, 0.15); filter: blur(100px); top: -50px; right: -50px; border-radius: 50%;
        }
        .hero-left { flex: 1.2; max-width: 620px; z-index: 2; }
        .hero-left h1 { font-size: 52px; font-weight: 800; margin-bottom: 24px; line-height: 1.15; letter-spacing: -1px; }
        .hero-left h1 span { background: linear-gradient(to right, #38bdf8, #3b82f6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .hero-left p { font-size: 18px; color: #94a3b8; margin-bottom: 36px; line-height: 1.6; }
        
        /* SEARCH COMPONENT (GLOW STYLE) */
        .search-box { 
            display: flex; 
            background: rgba(255, 255, 255, 0.05); 
            padding: 8px; 
            border-radius: 12px; 
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2); 
            backdrop-filter: blur(5px);
            width: 100%; 
            max-width: 520px; 
            border: 1px solid rgba(255, 255, 255, 0.1); 
            transition: all 0.3s ease;
        }
        .search-box:focus-within { border-color: #3b82f6; box-shadow: 0 0 15px rgba(59, 130, 246, 0.3); background: rgba(255, 255, 255, 0.08); }
        .search-box input { flex: 1; border: none; padding: 12px 16px; outline: none; font-size: 16px; color: #ffffff; background: transparent; }
        .search-box input::placeholder { color: #64748b; }
        .search-box button { background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%); color: white; border: none; padding: 0 32px; border-radius: 8px; font-size: 15px; font-weight: 600; cursor: pointer; transition: all 0.2s ease; }
        .search-box button:hover { background: #2563eb; transform: scale(1.02); }

        /* HERO RIGHT: DYNAMIC ABSTRACT GEOMETRY */
        .hero-right { flex: 0.8; display: flex; justify-content: flex-end; z-index: 2; }
        .hero-artwork {
            width: 340px; height: 340px; 
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            border-radius: 43% 57% 72% 28% / 50% 43% 57% 50%;
            box-shadow: 0 20px 40px rgba(37, 99, 235, 0.3);
            display: flex; align-items: center; justify-content: center;
            color: white; font-size: 84px;
            animation: morphing 10s ease-in-out infinite alternate;
        }
        @keyframes morphing {
            0% { border-radius: 43% 57% 72% 28% / 50% 43% 57% 50%; }
            100% { border-radius: 70% 30% 52% 48% / 60% 40% 60% 40%; }
        }

        /* POPULAR SERVICES SECTION */
        .services-section { padding: 80px 60px; background-color: #f8fafc; }
        .services-section h2 { font-size: 28px; color: #0f172a; font-weight: 800; margin-bottom: 12px; letter-spacing: -0.5px; text-align: center; }
        .services-subtitle { text-align: center; color: #64748b; font-size: 16px; margin-bottom: 45px; }
        
        .services-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 24px; }
        
        /* PREMIUM SERVICE CARD COMPONENT */
        .service-card {
            background: white;
            padding: 35px 24px;
            border-radius: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.02), 0 2px 4px -1px rgba(0, 0, 0, 0.01);
            border: 1px solid #e2e8f0;
            display: flex; flex-direction: column; align-items: center; text-align: center;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative; overflow: hidden;
        }
        .service-card::after {
            content: ''; position: absolute; bottom: 0; left: 0; width: 100%; height: 4px; background: #2563eb; transform: scaleX(0); transition: transform 0.3s ease;
        }
        .service-card:hover { 
            transform: translateY(-8px); 
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05), 0 10px 10px -5px rgba(0, 0, 0, 0.02); 
            border-color: #cbd5e1; 
        }
        .service-card:hover::after { transform: scaleX(1); }
        
        .icon-container { 
            font-size: 38px; width: 70px; height: 70px; border-radius: 16px; 
            margin-bottom: 24px; display: flex; align-items: center; justify-content: center; 
            transition: all 0.3s ease;
        }
        .service-card:hover .icon-container { transform: scale(1.1); }
        
        /* Color themes based on your original icons */
        .ic-ac { background-color: #f1f5f9; color: #475569; }
        .ic-plumb { background-color: #eff6ff; color: #2563eb; }
        .ic-elec { background-color: #fef9c3; color: #ca8a04; }
        .ic-clean { background-color: #ecfdf5; color: #059669; }
        .ic-laptop { background-color: #e0e7ff; color: #4f46e5; }

        .service-card h3 { font-size: 18px; color: #0f172a; font-weight: 700; margin-bottom: 10px; }
        .service-card p { font-size: 14px; color: #2563eb; font-weight: 600; background-color: rgba(37, 99, 235, 0.06); padding: 4px 12px; border-radius: 12px; }
    </style>
</head>
<body>

    <!-- NAVBAR -->
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
        
        <!-- DYNAMIC PATH WITH ICON -->
        <a href="${pageContext.request.contextPath}/pages/login.jsp" class="login-btn">
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
                <button type="button"><i class="fa-solid fa-magnifying-glass" style="margin-right: 6px;"></i> Search</button>
            </div>
        </div>
        <div class="hero-right">
            <div class="hero-artwork">
                <i class="fa-solid fa-screwdriver-wrench"></i>
            </div>
        </div>
    </header>

    <!-- POPULAR SERVICES -->
    <main class="services-section">
        <h2>Popular Services</h2>
        <p class="services-subtitle">Explore our top-rated service options requested by users this week</p>
        
        <div class="services-grid">
            
            <!-- AC Repair Card -->
            <div class="service-card">
                <div class="icon-container ic-ac"><i class="fa-solid fa-snowflake"></i></div>
                <h3>AC Repair</h3>
                <p>Starting at ₹499</p>
            </div>

            <!-- Plumbing Card -->
            <div class="service-card">
                <div class="icon-container ic-plumb"><i class="fa-solid fa-faucet"></i></div>
                <h3>Plumbing</h3>
                <p>Starting at ₹299</p>
            </div>

            <!-- Electrician Card -->
            <div class="service-card">
                <div class="icon-container ic-elec"><i class="fa-solid fa-plug"></i></div>
                <h3>Electrician</h3>
                <p>Starting at ₹199</p>
            </div>

            <!-- Cleaning Card -->
            <div class="service-card">
                <div class="icon-container ic-clean"><i class="fa-solid fa-sparkles"></i></div>
                <h3>Cleaning</h3>
                <p>Starting at ₹149</p>
            </div>

            <!-- Laptop Repair Card -->
            <div class="service-card">
                <div class="icon-container ic-laptop"><i class="fa-solid fa-laptop"></i></div>
                <h3>Laptop Repair</h3>
                <p>Starting at ₹399</p>
            </div>

        </div>
    </main>

</body>
</html>