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

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        User user = dao.login(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if (user.getRole().equalsIgnoreCase("ADMIN")) {
                response.sendRedirect("pages/adminDashboard.jsp");

            } else if (user.getRole().equalsIgnoreCase("USER")) {
                response.sendRedirect("pages/userDashboard.jsp");

            } else if (user.getRole().equalsIgnoreCase("PROVIDER")) {
                response.sendRedirect("pages/providerDashboard.jsp");
            }

        } else {

            request.setAttribute("error", "Invalid Email or Password");
            request.getRequestDispatcher("pages/login.jsp")
                   .forward(request, response);
        }
    }
}