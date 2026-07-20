package com.webvibes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO {

    // ── Add ────────────────────────────────────────────────────────────────────
    public boolean addService(Service service) {
        String query = "INSERT INTO service (service_name, category, description, price, status) "
                     + "VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, service.getServiceName());
            ps.setString(2, service.getCategory());
            ps.setString(3, service.getDescription());
            ps.setDouble(4, service.getPrice());
            ps.setString(5, service.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── Get All ────────────────────────────────────────────────────────────────
    public List<Service> getAllServices() {
        List<Service> list = new ArrayList<>();
        String query = "SELECT * FROM service ORDER BY service_id";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Service s = new Service();
                s.setServiceId(rs.getInt("service_id"));
                s.setServiceName(rs.getString("service_name"));
                s.setCategory(rs.getString("category"));
                s.setDescription(rs.getString("description"));
                s.setPrice(rs.getDouble("price"));
                s.setStatus(rs.getString("status"));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ── Get By ID ──────────────────────────────────────────────────────────────
    public Service getServiceById(int id) {
        String query = "SELECT * FROM service WHERE service_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Service s = new Service();
                    s.setServiceId(rs.getInt("service_id"));
                    s.setServiceName(rs.getString("service_name"));
                    s.setCategory(rs.getString("category"));
                    s.setDescription(rs.getString("description"));
                    s.setPrice(rs.getDouble("price"));
                    s.setStatus(rs.getString("status"));
                    return s;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // ── Update ─────────────────────────────────────────────────────────────────
    public boolean updateService(Service service) {
        String query = "UPDATE service SET service_name = ?, category = ?, "
                     + "description = ?, price = ?, status = ? "
                     + "WHERE service_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, service.getServiceName());
            ps.setString(2, service.getCategory());
            ps.setString(3, service.getDescription());
            ps.setDouble(4, service.getPrice());
            ps.setString(5, service.getStatus());
            ps.setInt(6, service.getServiceId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── Delete ─────────────────────────────────────────────────────────────────
    public boolean deleteService(int id) {
        String query = "DELETE FROM service WHERE service_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
