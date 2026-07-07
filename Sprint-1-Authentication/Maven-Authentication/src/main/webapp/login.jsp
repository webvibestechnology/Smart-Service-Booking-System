<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<h2>Login Page</h2>

<form action="<%=request.getContextPath()%>/login" method="post">

Email :
<input type="email" name="email" autocomplete="off" required>

<br><br>                   

Password :
<input type="password" name="password" autocomplete="new-password" required>

<br><br>

<input type="submit" value="Login">

</form>

<%
String msg = request.getParameter("msg");
if(msg != null){
%>

<p style="color:red;"><%= msg %></p>

<%
}
%>

</body>
</html>