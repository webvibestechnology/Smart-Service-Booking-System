package com.webvibes;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteService")
public class DeleteServiceServlet extends HttpServlet {

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

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/viewServices");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            ServiceDAO dao = new ServiceDAO();
            boolean deleted = dao.deleteService(id);

            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/manageServices?msg=deletesuccess");
            } else {
                response.sendRedirect(request.getContextPath() + "/manageServices?error=deletefailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/viewServices?error=exception");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
