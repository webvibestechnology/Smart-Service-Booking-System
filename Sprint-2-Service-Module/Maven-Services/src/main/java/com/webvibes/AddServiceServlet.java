package com.webvibes;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddServiceServlet")
public class AddServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        String serviceName = request.getParameter("serviceName");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String status = request.getParameter("status");

        // Create Service object
        Service service = new Service();
        service.setServiceName(serviceName);
        service.setCategory(category);
        service.setDescription(description);
        service.setPrice(price);
        service.setStatus(status);

        // Call DAO
        ServiceDAO dao = new ServiceDAO();
        boolean result = dao.addService(service);

        if (result) {
            request.setAttribute("message", "Service Added Successfully!");
        } else {
            request.setAttribute("message", "Failed to Add Service!");
        }

        // Return to JSP
        request.getRequestDispatcher("/pages/addService.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	response.sendRedirect(request.getContextPath() + "/pages/addService.jsp");
    }
}