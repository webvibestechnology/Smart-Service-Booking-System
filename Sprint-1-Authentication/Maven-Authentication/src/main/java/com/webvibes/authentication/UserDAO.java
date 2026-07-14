package com.webvibes.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	public String registerUser(User user) {
		String checkEmailQuery = "SELECT email FROM users WHERE email = ? ";
		String insertQuery = "INSERT INTO users (full_name, email, mobile, password, role) VALUES (?, ?, ?, ?, 'USER')";
		
		try (Connection conn = DBConnection.getConnection()) {
			
				try(PreparedStatement psCheck = conn.prepareStatement(checkEmailQuery)){
					psCheck.setString(1,  user .getEmail());
					try (ResultSet rs = psCheck.executeQuery()) {
						if(rs.next()) {
							return "duplicate";
						}
					}
				}
				try (PreparedStatement psInsert = conn.prepareStatement(insertQuery)) {
					psInsert.setString(1, user.getName());
					psInsert.setString(2, user.getEmail());
					psInsert.setString(3, user.getMobile());
					psInsert.setString(4, user.getPassword());
					
					int rows = psInsert.executeUpdate();
					if (rows > 0) {
						return "Success";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "failed";
	}

}
