<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Smart Service - Register</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background-color: #9fe0f6;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Header Navbar */
header {
    background-color: #03153d;
    padding: 15px 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: rgb(255, 255, 255);
}

.logo-section {
    display: flex;
    align-items: center;
    gap: 10px;
}
.logo-icon {
    background-color: #3b82f6;
    padding: 8px;
    border-radius: 10%;
    font-size: 14px;
}

.logo-text h2 {
    font-size: 20px;
    font-weight: 700;
}

.logo-text p {
    font-size: 11px;
    color: #3d84db;
}

/* Main Container */
.main-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
}

.container {
    width: 900px;
    background: #ffffff;
    display: flex;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
}

/* Left Side Illustration */
.left-banner {
    width: 40%;
    background-color: #e8f4f9;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.left-banner img {
    max-width: 100%;
    height: auto;
}

/* Right Side Form */
.form-side {
    width: 60%;
    padding: 45px;
}

.form-side h1 {
    color: #0f172a;
    font-size: 26px;
    text-align: center;
    font-weight: 700;
    margin-bottom: 5px;
}

.form-side h3 {
    color: #64748b;
    font-size: 14px;
    text-align: center;
    font-weight: 400;
    margin-bottom: 20px;
}

/* Alert banners */
.alert {
    padding: 11px 16px;
    border-radius: 8px;
    font-size: 13.5px;
    font-weight: 500;
    margin-bottom: 18px;
    display: flex;
    align-items: center;
    gap: 8px;
    grid-column: span 2;
}
.alert-error {
    background: #fef2f2;
    border: 1px solid #fecaca;
    color: #dc2626;
}
.alert-success {
    background: #f0fdf4;
    border: 1px solid #bbf7d0;
    color: #16a34a;
}

/* Form Two-Column Grid */
.form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    column-gap: 20px;
    row-gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

label {
    color: #334155;
    font-weight: 500;
    font-size: 14px;
    margin-bottom: 8px;
}

.input-box {
    display: flex;
    align-items: center;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    overflow: hidden;
    transition: 0.3s;
}

.input-box i:first-child {
    padding-left: 15px;
    color: #94a3b8;
    font-size: 16px;
}

.input-box input {
    width: 100%;
    padding: 12px 14px;
    border: none;
    outline: none;
    font-size: 14px;
    background: transparent;
    color: #334155;
}

.toggle-password {
    padding-right: 15px;
    cursor: pointer;
    color: #94a3b8;
    transition: 0.2s;
}

.toggle-password:hover {
    color: #3b82f6;
}

.input-box:focus-within {
    border-color: #3b82f6;
    background: #ffffff;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
}

/* Button */
.btn-container {
    grid-column: span 2;
    margin-top: 15px;
}

button {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 8px;
    background-color: #1e40af;
    color: white;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s;
}

button:hover {
    background-color: #1d4ed8;
}

.footer-text {
    grid-column: span 2;
    margin-top: 20px;
    text-align: center;
    color: #64748b;
    font-size: 14px;
}

.footer-text a {
    color: #2563eb;
    font-weight: 600;
    text-decoration: none;
}

.footer-text a:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 768px) {
    .container {
        flex-direction: column;
        width: 100%;
    }
    .left-banner {
        display: none;
    }
    .form-side {
        width: 100%;
        padding: 25px;
    }
    .form-grid {
        grid-template-columns: 1fr;
    }
    .btn-container, .footer-text, .alert {
        grid-column: span 1;
    }
}
</style>
</head>
<body>

<header>
    <div class="logo-section">
        <div class="logo-icon"><i class="fa-solid fa-bolt-lightning"></i></div>
        <div class="logo-text">
            <h2>Smart Service</h2>
            <p>Booking System</p>
        </div>
    </div>
</header>

<div class="main-wrapper">
    <div class="container">

        <div class="left-banner">
<<<<<<< HEAD
            <img src="C:\Users\ADMIN\Pictures\Saved Pictures\istockphoto-1468757785-612x612.jpg">
=======
            <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=600" alt="Worker Illustration">
>>>>>>> c484fe1cc8b2d40ef75b0e02b99f1c74ce4925fe
        </div>

        <div class="form-side">
            <h1>Create an Account</h1>
            <h3>Register to get started</h3>

<<<<<<< HEAD
            <form id="registrationForm" action="profile" method="post" class="form-grid">
=======
            <form action="${pageContext.request.contextPath}/profile" method="post" class="form-grid">

                <%-- Show feedback messages from servlet redirect params --%>
                <% String error = request.getParameter("error"); %>
                <% if ("emailexists".equals(error)) { %>
                    <div class="alert alert-error">
                        <i class="fa-solid fa-circle-exclamation"></i>
                        This email is already registered. Please <a href="login.jsp" style="color:#dc2626;font-weight:700;">log in</a>.
                    </div>
                <% } else if ("emptyfield".equals(error)) { %>
                    <div class="alert alert-error">
                        <i class="fa-solid fa-circle-exclamation"></i>
                        All fields are required. Please fill in the form completely.
                    </div>
                <% } else if ("servererror".equals(error)) { %>
                    <div class="alert alert-error">
                        <i class="fa-solid fa-circle-exclamation"></i>
                        A server error occurred. Please try again later.
                    </div>
                <% } %>
