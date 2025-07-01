
package com.tech.blog.dao;
import java.sql.*;

public class LikeDao {
    Connection conn;

    public LikeDao(Connection conn) {
        this.conn = conn;
    }
    
    
    public boolean insertLike(int pid,int uid)
    {
        boolean f=false;
        try
        {
            String q="INSERT INTO liked (pid,uid) values (?,?)";
            PreparedStatement Pstmt=this.conn.prepareStatement(q);
            //values set....
            
            Pstmt.setInt(1,pid);
            Pstmt.setInt(2,uid);
            
            Pstmt.executeUpdate();
            f=true;
            
        }catch(Exception e)
        {
            
        }
        return f;
    }
    
    public int countLikeOnPost(int pid)
    {
        int count=0;
        String q="select count(*) from liked where pid=?";
        try
        {
            PreparedStatement pstmt=this.conn.prepareStatement(q);
            pstmt.setInt(1, pid);
            
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
                count=rs.getInt("count(*)");
            }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        
        
        
        return count;
    }
    
    public boolean isLikedByUser(int pid,int uid)
    {
        boolean f= false;
        
        try
        {
            PreparedStatement pstmt= this.conn.prepareStatement("select * from liked where pid=? and uid=?");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
                f=true;
            }else
            {
                f=false;
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
            
        }
        
        return f;
    }
    
    public boolean deleteLike(int pid,int uid)
    {
        boolean f=false;
        try
        {
            PreparedStatement pstmt=this.conn.prepareStatement("delete from liked where pid=? and uid=? ");
            
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
        
    }
}
