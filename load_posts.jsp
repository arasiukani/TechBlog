<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div class="row">

<% 
    Thread.sleep(1000);
    PostDao d= new PostDao(ConnectionProvider.getConnection());
    
    int category_id=Integer.parseInt(request.getParameter("category_id"));
     List<Post> posts=null;
     if(category_id==0)
     {
        posts=d.getAllPosts();
        }
        else
        {
        posts=d.getPostByCatId(category_id);
        }
        
        if(posts.size()==0)
        {
        out.println("<h3 class='display-3 text-center'>No Post in this category...</h3>");
        return;
        } 
    for(Post p1:posts)
    {
    %>
    
    <div class="col-md-6 mt-2">
        <div class="card">
             <img class="card-img-top" src="blog_pics/<%= p1.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b>
                    <%=p1.getpTitle() %>
                </b>
                <p><%= p1.getpContent()%></p>
<!--                <pre><%=p1.getpCode() %></pre>-->
                
            </div>

            <div class="card-footer primary-background text-center">
                
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="show_blog_page.jsp?post_id=<%=p1.getPid()%> " class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
            </div>
        </div>

        
    </div>
    
    
    
    
    <%
    }






%>

</<div>