package com.webvibes;

import com.webvibes.User;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/manageUsers")
public class ManageUsersServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        
        try 
        {
            
            DashboardDAO dashboardDAO = new DashboardDAO();
            List<User> userList = dashboardDAO.getAllUsers(); 

            
            request.setAttribute("userList", userList);

        } catch (Exception e) 
        {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading users from database.");
        }

        
        request.getRequestDispatcher("/pages/manageUsers.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }
}