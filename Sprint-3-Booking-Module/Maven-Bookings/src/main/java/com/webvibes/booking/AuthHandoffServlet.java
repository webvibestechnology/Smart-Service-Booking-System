package com.webvibes.booking;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AuthHandoffServlet")
public class AuthHandoffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdParam = request.getParameter("userId");
        
        if (userIdParam != null && !userIdParam.trim().isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdParam);
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                
                // Auth handoff successful, dynamic redirect to core services list dashboard
                response.sendRedirect("bookService.jsp?serviceId=101");
                return;
            } catch (NumberFormatException e) {
                System.err.println("Auth handoff identity exception: " + e.getMessage());
            }
        }
        response.sendRedirect("login.jsp?error=auth_handoff_failed");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}