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
    background:linear-gradient(-45deg,
    #00c6ff,
    #0072ff,
    #8e2de2,
    #4a00e0,
    #43cea2,
    #185a9d);
    background-size:400% 400%;
    animation:bg 12s ease infinite;
}

@keyframes bg{
    0%{background-position:0% 50%;}
    50%{background-position:100% 50%;}
    100%{background-position:0% 50%;}
}

.container{
    width:420px;
    background:rgba(255,255,255,.18);
    backdrop-filter:blur(18px);
    border:1px solid rgba(255,255,255,.3);
    padding:35px;
    border-radius:20px;
    box-shadow:0 20px 50px rgba(0,0,0,.35);
}

.container h1{
    color:white;
    text-align:center;
    margin-bottom:8px;
}

.container h3{
    color:#f1f1f1;
    text-align:center;
    margin-bottom:25px;
}

label{
    color:white;
    font-weight:600;
    display:block;
    margin-top:15px;
    margin-bottom:8px;
}

.input-box{
    display:flex;
    align-items:center;
    background:white;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
}

.input-box i{
    width:50px;
    text-align:center;
    color:#667eea;
    font-size:18px;
}

.input-box input,
.input-box select{
    width:100%;
    padding:14px;
    border:none;
    outline:none;
    font-size:15px;
    background:transparent;
}

.input-box:focus-within{
    box-shadow:0 0 15px #00e5ff;
}

.gender{
    display:flex;
    justify-content:space-between;
    margin-top:10px;
}

.gender label{
    color:white;
    display:flex;
    align-items:center;
    gap:5px;
}

button{
    width:100%;
    margin-top:25px;
    padding:15px;
    border:none;
    border-radius:30px;
    background:linear-gradient(90deg,#00c6ff,#0072ff,#8e2de2);
    color:white;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    transition:.4s;
}

button:hover{
    transform:translateY(-4px);
    box-shadow:0 10px 25px rgba(0,0,0,.35);
}

p{
    margin-top:20px;
    text-align:center;
    color:white;
}

a{
    color:#fae20b;
    font-weight:bold;
    text-decoration:none;
}

a:hover{
    text-decoration:underline;
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
placeholder="Enter  Your Full Name"
required>

<label for="email">Email Address</label>
<input
type="email"
id="email"
name="email"
placeholder="Enter Your Email"
required>

<label for="mobile">Contact Number</label>
<input
type="tel"
id="mobile"
name="mobile"
placeholder="Enter Your Mobile Number"
pattern="[0-9]{10}"
required>

<label for="password">Password</label>
<input
type="password"
id="password"
name="password"
placeholder="Enter Your Password"
pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{8,}"
title="Password must contain at least 8 characters, one letter, one number, and one special character."
required>

<label for="comformpassword">Comfirm Password</label>
<input
type="comfirm password"
id="comfirm password"
name="comfirm password"
placeholder="Enter comfirm password"
pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{8,}"
title="Password must contain at least 8 characters, one letter, one number, and one special character."
required>


<label>Gender</label>

<div class="gender">
<label><input type="radio" name="gender" value="Male" required> Male</label>
<label><input type="radio" name="gender" value="Female"> Female</label>
<label><input type="radio" name="gender" value="Other"> Other</label>
</div>

<label for="country">City</label>

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