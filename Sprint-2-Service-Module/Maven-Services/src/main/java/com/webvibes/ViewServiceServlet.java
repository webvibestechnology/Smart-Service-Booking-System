package com.webvibes;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/viewServices")
public class ViewServiceServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
         
        ServiceDAO dao = new ServiceDAO();
        
        
        List<Service> serviceList = dao.getAllServices();
        
        
        request.setAttribute("serviceList", serviceList);
        
        
        request.getRequestDispatcher("pages/viewServices.jsp").forward(request, response);
    }
}