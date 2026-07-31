package com.webvibes;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL      = "jdbc:mysql://localhost:3306/service_module_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "unnati@2005";

    // Returns a fresh connection every time — avoids stale cached connection issues
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
