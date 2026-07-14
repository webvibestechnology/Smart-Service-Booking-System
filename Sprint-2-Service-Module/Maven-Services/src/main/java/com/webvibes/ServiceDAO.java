package com.webvibes;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ServiceDAO {

    public boolean addService(Service service) {

        String query = "INSERT INTO service(service_name, category, description, price, status) VALUES (?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query)
        ) {

            ps.setString(1, service.getServiceName());
            ps.setString(2, service.getCategory());
            ps.setString(3, service.getDescription());
            ps.setDouble(4, service.getPrice());
            ps.setString(5, service.getStatus());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
