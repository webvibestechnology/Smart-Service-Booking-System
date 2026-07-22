package com.webvibes;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Receives role + name from Sprint-1 via URL params,
 * stores them in Sprint-2's own session, then redirects
 * to the appropriate page.
 *
 * URL: /auth?role=ADMIN&name=Swati&redirect=manageServices
 */
@WebServlet("/auth")
public class AuthHandoffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role     = request.getParameter("role");
        String name     = request.getParameter("name");
        String redirect = request.getParameter("redirect");

        // Store in Sprint-2 session
        HttpSession session = request.getSession(true);
        if (role != null && !role.trim().isEmpty()) {
            session.setAttribute("role", role.toUpperCase());
        }
        if (name != null && !name.trim().isEmpty()) {
            session.setAttribute("userName", name);
        }

        // Redirect to requested page (default: viewServices)
        if ("manageServices".equals(redirect)) {
            response.sendRedirect(request.getContextPath() + "/manageServices");
        } else {
            response.sendRedirect(request.getContextPath() + "/viewServices");
        }
    }
}
