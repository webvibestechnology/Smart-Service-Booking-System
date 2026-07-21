package com.webvibes;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewServices")
public class ViewServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServiceDAO dao = new ServiceDAO();
        List<Service> serviceList = dao.getAllServices();
        request.setAttribute("serviceList", serviceList);
        request.getRequestDispatcher("/pages/viewServices.jsp").forward(request, response);
    }
}
