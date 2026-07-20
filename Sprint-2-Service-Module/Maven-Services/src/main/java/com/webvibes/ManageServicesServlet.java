package com.webvibes;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Admin-facing service management table (Screen 10 in mockup).
 * URL: /manageServices
 */
@WebServlet("/manageServices")
public class ManageServicesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return false;
        String role = (String) session.getAttribute("role");
        return "ADMIN".equals(role);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }

        ServiceDAO dao = new ServiceDAO();
        List<Service> serviceList = dao.getAllServices();
        request.setAttribute("serviceList", serviceList);
        request.getRequestDispatcher("/pages/manageServices.jsp").forward(request, response);
    }
}
