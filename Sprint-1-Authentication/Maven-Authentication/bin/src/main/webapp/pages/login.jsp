<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Service Booking System - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background-color: #f8fafc; min-height: 100vh; display: flex; flex-direction: column; }

        /* NAVBAR STYLES */
        .navbar {
            background-color: #0f172a;
            color: white;
            padding: 18px 60px;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
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

        /* SPLIT SCREEN MAIN CONTAINER */
        .main-container {
            display: flex;
            flex: 1;
            padding: 50px 60px;
            align-items: center;
            justify-content: center;
            gap: 60px;
        }

        /* LEFT SIDE: FEATURE PANEL (NO IMAGE RISK) */
        .left-side { 
            flex: 1; 
            max-width: 500px;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            padding: 45px;
            border-radius: 16px;
            color: white;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }
        .left-side h2 { font-size: 28px; font-weight: 800; margin-bottom: 16px; color: #ffffff; }
        .left-side p { font-size: 15px; color: #94a3b8; line-height: 1.6; margin-bottom: 35px; }
        
        .feature-item { display: flex; align-items: flex-start; gap: 16px; margin-bottom: 24px; }
        .feature-icon { 
            background-color: rgba(37, 99, 235, 0.15); 
            color: #3b82f6; 
            width: 36px; 
            height: 36px; 
            border-radius: 8px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 16px;
            flex-shrink: 0;
        }
        .feature-text h4 { font-size: 15px; font-weight: 600; color: #f1f5f9; margin-bottom: 4px; }
        .feature-text p { font-size: 13px; color: #94a3b8; margin: 0; line-height: 1.4; }

        /* RIGHT SIDE: CLEAN LOGIN CARD */
        .right-side { flex: 1; display: flex; justify-content: center; }
        .login-card {
            background: white;
            width: 100%;
            max-width: 440px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.03);
            border: 1px solid #e2e8f0;
        }
        .login-card h2 { font-size: 26px; color: #0f172a; font-weight: 700; margin-bottom: 6px; text-align: center; }
        .login-card .subtitle { font-size: 14px; color: #64748b; margin-bottom: 32px; text-align: center; }

        /* FORM MANAGEMENT */
        .form-group { margin-bottom: 24px; }
        .form-label { display: block; font-size: 14px; font-weight: 600; color: #334155; margin-bottom: 8px; }
        .input-wrapper { position: relative; display: flex; align-items: center; }
        .form-input { width: 100%; padding: 13px 16px; border: 1px solid #cbd5e1; border-radius: 8px; font-size: 14px; outline: none; color: #0f172a; }
        .form-input:focus { border-color: #2563eb; box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1); }
        .toggle-password { position: absolute; right: 16px; color: #64748b; cursor: pointer; }

        /* UTILITIES */
        .flex-options { display: flex; justify-content: space-between; align-items: center; font-size: 13px; margin-bottom: 28px; }
        .checkbox-label { display: flex; align-items: center; gap: 6px; color: #475569; cursor: pointer; }
        .forgot-link { color: #2563eb; text-decoration: none; font-weight: 600; }

        .submit-btn { width: 100%; background-color: #2563eb; color: white; border: none; padding: 14px; border-radius: 8px; font-size: 15px; font-weight: 600; cursor: pointer; transition: background 0.2s; }
        .submit-btn:hover { background-color: #1d4ed8; }
        
        .register-text { text-align: center; font-size: 13px; color: #64748b; margin-top: 26px; }
        .register-text a { color: #2563eb; text-decoration: none; font-weight: 700; }
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
    </nav>

    <main class="main-container">
        
        <div class="left-side">
            <h2>Manage Your Services Smarter</h2>
            <p>Access your dashboard to schedule, track, and manage all your residential and business service appointments effortlessly.</p>
            
            <div class="feature-item">
                <div class="feature-icon"><i class="fa-solid fa-clock-history"></i></div>
                <div class="feature-text">
                    <h4>Real-time Tracking</h4>
                    <p>Monitor your service professional's status and arrival instantly.</p>
                </div>
            </div>

            <div class="feature-item">
                <div class="feature-icon"><i class="fa-solid fa-shield-halved"></i></div>
                <div class="feature-text">
                    <h4>Verified Professionals</h4>
                    <p>Every single partner is background-checked and expert-certified.</p>
                </div>
            </div>

            <div class="feature-item">
                <div class="feature-icon"><i class="fa-solid fa-credit-card"></i></div>
                <div class="feature-text">
                    <h4>Secured Payments</h4>
                    <p>Hassle-free digital billing with clear automated pricing charts.</p>
                </div>
            </div>
        </div>

        <div class="right-side">
            <div class="login-card">
                <h2>Welcome Back!</h2>
                <p class="subtitle">Login to your portal account</p>

                <form action="${pageContext.request.contextPath}/LoginServlet" method="POST">
                    <div class="form-group">
                        <label class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-input" placeholder="name@company.com" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Password</label>
                        <div class="input-wrapper">
                            <input type="password" id="passwordField" name="password" class="form-input" placeholder="••••••••" required>
                            <i class="fa-solid fa-eye toggle-password" id="passwordToggle"></i>
                        </div>
                    </div>

                    <div class="flex-options">
                        <label class="checkbox-label">
                            <input type="checkbox" name="rememberMe"> Remember Me
                        </label>
                        <a href="#" class="forgot-link">Forgot Password?</a>
                    </div>

                    <button type="submit" class="submit-btn">Sign In</button>
                    <p class="register-text">Don't have an account? <a href="#">Register here</a></p>
                </form>
            </div>
        </div>
    </main>

    <script>
        const passwordField = document.getElementById('passwordField');
        const passwordToggle = document.getElementById('passwordToggle');

        passwordToggle.addEventListener('click', function () {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>

</body>
</html>