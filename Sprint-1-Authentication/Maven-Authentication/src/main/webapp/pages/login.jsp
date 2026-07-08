<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Service Booking System - Login</title>
    <!-- Professional Icons (FontAwesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background-color: #f8fafc; min-height: 100vh; display: flex; flex-direction: column; }

        /* PREMIUM GLASSMORPHIC NAVBAR */
        .navbar {
            background-color: #0f172a;
            color: white;
            padding: 16px 60px;
            display: flex;
            align-items: center;
            box-shadow: 0 10px 15px -3px rgba(15, 23, 42, 0.08);
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

        /* SPLIT SCREEN MAIN CONTAINER */
        .main-container {
            display: flex;
            flex: 1;
            padding: 40px 60px;
            align-items: center;
            justify-content: center;
            gap: 50px;
            background: #f8fafc;
        }

        /* LEFT SIDE: FEATURE PANEL (PREMIUM GRADIENT LOOK) */
        .left-side { 
            flex: 1; 
            max-width: 520px;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            padding: 50px;
            border-radius: 24px;
            color: white;
            box-shadow: 0 25px 50px -12px rgba(15, 23, 42, 0.25);
            position: relative;
            overflow: hidden;
        }
        .left-side::before {
            content: ''; position: absolute; width: 200px; height: 200px; background: rgba(37, 99, 235, 0.15); filter: blur(80px); bottom: -30px; left: -30px; border-radius: 50%;
        }
        .left-side h2 { font-size: 32px; font-weight: 800; margin-bottom: 16px; line-height: 1.2; letter-spacing: -0.5px; }
        .left-side h2 span { background: linear-gradient(to right, #38bdf8, #3b82f6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .left-side p { font-size: 15px; color: #94a3b8; line-height: 1.6; margin-bottom: 40px; }
        
        .feature-item { display: flex; align-items: flex-start; gap: 18px; margin-bottom: 28px; transition: transform 0.2s; }
        .feature-item:hover { transform: translateX(5px); }
        .feature-icon { 
            background: rgba(59, 130, 246, 0.12); 
            color: #38bdf8; 
            width: 42px; 
            height: 42px; 
            border-radius: 12px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 18px;
            flex-shrink: 0;
            border: 1px solid rgba(59, 130, 246, 0.2);
        }
        .feature-text h4 { font-size: 16px; font-weight: 600; color: #f1f5f9; margin-bottom: 4px; }
        .feature-text p { font-size: 13.5px; color: #94a3b8; margin: 0; line-height: 1.5; }

        /* RIGHT SIDE: CLEAN GLASS CARD */
        .right-side { flex: 1; display: flex; justify-content: center; }
        .login-card {
            background: white;
            width: 100%;
            max-width: 450px;
            padding: 45px;
            border-radius: 24px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.03), 0 10px 10px -5px rgba(0, 0, 0, 0.01);
            border: 1px solid #e2e8f0;
            position: relative;
        }
        .login-card::before {
            content: ''; position: absolute; top: 0; left: 0; right: 0; height: 5px;
            background: linear-gradient(90deg, #3b82f6, #2563eb);
            border-top-left-radius: 24px; border-top-right-radius: 24px;
        }
        .login-card h2 { font-size: 28px; color: #0f172a; font-weight: 800; margin-bottom: 8px; text-align: center; letter-spacing: -0.5px; }
        .login-card .subtitle { font-size: 14px; color: #64748b; margin-bottom: 35px; text-align: center; }

        /* INPUT STYLES WITH GLOW EFFECTS */
        .form-group { margin-bottom: 24px; }
        .form-label { display: block; font-size: 14px; font-weight: 600; color: #334155; margin-bottom: 8px; }
        .input-wrapper { position: relative; display: flex; align-items: center; width: 100%; }
        .form-input { width: 100%; padding: 13px 16px; border: 1px solid #cbd5e1; border-radius: 10px; font-size: 14.5px; outline: none; color: #0f172a; transition: all 0.2s ease; }
        .form-input:focus { border-color: #2563eb; box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12); }
        .toggle-password { position: absolute; right: 16px; color: #64748b; cursor: pointer; font-size: 15px; transition: color 0.2s; }
        .toggle-password:hover { color: #2563eb; }

        /* REMEMBER ME & SUBMIT */
        .flex-options { display: flex; justify-content: space-between; align-items: center; font-size: 13.5px; margin-bottom: 30px; }
        .checkbox-label { display: flex; align-items: center; gap: 8px; color: #475569; cursor: pointer; font-weight: 500; }
        .checkbox-label input { width: 16px; height: 16px; border-radius: 4px; border: 1px solid #cbd5e1; cursor: pointer; }
        .forgot-link { color: #2563eb; text-decoration: none; font-weight: 600; transition: color 0.2s; }
        .forgot-link:hover { color: #1d4ed8; text-decoration: underline; }

        .submit-btn { 
            width: 100%; 
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%); 
            color: white; border: none; padding: 14px; border-radius: 10px; 
            font-size: 15px; font-weight: 600; cursor: pointer; 
            box-shadow: 0 4px 14px rgba(37, 99, 235, 0.3);
            transition: all 0.2s ease; 
        }
        .submit-btn:hover { background: linear-gradient(135deg, #1d4ed8 0%, #1e40af 100%); transform: translateY(-1px); box-shadow: 0 6px 20px rgba(37, 99, 235, 0.4); }
        
        .register-text { text-align: center; font-size: 14px; color: #64748b; margin-top: 28px; }
        .register-text a { color: #2563eb; text-decoration: none; font-weight: 700; transition: color 0.2s; }
        .register-text a:hover { color: #1d4ed8; text-decoration: underline; }
    </style>
</head>
<body>

    <!-- Professional Top Header -->
    <nav class="navbar">
        <div class="brand-section">
            <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
            <div>
                <div class="brand-name">Smart Service</div>
                <div class="brand-sub">BOOKING PORTAL</div>
            </div>
        </div>
    </nav>

    <!-- Split Screen Container -->
    <main class="main-container">
        
        <!-- Left Side: Features Showcase -->
        <div class="left-side">
            <h2>Manage Your <span>Services Smarter</span></h2>
            <p>Access your dashboard to schedule, track, and manage all your residential and business service appointments effortlessly.</p>
            
            <div class="feature-item">
                <div class="feature-icon"><i class="fa-solid fa-clock-history"></i></div>
                <div class="feature-text">
                    <h4>Real-time Tracking</h4>
                    <p>Monitor your service professional's status and arrival instantly.</p>
                </div>
            </div>

            <div class="feature-item">
                <div class="feature-icon"><i class="fa-solid fa-user-shield"></i></div>
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

        <!-- Right Side: Interactive Login Form -->
        <div class="right-side">
            <div class="login-card">
                <h2>Welcome Back!</h2>
                <p class="subtitle">Login to your portal account</p>

                <!-- PRODUCTION DYNAMIC ROUTE FOR SERVLET -->
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

    <!-- Password Masking Toggle Logic -->
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