package com.webvibes;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/providerDashboard")
public class ProviderDashboardServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    public ProviderDashboardServlet()
    {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException
    {
  
        HttpSession session = request.getSession(false);
        if (session == null || (session.getAttribute("provider") == null && session.getAttribute("user") == null))
        {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        try 
        {
            int providerId = 1; 
            Object providerObj = session.getAttribute("providerId");
            
            if (providerObj != null) 
            {
                providerId = Integer.parseInt(providerObj.toString());
            }

            // DashboardDAO object
            DashboardDAO dao = new DashboardDAO();

            int totalJobs = dao.getTotalJobs(providerId);
            int completedJobs = dao.getCompletedJobs(providerId);
            int pendingJobs = dao.getPendingJobs(providerId);
            int cancelledJobs = dao.getCancelledJobs(providerId);
   
            List<Object> todaysBookings = dao.getTodaysBookings(providerId);

            request.setAttribute("totalJobs", totalJobs);
            request.setAttribute("completedJobs", completedJobs);
            request.setAttribute("pendingJobs", pendingJobs);
            request.setAttribute("cancelledJobs", cancelledJobs);
            request.setAttribute("todaysBookings", todaysBookings);

            request.getRequestDispatcher("/pages/providerDashboard.jsp").forward(request, response);
        }
        catch (Exception e) 
        {
            e.printStackTrace();
            request.getRequestDispatcher("/pages/providerDashboard.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {
        doGet(request, response);
    }
}