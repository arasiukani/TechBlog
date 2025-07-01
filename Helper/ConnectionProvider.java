package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection conn;
    
    public static Connection getConnection() {
        try {
            if (conn == null) {
                // Load driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Create connection
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "");
            }
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        
        return conn;
    }
}
