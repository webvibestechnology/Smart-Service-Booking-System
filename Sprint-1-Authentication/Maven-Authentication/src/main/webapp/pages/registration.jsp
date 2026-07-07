<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Form</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
    background:linear-gradient(-45deg,#4facfe,#00f2fe,#43e97b,#38f9d7,#667eea,#764ba2);
    background-size:400% 400%;
    animation:gradient 12s ease infinite;
}

@keyframes gradient{
    0%{background-position:0% 50%;}
    50%{background-position:100% 50%;}
    100%{background-position:0% 50%;}
}

.container{
    width:430px;
    background:rgba(255,255,255,0.96);
    padding:35px;
    border-radius:20px;
    box-shadow:0 20px 40px rgba(0,0,0,0.25);
    backdrop-filter:blur(15px);
    transition:0.4s;
}

.container:hover{
    transform:translateY(-8px);
    box-shadow:0 25px 50px rgba(0,0,0,.35);
}

h1{
    text-align:center;
    color:#4b3ca7;
    margin-bottom:8px;
    font-size:32px;
}

h3{
    text-align:center;
    color:#555;
    margin-bottom:20px;
}

label{
    display:block;
    margin-top:15px;
    margin-bottom:6px;
    font-weight:600;
    color:#333;
}

input,
select{
    width:100%;
    padding:12px;
    border:2px solid #ebf0d3;
    border-radius:10px;
    font-size:15px;
    transition:.3s;
    background:#f8f9ff;
}

input:focus,
select:focus{
    border-color:#667eea;
    box-shadow:0 0 12px rgba(102,126,234,.35);
    outline:none;
    background:#fff;
}

.gender{
    display:flex;
    justify-content:space-around;
    margin-top:10px;
}

.gender label{
    display:flex;
    align-items:center;
    gap:5px;
    font-weight:500;
}

button{
    width:100%;
    margin-top:25px;
    padding:14px;
    border:none;
    border-radius:12px;
    background:linear-gradient(90deg,#4facfe,#667eea,#764ba2);
    color:rgb(243, 243, 243);
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}

button:hover{
    transform:scale(1.03);
    background:linear-gradient(90deg,#667eea,#764ba2,#4facfe);
}

p{
    text-align:center;
    margin-top:20px;
    color:#555;
}

a{
    color:#667eea;
    text-decoration:none;
    font-weight:bold;
}

a:hover{
    color:#764ba2;
    text-decoration:underline;
}

@media(max-width:500px){
    .container{
        width:90%;
        padding:25px;
    }

    .gender{
        flex-direction:column;
        gap:10px;
    }
}
</style>
</head>

<body>

<div class="container">

<h1>samart service Booking</h1>
<h3>User Registration</h3>

<form action="profile" method="post">

<label for="fullname">Full Name</label>
<input
type="text"
id="fullname"
name="fullname"
placeholder="Enter Full Name"
required>

<label for="email">Email Address</label>
<input
type="email"
id="email"
name="email"
placeholder="Enter Email"
required>

<label for="mobile">Contact Number</label>
<input
type="tel"
id="mobile"
name="mobile"
placeholder="Enter Mobile Number"
pattern="[0-9]{10}"
required>

<label for="password">Password</label>
<input
type="password"
id="password"
name="password"
placeholder="Enter Password"
pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{8,}"
title="Password must contain at least 8 characters, one letter, one number, and one special character."
required>

<label>Gender</label>

<div class="gender">
<label><input type="radio" name="gender" value="Male" required> Male</label>
<label><input type="radio" name="gender" value="Female"> Female</label>
<label><input type="radio" name="gender" value="Other"> Other</label>
</div>

<label for="country">Country</label>

<select id="city" name="City" required>
<option value="">Select City</option>
<option>Pune</option>
<option>Mumbai</option>
<option>Nashik</option>
<option>Jalgaon</option>
<option>pachora</option>
</select>

<button type="submit">Register</button>

<p>
Already have an account?
<a href="Login Form.html">Login Here</a>
</p>

</form>

</div>

</body>
</html>