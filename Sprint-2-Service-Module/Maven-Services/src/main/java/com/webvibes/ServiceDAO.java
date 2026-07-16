package com.webvibes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO {

    // Add Service
    public boolean addService(Service service) {

        String query = "INSERT INTO service (service_name, category, description, price, status) VALUES (?, ?, ?, ?, ?)";

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

    // View All Services
    public List<Service> getAllServices() {

        List<Service> serviceList = new ArrayList<>();

        String query = "SELECT * FROM service";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Service service = new Service();

                service.setServiceId(rs.getInt("service_id"));
                service.setServiceName(rs.getString("service_name"));
                service.setCategory(rs.getString("category"));
                service.setDescription(rs.getString("description"));
                service.setPrice(rs.getDouble("price"));
                service.setStatus(rs.getString("status"));

                serviceList.add(service);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return serviceList;
    }
} 