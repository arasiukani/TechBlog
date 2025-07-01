package com.tech.blog.dao;

import com.mysql.cj.protocol.Resultset;
import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    // Method to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String query = "INSERT INTO user (name, email, password, gender, about) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Get user by user email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
            String query = "SELECT * FROM user WHERE email = ? AND password = ?";
            PreparedStatement pstm = conn.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, password);

            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                user = new User();
                
                // Data from DB
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setProfile(rs.getString("profile"));
                user.setDateTime(rs.getTimestamp("reg_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    public boolean updateUser(User user)
    {
        boolean f= false;
        try
        {
            String query="UPDATE user set name=? , email=? , password=? , gender=?,about=?, profile=? WHERE id=?";
            
            PreparedStatement p=conn.prepareStatement(query);
            
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            
           p.executeUpdate();
            f=true;
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByuserId(int userId)
    {
        User user= null;
        try
        {
          String query= "select * from user where id=?";
        PreparedStatement pstm= this.conn.prepareStatement(query);
        
        pstm.setInt(1,userId);
        ResultSet rs = pstm.executeQuery();
        
        if(rs.next())
        {
            user = new User();
            user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setProfile(rs.getString("profile"));
                user.setDateTime(rs.getTimestamp("reg_date"));
        }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
                
        
        return user;
    }
}
