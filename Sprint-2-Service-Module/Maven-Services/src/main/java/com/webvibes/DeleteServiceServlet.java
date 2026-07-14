package com.webvibes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.webvibes.authentication.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteServiceServlet")
public class DeleteServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        try {
        	int serviceId = Integer.parseInt(request.getParameter("serviceId"));

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM services WHERE service_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, serviceId);

            int result = ps.executeUpdate();

            HttpSession session = request.getSession();

            if (result > 0) {
                session.setAttribute("message", "Service deleted successfully.");
            } else {
                session.setAttribute("message", "Service not found.");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error deleting service.");
        }

        response.sendRedirect("ServiceListServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}


