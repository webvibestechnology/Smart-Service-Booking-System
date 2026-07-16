package com.webvibes;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ServiceDAO {
	public boolean updateService(Service service) {
		String query = "UPDATE service SET service_name = ? , price = ? , description = ? WHERE id = ?";
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement(query)) {
					
					ps.setString(1, service.getServiceName());
					ps.setDouble(2,  service.getPrice());
					ps.setString(3,  service.getDescription());
					ps.setInt(4, service.getId());
					
					int rows = ps.executeUpdate();
					return rows > 0;
				} catch (Exception e) {
					e.printStackTrace();
				}
		return  false;  
	}
                                                      
}
