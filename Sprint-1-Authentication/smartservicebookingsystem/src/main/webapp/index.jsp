<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Service Booking System - Home</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        
        .navbar { 
            background-color: #021b4d; 
            color: white; 
            padding: 20px 50px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .navbar-brand { font-size: 22px; font-weight: 700; text-decoration: none; color: white; letter-spacing: 0.5px; }
        .nav-btn { border: 2px solid #0a58ca; background-color: #0a58ca; color: white; padding: 10px 24px; text-decoration: none; border-radius: 6px; font-size: 14px; font-weight: 600; transition: 0.3s; }
        .nav-btn:hover { background-color: transparent; color: white; border-color: white; }
        
        .hero-section { 
            background: radial-gradient(circle at 80% 20%, #0a58ca 0%, #021b4d 100%);
            min-height: 85vh; 
            color: white; 
            display: flex; 
            align-items: center; 
            padding: 0 50px;
            position: relative;
            overflow: hidden;
        }
        .hero-section::before {
            content: ''; position: absolute; top: -10%; right: -10%; width: 500px; height: 500px;
            background: rgba(255, 255, 255, 0.03); border-radius: 50%; pointer-events: none;
        }
        
        .hero-content { max-width: 700px; z-index: 2; }
        .hero-content h1 { font-size: 48px; margin-bottom: 20px; font-weight: 800; line-height: 1.25; }
        .hero-content p { font-size: 18px; margin-bottom: 35px; color: #cbd5e1; line-height: 1.7; font-weight: 300; }
        
        .btn-booking { 
            background-color: #ffffff; 
            color: #021b4d; 
            padding: 16px 36px; 
            text-decoration: none; 
            font-weight: 700; 
            border-radius: 6px; 
            display: inline-block; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-booking:hover { 
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255,255,255,0.2);
        }
    </style>
</head>
<body>

    <nav class="navbar">
        <a class="navbar-brand" href="#">Smart Service Booking System</a>
        <a href="login.jsp" class="nav-btn">Sign In to Account</a>
    </nav>

    <header class="hero-section">
        <div class="hero-content">
            <h1>Expert Home Services,<br>Simplified Instantly.</h1>
            <p>Connecting you with top-tier, verified professionals for seamless AC maintenance, precision electronics repair, smart plumbing, and tailored home utilities. Safe. Reliable. Fast.</p>
            <a href="login.jsp" class="btn-booking">Get Started Now</a>
        </div>
    </header>

</body>
</html>
