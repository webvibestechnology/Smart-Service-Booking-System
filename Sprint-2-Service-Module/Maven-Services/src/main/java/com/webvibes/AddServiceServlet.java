package com.webvibes;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addService")
public class AddServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Admin role check helper
    private boolean isAdmin(HttpServletRequest request) {
        jakarta.servlet.http.HttpSession s = request.getSession(false);
        return s != null && "ADMIN".equals(s.getAttribute("role"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }
        // Show the Add Service form
        request.getRequestDispatcher("/pages/addService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }

        String serviceName  = request.getParameter("serviceName");
        String category     = request.getParameter("category");
        String description  = request.getParameter("description");
        String status       = request.getParameter("status");

        double price = 0;
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid price value.");
            request.getRequestDispatcher("/pages/addService.jsp").forward(request, response);
            return;
        }

        Service service = new Service();
        service.setServiceName(serviceName);
        service.setCategory(category);
        service.setDescription(description);
        service.setPrice(price);
        service.setStatus(status);

        ServiceDAO dao = new ServiceDAO();
        boolean result = dao.addService(service);

        if (result) {
            response.sendRedirect(request.getContextPath() + "/manageServices");
        } else {
            request.setAttribute("error", "Failed to add service. Please try again.");
            request.getRequestDispatcher("/pages/addService.jsp").forward(request, response);
        }
    }
}
