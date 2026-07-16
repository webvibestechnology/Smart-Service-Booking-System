package com.webvibes;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateService")
public class UpdateServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Admin role check helper
    private boolean isAdmin(HttpServletRequest request) {
        jakarta.servlet.http.HttpSession s = request.getSession(false);
        return s != null && "ADMIN".equals(s.getAttribute("role"));
    }

    /** Show edit form pre-filled with current data */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }

        int id = Integer.parseInt(idParam);
        ServiceDAO dao = new ServiceDAO();
        Service service = dao.getServiceById(id);

        if (service == null) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }

        request.setAttribute("service", service);
        request.getRequestDispatcher("/pages/editService.jsp").forward(request, response);
    }

    /** Process the edit form submission */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }

        try {
            int    id          = Integer.parseInt(request.getParameter("id"));
            String serviceName = request.getParameter("serviceName");
            String category    = request.getParameter("category");
            String description = request.getParameter("description");
            double price       = Double.parseDouble(request.getParameter("price"));
            String status      = request.getParameter("status");

            Service service = new Service();
            service.setServiceId(id);
            service.setServiceName(serviceName);
            service.setCategory(category);
            service.setDescription(description);
            service.setPrice(price);
            service.setStatus(status);

            ServiceDAO dao = new ServiceDAO();
            boolean updated = dao.updateService(service);

            if (updated) {
                response.sendRedirect(request.getContextPath() + "/manageServices?msg=updatesuccess");
            } else {
                response.sendRedirect(request.getContextPath() + "/updateService?id=" + id + "&error=updatefailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/viewServices?error=exception");
        }
    }
}
