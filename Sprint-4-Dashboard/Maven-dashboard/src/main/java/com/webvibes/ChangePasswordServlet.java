package com.webvibes;

import java.io.IOException;

import com.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
           return;
        }

        Integer userId = (Integer) session.getAttribute("userId");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Empty field validation
        if (currentPassword == null || currentPassword.trim().isEmpty()
                || newPassword == null || newPassword.trim().isEmpty()
                || confirmPassword == null || confirmPassword.trim().isEmpty()) {

            request.setAttribute("error", "All fields are required.");

            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
    }
            return;
        }

        // Password length validation
        if (newPassword.length() < 8) {

            request.setAttribute("error",
                    "Password must be at least 8 characters.");

            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
            return;
        }

        // Confirm password validation
        if (!newPassword.equals(confirmPassword)) {

            request.setAttribute("error",
                    "New Password and Confirm Password do not match.");

            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);

            return;
        }

        // Prevent same password
        if (currentPassword.equals(newPassword)) {

            request.setAttribute("error",
                    "New password cannot be the same as the current password.");

            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
            return;
        }

        try {

            boolean valid = dao.validatePassword(userId, currentPassword);

            if (!valid) {

                request.setAttribute("error",
                    "Current password is incorrect.");

                request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
                return;
            }

            boolean updated = dao.updatePassword(userId, newPassword);

            if (updated) {

                session.setAttribute("success",
                        "Password updated successfully.");

                response.sendRedirect(request.getContextPath() + "/pages/userDashboard.jsp");

            } else {

                request.setAttribute("error",
                        "Unable to update password.");

                request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
                
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute("error",
                    "Something went wrong. Please try again.");

            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
        }
    }
}