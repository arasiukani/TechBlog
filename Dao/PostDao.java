
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    Connection conn;

    public PostDao(Connection conn) {
        this.conn = conn;
    }
    
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> list= new ArrayList<>();
        
        try
        {
            String q="SELECT *  FROM categories";
            Statement  st=conn.createStatement();
            ResultSet rs=st.executeQuery(q);
            while(rs.next())
            {
                int cid =rs.getInt("cid");
                String cname=rs.getString("cname");
                String description =rs.getString("description");
                
                Category c = new Category(cid,cname,description);
                list.add(c);
            }
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
    
        return list;
        
    }
    
    public boolean savePost(Post p)
    {
        boolean f=false;
        try
        {
           String q= "INSERT INTO post (pTitle,pContent,pCode,pPic,category_id,userId) values (?,?,?,?,?,?)";
           PreparedStatement pstmt= conn.prepareStatement(q);
           
          pstmt.setString(1,p.getpTitle());
          pstmt.setString(2, p.getpContent());
          pstmt.setString(3, p.getpCode());
          pstmt.setString(4, p.getpPic());
          pstmt.setInt(5,p.getCategory_id());
          pstmt.setInt(6, p.getUserId());
          
          pstmt.executeUpdate();
          f=true;
          
            
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    //get all the post
    public List<Post> getAllPosts()
    {
        List<Post> list= new ArrayList<>();
        //fetch all the post
        
        try
        {
            PreparedStatement p=conn.prepareStatement("SELECT * FROM post order by pid desc");
            
            ResultSet rs= p.executeQuery();
            while(rs.next())
            {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp date=rs.getTimestamp("pDate");
                int category_id=rs.getInt("category_id");
                int userId=rs.getInt("userId");
                
                Post Post= new Post(pid, pTitle, pContent, pCode, pPic, date, category_id,userId);
                list.add(Post);
                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }  
        return list;
    }
    
    public List<Post> getPostByCatId(int category_id)
    {
        List<Post> list= new ArrayList<>();
        //fetch all the post by id
        try
        {
            PreparedStatement p=conn.prepareStatement("SELECT * FROM post WHERE category_id=?");
            p.setInt(1, category_id);
            
            ResultSet rs= p.executeQuery();
            while(rs.next())
            {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp date=rs.getTimestamp("pDate");
               
                int userId=rs.getInt("userId");
                
                Post Post= new Post(pid, pTitle, pContent, pCode, pPic, date, category_id,userId);
                list.add(Post);
                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostByPostId(int postId)
    {
            Post post= null;
        String q="select * from post where pid=?";
        try{
        PreparedStatement pstmt= this.conn.prepareStatement(q);
        pstmt.setInt(1,postId);
        
        ResultSet rs=pstmt.executeQuery();
        if(rs.next())
        {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp date=rs.getTimestamp("pDate");
               int category_id= rs.getInt("category_id");
                int userId=rs.getInt("userId");
                
                post= new Post(pid, pTitle, pContent, pCode, pPic, date, category_id,userId);
           
            
        }
        
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return post;
    }
}
