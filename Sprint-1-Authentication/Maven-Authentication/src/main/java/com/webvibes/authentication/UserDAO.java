package com.webvibes.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    /**
     * Validates credentials and returns the matching User, or null if not found.
     */
    public User login(String email, String password) {

        String query = "SELECT user_id, full_name, email, mobile, password, role "
                     + "FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setName(rs.getString("full_name"));
                    user.setEmail(rs.getString("email"));
                    user.setMobile(rs.getString("mobile"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                    return user;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public String registerUser(User user) {

        String checkEmailQuery =
                "SELECT email FROM users WHERE email = ?";

        String insertQuery =
                "INSERT INTO users (full_name, email, mobile, password, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection()) {

            // Check Duplicate Email
            try (PreparedStatement psCheck = conn.prepareStatement(checkEmailQuery)) {

                psCheck.setString(1, user.getEmail());

                try (ResultSet rs = psCheck.executeQuery()) {

                    if (rs.next()) {
                        return "duplicate";
                    }
                }
            }

            // Insert User
            try (PreparedStatement psInsert = conn.prepareStatement(insertQuery)) {

                psInsert.setString(1, user.getName());
                psInsert.setString(2, user.getEmail());
                psInsert.setString(3, user.getMobile());
                psInsert.setString(4, user.getPassword());
                psInsert.setString(5, user.getRole());

                int rows = psInsert.executeUpdate();

                if (rows > 0) {
                    return "success";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        return "failed";
    }
}