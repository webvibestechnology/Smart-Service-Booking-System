package com.webvibes;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateService")
public class UpdateServiceServlet extends HttpServlet  {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");

        Service service = new Service(id, name, price, description);
        ServiceDAO serviceDAO = new ServiceDAO();

        boolean  isUpdate =  serviceDAO.updateService(service);
        
        if (isUpdated) {
            response.sendRedirect("pages/dashboard.jsp?msg=updatesuccess");
        } else {
            response.sendRedirect("pages/updateService.jsp?error=updatefailed");
        }
    }


}
 