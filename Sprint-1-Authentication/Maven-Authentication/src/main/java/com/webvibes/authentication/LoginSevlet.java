package com.webvibes.authentication;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Email : " + email);
        System.out.println("Password : " + password);

      if (email != null && password != null && !email.isEmpty() && !password.isEmpty()) {

            HttpSession session = request.getSession(true);

            session.setAttribute("userId", 1);
            session.setAttribute("userName", "Hemangi");
            session.setAttribute("userEmail", email);
            session.setAttribute("userRole", "USER");

            session.setMaxInactiveInterval(30 * 60);

            response.sendRedirect("Dashboard.jsp");

        } else {

            response.sendRedirect("Login.jsp?msg=Invalid Login");

        }
    }
}