<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - Smart Service System</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>
    
       body {
            background: linear-gradient(135deg,#eef5ff,#d9e8ff,#f7fbff);
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .main-wrapper {
            flex: 1;
        }

        /* Navbar Styling */
        .navbar {
            background: #0f172a;
            padding: 15px 40px;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 10px rgba(0,0,0,.2);
        }

        .brand {
            display: flex;
            align-items: center;
            color: white;
            text-decoration: none;
        }

        .logo {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            border-radius: 12px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            color: white;
            margin-right: 12px;
        }

        .brand h3 {
            margin: 0;
            font-size: 22px;
            line-height: 1.1;
        }

        .brand small {
            color: #38bdf8;
            font-size: 11px;
            letter-spacing: 0.5px;
        }

        .navbar-nav .nav-link {
            color: #cbd5e1;
            margin: 0 8px;
            font-weight: 500;
        }

        .navbar-nav .nav-link:hover {
            color: #38bdf8;
        }


        .main-card {
            background: #fff;
            border-radius: 16px;
            padding: 35px;
            margin-top: 40px;
            box-shadow: 0 12px 30px rgba(0,0,0,.06);
            border: 1px solid #e2e8f0;
            max-width: 900px;
            margin-left: auto;
          }
        

		.main-card:hover{
		    transform: translateY(-3px);
		    box-shadow:0 20px 45px rgba(15,23,42,.12);
		}

		.form-control{
		    height:48px;
		    border-radius:10px;
		    border:1px solid #cbd5e1;
		    transition:.25s;
		}
		
		.form-control:focus{
		    border-color:#2563eb;
		    box-shadow:0 0 0 .2rem rgba(37,99,235,.15);
		}
		
		.input-group-text{
		    background:#f8fafc;
		}
		        

        .form-label {
            font-weight: 600;
            color: #334155;
            font-size: 0.9rem;
        }

        .form-control {
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 0.95rem;
        }

        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 0.25rem rgba(37, 99, 235, 0.15);
        }

        .toggle-password {
            cursor: pointer;
            background-color: #f8fafc;
        }

        .toggle-password:hover {
            background-color: #e2e8f0;
        }

        .btn-update {
            background: #2563eb;
            color: white;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 600;
            border: none;
            transition: background-color 0.2s;
        }

        .btn-update:hover {
            background: #1d4ed8;
            color: white;
        }

        
        .strength-meter {
            height: 4px;
            border-radius: 2px;
            background-color: #e2e8f0;
            transition: all 0.3s ease;
        }
        
       
        .footer {
            margin-top: auto;
            background: #0f172a;
            color: #94a3b8;
            padding: 18px;
            font-size: 0.875rem;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="main-wrapper">
    <!-- ==================== HEADER / NAVBAR ==================== -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">

            <a class="brand" href="home.jsp">
                <div class="logo">
                    <i class="fa-solid fa-bolt-lightning"></i>
                </div>
                <div>
                    <h3>Smart Service</h3>
                    <small>BOOKING SYSTEM</small>
                </div>
            </a>

            <button class="navbar-toggler bg-light"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#menu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-center" id="menu">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageServices.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
            </div>

        </div>
    </nav>

    <!-- ==================== MAIN CONTENT ==================== -->
    <div class="container pb-5">
    	<div class="main-card">
           <div class="row align-items-center g-4">
                <div class="col-md-7">
	                <h4 class="fw-bold mb-2">
						<i class="fa-solid fa-key text-primary me-2"></i>
							Change Password
					</h4>
					<p class="text-muted">
							Update your password to keep your account secure.
					</p>
                   
                    <% 
                        String status = request.getParameter("status");
                        if ("success".equals(status)) {
                    %>
                        <div class="alert alert-success alert-dismissible fade show small" role="alert">
                            <i class="fa-solid fa-circle-check me-2"></i>Password changed successfully!
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% 
                        } else if ("error".equals(status)) {
                    %>
                        <div class="alert alert-danger alert-dismissible fade show small" role="alert">
                            <i class="fa-solid fa-circle-exclamation me-2"></i>Current password is incorrect or process failed.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <form action="changePassword" method="post" id="passwordForm" novalidate>
                        
                        <!-- Current Password -->
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">Current Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa-solid fa-lock text-muted"></i></span>
                                <input type="password" 
                                       class="form-control" 
                                       id="currentPassword" 
                                       name="currentPassword" 
                                       placeholder="Enter current password"
                                       required>
                                <span class="input-group-text toggle-password" onclick="toggleVisibility('currentPassword', this)">
                                    <i class="fa-solid fa-eye text-muted"></i>
                                </span>
                            </div>
                        </div>

                        <!-- New Password -->
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">New Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa-solid fa-shield-halved text-muted"></i></span>
                                <input type="password" 
                                       class="form-control" 
                                       id="newPassword" 
                                       name="newPassword" 
                                       placeholder="At least 8 characters" 
                                       minlength="8"
                                       required>
                                <span class="input-group-text toggle-password" onclick="toggleVisibility('newPassword', this)">
                                    <i class="fa-solid fa-eye text-muted"></i>
                                </span>
                            </div>
                            
                            <div class="strength-meter mt-2" id="strengthMeter"></div>
                        </div>

                        <!-- Confirm New Password -->
                        <div class="mb-4">
                            <label for="confirmPassword" class="form-label">Confirm New Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa-solid fa-check-double text-muted"></i></span>
                                <input type="password" 
                                       class="form-control" 
                                       id="confirmPassword" 
                                       name="confirmPassword" 
                                       placeholder="Re-enter new password" 
                                       required>
                                <span class="input-group-text toggle-password" onclick="toggleVisibility('confirmPassword', this)">
                                    <i class="fa-solid fa-eye text-muted"></i>
                                </span>
                            </div>
                            <div id="matchFeedback" class="form-text small mt-1"></div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="d-flex gap-2 pt-2">
                           <a href="manageServices.jsp" class="btn btn-outline-secondary w-50 py-2">
								<i class="fa-solid fa-arrow-left me-2"></i>
									Cancel
						  </a>
                            <button type="submit" class="btn btn-update w-50 py-2">
   								 <i class="fa-solid fa-floppy-disk me-2"></i>
    										Update Password
							</button>
                        </div>

                    </form>
                </div>

               
                <div class="col-md-5 text-center">
                    
                    <img src="https://img.magnific.com/premium-photo/reset-password-concept-lock-icon-security-code-showing-change-password-page-while-business-person-using-laptop-computer-vertical-style-cyber-security-technology-website-data-protection_36367-7807.jpg?semt=ais_hybrid&w=740&q=80" 
     					 alt="Change Password Illustration" 
     					 class="card-side-image img-fluid">
     
                </div>

            </div>
        </div>

    </div>
</div>

<!-- ==================== FOOTER ==================== -->
<footer class="footer">
    © 2026 Smart Service Booking System. All rights reserved.
</footer>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Interactive Logic -->
<script>
// Show/Hide Password Toggle
function toggleVisibility(inputId, toggleBtn) {
    const input = document.getElementById(inputId);
    const icon = toggleBtn.querySelector('i');
    
    if (input.type === "password") {
        input.type = "text";
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        input.type = "password";
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}

// Dynamic Input Match & Strength Checkers
const newPass = document.getElementById('newPassword');
const confirmPass = document.getElementById('confirmPassword');
const feedback = document.getElementById('matchFeedback');
const strengthMeter = document.getElementById('strengthMeter');

newPass.addEventListener('input', () => {
    const val = newPass.value;
    if (val.length === 0) {
        strengthMeter.style.width = '0%';
        strengthMeter.style.backgroundColor = '#e2e8f0';
    } else if (val.length < 6) {
        strengthMeter.style.width = '33%';
        strengthMeter.style.backgroundColor = '#ef4444'; // Red
    } else if (val.length < 10) {
        strengthMeter.style.width = '66%';
        strengthMeter.style.backgroundColor = '#f59e0b'; // Amber
    } else {
        strengthMeter.style.width = '100%';
        strengthMeter.style.backgroundColor = '#10b981'; // Green
    }
    validateMatch();
});

confirmPass.addEventListener('input', validateMatch);

function validateMatch() {
    if (!confirmPass.value) {
        feedback.textContent = '';
        confirmPass.classList.remove('is-valid', 'is-invalid');
        return;
    }

    if (newPass.value === confirmPass.value) {
        feedback.textContent = 'Passwords match';
        feedback.className = 'form-text small mt-1 text-success';
        confirmPass.classList.remove('is-invalid');
        confirmPass.classList.add('is-valid');
    } else {
        feedback.textContent = 'Passwords do not match';
        feedback.className = 'form-text small mt-1 text-danger';
        confirmPass.classList.remove('is-valid');
        confirmPass.classList.add('is-invalid');
    }
}

// Form Submission Safeguard
document.getElementById('passwordForm').addEventListener('submit', function(e) {
    if (newPass.value !== confirmPass.value) {
        e.preventDefault();
        alert('Please ensure both new passwords match before submitting.');
    }
});
</script>

</body>
</html>