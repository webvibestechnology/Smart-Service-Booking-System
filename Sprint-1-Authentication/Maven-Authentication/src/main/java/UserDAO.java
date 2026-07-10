

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.auth.util.DBConnection;

public class UserDAO {
    
    public String validateUser(String email, String password) {
        String query = "SELECT name FROM users WHERE email = ? AND password = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("name");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
