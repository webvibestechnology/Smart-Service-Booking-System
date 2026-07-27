package com.webvibes.booking;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Receives role + userId + name from Sprint-1 via URL params,
 * stores them in Sprint-3 session, then redirects to the target page.
 *
 * URL: /auth?role=USER&userId=3&name=Swati&redirect=myBookings
 */
@WebServlet("/auth")
public class AuthHandoffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role     = request.getParameter("role");
        String name     = request.getParameter("name");
        String userIdStr= request.getParameter("userId");
        String redirect = request.getParameter("redirect");

        HttpSession session = request.getSession(true);

        if (role != null && !role.trim().isEmpty()) {
            session.setAttribute("role", role.toUpperCase());
        }
        if (name != null && !name.trim().isEmpty()) {
            session.setAttribute("userName", name);
        }
        if (userIdStr != null && !userIdStr.trim().isEmpty()) {
            try {
                session.setAttribute("userId", Integer.parseInt(userIdStr));
            } catch (NumberFormatException ignored) {}
        }

        // Route to the right page
        switch (redirect != null ? redirect : "") {
            case "myBookings":
                response.sendRedirect(request.getContextPath() + "/myBookings");
                break;
            case "manageBookings":
                response.sendRedirect(request.getContextPath() + "/manageBookings");
                break;
            case "providerBookings":
                response.sendRedirect(request.getContextPath() + "/providerBookings");
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/myBookings");
        }
    }
}
