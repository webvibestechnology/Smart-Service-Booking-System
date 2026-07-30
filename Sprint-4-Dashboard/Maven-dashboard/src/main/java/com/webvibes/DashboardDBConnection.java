package com.dashboard.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DashboardDBConnection {
    private static final String URL_BOOKING = "jdbc:mysql://localhost:3306/booking_module_db";
    private static final String URL_SERVICE = "jdbc:mysql://localhost:3306/service_module_db";
    private static final String USER = "root";
    private static final String PASSWORD = "Aashish31";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getBookingConnection() throws SQLException {
        return DriverManager.getConnection(URL_BOOKING, USER, PASSWORD);
    }

    public static Connection getServiceConnection() throws SQLException {
        return DriverManager.getConnection(URL_SERVICE, USER, PASSWORD);
    }
}
