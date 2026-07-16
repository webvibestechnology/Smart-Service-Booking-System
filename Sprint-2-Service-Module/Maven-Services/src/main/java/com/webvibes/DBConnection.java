package com.webvibes;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
public class DBConnection 
{

    private static final String URL = "jdbc:mysql://localhost:3306/service_module_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Asmita#28";

    private static Connection connection;

    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                System.out.println("Database Connected Successfully");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
