package com.webvibes;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/serviceDetails")
public class ServiceDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            ServiceDAO dao = new ServiceDAO();
            Service service = dao.getServiceById(id);

            if (service == null) {
                response.sendRedirect(request.getContextPath() + "/viewServices");
                return;
            }

            request.setAttribute("service", service);
            request.getRequestDispatcher("/pages/serviceDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
        }
    }
}