>>>>>>> c484fe1cc8b2d40ef75b0e02b99f1c74ce4925fe

                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <div class="input-box">
                        <i class="fa-regular fa-user"></i>
<<<<<<< HEAD
                        <input type="text" id="fullname" name="fullname" placeholder="Enter full name" required>
=======
                        <input type="text" id="fullname" name="name" placeholder="Enter full name" required>
>>>>>>> c484fe1cc8b2d40ef75b0e02b99f1c74ce4925fe
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <div class="input-box">
                        <i class="fa-regular fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="Enter email" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="mobile">Mobile Number</label>
                    <div class="input-box">
                        <i class="fa-solid fa-phone"></i>
                        <input type="tel" id="mobile" name="mobile" placeholder="Enter mobile number"
                               pattern="[0-9]{10}" title="Please enter a valid 10-digit mobile number." required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-box">
                        <i class="fa-solid fa-lock"></i>
                        <input type="password" id="password" name="password" placeholder="Enter password"
                               pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&amp;]).{8,}"
                               title="Password must be at least 8 characters with a letter, number, and special character." required>
                        <i class="fa-solid fa-eye-slash toggle-password" data-target="password"></i>
                    </div>
                </div>

                <div class="form-group" style="grid-column: span 2;">
                    <label for="confirm-password">Confirm Password</label>
                    <div class="input-box">
                        <i class="fa-solid fa-lock"></i>
                        <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm password" required>
                        <i class="fa-solid fa-eye-slash toggle-password" data-target="confirm-password"></i>
                    </div>
                </div>

                <div class="btn-container">
                    <button type="submit">Register</button>
                </div>

                <div class="footer-text">
<<<<<<< HEAD
                    Already have an account? <a href="Login Form.html">Login here</a>
=======
                    Already have an account? <a href="${pageContext.request.contextPath}/pages/login.jsp">Login here</a>
>>>>>>> c484fe1cc8b2d40ef75b0e02b99f1c74ce4925fe
                </div>

            </form>
        </div>

    </div>
</div>

<script>
<<<<<<< HEAD
    const form = document.getElementById('registrationForm');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirm-password');
    const toggleButtons = document.querySelectorAll('.toggle-password');
    // 1. Password Visibility Toggling Feature
    toggleButtons.forEach(button => {
        button.addEventListener('click', function() {
            const targetId = this.getAttribute('data-target');
            const inputField = document.getElementById(targetId);
            
            if (inputField.type === 'password') {
                inputField.type = 'text';
                this.classList.remove('fa-eye-slash');
                this.classList.add('fa-eye');
            } else {
                inputField.type = 'password';
                this.classList.remove('fa-eye');
                this.classList.add('fa-eye-slash');
=======
document.addEventListener("DOMContentLoaded", function () {

    const form = document.querySelector("form");
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirm-password");
    const toggleButtons = document.querySelectorAll(".toggle-password");

    // Password Visibility Toggle
    toggleButtons.forEach(function(button) {
        button.addEventListener("click", function () {
            const targetId = this.getAttribute("data-target");
            const inputField = document.getElementById(targetId);
            if (inputField) {
                if (inputField.type === "password") {
                    inputField.type = "text";
                    this.classList.remove("fa-eye-slash");
                    this.classList.add("fa-eye");
                } else {
                    inputField.type = "password";
                    this.classList.remove("fa-eye");
                    this.classList.add("fa-eye-slash");
                }
>>>>>>> c484fe1cc8b2d40ef75b0e02b99f1c74ce4925fe
            }
        });
    });

    // 2. Form Field Matching Verification Rules
    function validatePasswordMatch() {
        if (password.value !== confirmPassword.value) {
            confirmPassword.setCustomValidity("Passwords do not match");
        } else {
            confirmPassword.setCustomValidity(""); 
        }
    }

    password.addEventListener('change', validatePasswordMatch);
    confirmPassword.addEventListener('keyup', validatePasswordMatch);

<<<<<<< HEAD
    form.addEventListener('submit', function(event) {
        validatePasswordMatch();
        if (!form.checkValidity()) {
            event.preventDefault(); 
        }
    });
=======
    if (form) {
        form.addEventListener("submit", function (event) {
            validatePasswordMatch();
            if (!form.checkValidity()) {
                event.preventDefault();
            }
        });
    }

});
>>>>>>> c484fe1cc8b2d40ef75b0e02b99f1c74ce4925fe
</script>

</body>
</html>
