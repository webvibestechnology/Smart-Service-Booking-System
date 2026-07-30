package com.dashboard.servlet;

import com.dashboard.dao.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private final DashboardDAO dashboardDAO = new DashboardDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Session validation for ADMIN role
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Fetching metrics data
        int totalServices = dashboardDAO.getTotalServices();
        int totalBookings = dashboardDAO.getTotalBookings();
        int pendingBookings = dashboardDAO.getBookingCountByStatus("PENDING");
        double totalRevenue = dashboardDAO.getTotalRevenue();
        List<Map<String, Object>> recentBookings = dashboardDAO.getRecentBookings(5);

        // Setting request scope attributes
        request.setAttribute("totalServices", totalServices);
        request.setAttribute("totalBookings", totalBookings);
        request.setAttribute("pendingBookings", pendingBookings);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("recentBookings", recentBookings);

        // Routing to view
        request.getRequestDispatcher("/WEB-INF/views/adminDashboard.jsp").forward(request, response);
    }
}
