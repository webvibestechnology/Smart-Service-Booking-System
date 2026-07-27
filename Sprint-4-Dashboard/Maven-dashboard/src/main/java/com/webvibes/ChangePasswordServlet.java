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

    UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("changePassword.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId = (Integer) session.getAttribute("userId");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {

            request.setAttribute("error",
                    "New Password and Confirm Password do not match.");

            request.getRequestDispatcher("changePassword.jsp")
                    .forward(request, response);

            return;
        }

        boolean valid = dao.validatePassword(userId, currentPassword);

        if (!valid) {

            request.setAttribute("error",
                    "Current Password is incorrect.");

            request.getRequestDispatcher("changePassword.jsp")
                    .forward(request, response);

            return;
        }

        boolean updated = dao.updatePassword(userId, newPassword);

        if (updated) {

            session.setAttribute("success",
                    "Password Updated Successfully.");

            response.sendRedirect("dashboard");

        } else {

            request.setAttribute("error",
                    "Unable to update password.");

            request.getRequestDispatcher("changePassword.jsp")
                    .forward(request, response);

        }

    }

}