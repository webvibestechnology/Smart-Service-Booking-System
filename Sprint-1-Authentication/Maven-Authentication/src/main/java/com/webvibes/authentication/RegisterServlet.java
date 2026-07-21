package com.webvibes.authentication;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/profile")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || mobile == null || mobile.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            response.sendRedirect("pages/registration.jsp?error=emptyfield");
            return;
        }

        // Default role for every new registration
        String role = "USER";

        User user = new User(name, email, mobile, password, role);

        UserDAO userDAO = new UserDAO();

        String result = userDAO.registerUser(user);

        if ("success".equals(result)) {
            response.sendRedirect("pages/login.jsp?msg=registersuccess");
        } else if ("duplicate".equals(result)) {
            response.sendRedirect("pages/registration.jsp?error=emailexists");
        } else {
            response.sendRedirect("pages/registration.jsp?error=servererror");
        }
    }
}