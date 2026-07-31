package com.webvibes.booking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/booking_module_db";
    private static final String USERNAME = "root"; 
    private static final String PASSWORD = "Divya@2604"; 
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver class missing in classpath!", e);
        }
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}