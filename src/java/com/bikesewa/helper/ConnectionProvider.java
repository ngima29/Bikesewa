package com.bikesewa.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getCon() {
        try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bike_sewa";
                String user = "root";
                String pw = "";
                //connection
                con = DriverManager.getConnection(url, user, pw);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
