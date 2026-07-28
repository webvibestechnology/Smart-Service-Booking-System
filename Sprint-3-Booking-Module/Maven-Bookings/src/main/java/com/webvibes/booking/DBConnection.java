package com.webvibes.booking;

<<<<<<< HEAD

// BOOK-01: DB Connection helper — update password before use
public class DBConnection {

}
=======
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL      = "jdbc:mysql://localhost:3306/booking_module_db";
    private static final String USER     = "root";
    private static final String PASSWORD = "7447Swati@";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
<<<<<<< HEAD
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
=======
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
