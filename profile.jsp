<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<% 
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
    response.sendRedirect("login-page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 64% 100%, 31% 91%, 0 100%, 0 0);
        }
         body{
            background: url(img/bg.jpg);
            background-size: cover;
            background-attachment: fix;
        }
    </style>
        <title></title>
    </head>
    <body>
        
<!-- navbar-->
       <nav class="navbar navbar-expand-lg navbar-dark primary-background ">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>  Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="fa fa-bell-o"></span>  LearnCode <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false"> <span class="fa fa-check-square-o"></span>
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
       <li class="nav-item">
           <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>   Contact</a>
      </li>
       <li class="nav-item">
           <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>   Do Post</a>
      </li>
      
    </ul>
    
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
           <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle "></span> <%= user.getName() %></a>
      </li>
          
          
          <li class="nav-item">
           <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus "></span> Logout</a>
      </li>
          
      </ul>
  </div>
</nav>
      
<!--end of navbar-->
                        <% 
                              Message m= (Message) session.getAttribute("msg");
                              if(m!=null)
                              {%>
                              <div class="alert <%= m.getCssClass()%>" role="alert">
                                <%= m.getContent()%>
                              </div>
                             
                                <% 
                                 session.removeAttribute("msg");
                                }
                                
                            %>

<!--        main body of the page-->


<main>
    <div class="container">
        <div class="row mt-4">
            
<!--            First col-->
                <div class="col-md-4">
<!--                    categories-->
                        
                        <div class="list-group">
                            <a href="#" onclick="getPost(0,this)" class=" c-link list-group-item list-group-item-action active">
                              All Posts
                            </a>
                            
<!--                            categories-->

                             <% 
                                PostDao d= new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> l=d.getAllCategories();
                                for(Category cc:l)
                                {
                                %>
                                <a href="#" onclick="getPost(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getCname() %></a>
                                <%
                                 }
                             %>
                            
                            
                            
                          </div>

                </div>

<!--                second col-->
                 <div class="col-md-8" >
<!--                     posts-->

                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading... </h3>
                        </div>
                            <div class="container-fluid" id="post-container">
                                    
                            </div>
                </div>
        </div>
    </div>
</main>


<!--      end main body of the page-->
                            
                            
                            
                            
                            
                            
<!--profile modal-->

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background etxt-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="pics/<%=  user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width:150px ">
              <br>
        <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName() %></h5>
        
<!--        details-->
            <div id="profile-details">
                    <table class="table">

                      <tbody>
                        <tr>
                          <th scope="row">ID :</th>
                          <td><%= user.getId() %></td>

                        </tr>
                        <tr>
                          <th scope="row">Email :</th>
                          <td><%=user.getEmail() %></td>

                        </tr>
                        <tr>
                          <th scope="row">Gender :</th>
                          <td><%=user.getGender() %></td>

                        </tr>
                        <tr>
                          <th scope="row">Status :</th>
                          <td><%=user.getAbout()%></td>

                        </tr>
                        <tr>
                          <th scope="row">Registerd on :</th>
                          <td><%= user.getDateTime().toString() %></td>

                        </tr>
                      </tbody>
                    </table>
            </div>
              
<!--              profile edit-->
                <div id="profile-edit" style="display: none">
                    <h3 class="mt-2">Please Edit Carefully</h3>
                    <form action="EditServlet" method="POST" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <td>Id :</td>
                                <td><%= user.getId() %></td>
                            </tr>
                            <tr>
                                <td>Email :</td>
                                <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>  
                            </tr>
                             <tr>
                                <td>Name :</td>
                                <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>  
                            </tr>
                             <tr>
                                <td>Password :</td>
                                <td><input type="password" class="form-control" name="user_pass" value="<%= user.getPassword()%>"></td>  
                            </tr>
                             <tr>
                                <td>Gender :</td>
                                <td><%= user.getGender().toUpperCase() %></td>  
                            </tr>
                             <tr>
                                <td>About :</td>
                                <td><textarea rows="3" class="form-control " name="user_about">
                                    <%= user.getAbout() %>
                                    </textarea></td>  
                            </tr>
                             <tr>
                                <td>New <br>Profile :</td>
                                <td><input type="file" name="img" class="form-control"></td>  
                            </tr>
                            
                        </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                    </form>
                </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!--end of profile model-->

<!--add post model-->



<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          <form id="add-post-form" action="AddPostServlet" method="POST">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>---Select Category---</option>
                      
                      <% 
                            PostDao postd= new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list =postd.getAllCategories();
                            for(Category c:list)
                            {
                      %>
                      <option value="<%= c.getCid() %>"><%= c.getCname()%></option>
                 
                  <%
                      }
                  %>    
                   </select>
              </div>
              
         
              <div class="form-group">
                  <input name="pTitle"type="text" placeholder="Enter post Title" class="form-control"/>
              </div>
              
              <div class="form-group">
                  <textarea name="pContent"class="form-control" placeholder="Enter Your Content" style="height: 200px;"></textarea>
              </div>
              
              <div class="form-group">
                  <textarea name ="pCode" class="form-control" placeholder="Enter Your Program (If Any)" style="height: 200px;"></textarea>
              </div>
              
              <div class="form-group">
                  <label> Select Your Pic..</label>
                  <br>
                  <input name="pic" type="file">
              </div>
                   
                   <div class="container text-center">
                       <button type="submit" class="btn-outline-primary">Post
                   </div>
          </form>
          
          
          
      </div>
      
    </div>
  </div>
</div>

<!--End add post model-->
        
        
<!--  javascripts-->
         <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <!-- SweetAlert CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script></<script src="js/myjs.js" type="text/javascript"></script>
<script>
    $(document).ready(function()
    {
        let editStatus=false;
        
      $('#edit-profile-btn').click(function()
      {
//          alert("buton clicked");
            if(editStatus == false)
            {
                $("#profile-details").hide();
                $("#profile-edit").show();
                editStatus = true;
                $(this).text("Back")
            }
            else
            {
                $("#profile-details").show();
                $("#profile-edit").hide();
                editStatus = false;
                $(this).text("Edit")
            }
      });
    });
</script>


<!--now add post js-->

<script>
    $(document).ready(function()
    {
        $("#add-post-form").on("submit",function(event){
            //this code gets called when form is submitted....
            event.preventDefault();
            console.log("you have clicked on submit")
            let form = new FormData(this);
            
            //now requesting server
            $.ajax({
                url:"AddPostServlet",
                type:'POST',
                data : form,
                success: function(data, textStatus , jgXHR){
                    //success...
                    
                    console.log(data);
                    if(data.trim()=='done')
                    {
                        swal("Good job!", "Saved Successfully!", "success");
                    }else
                    {
                        swal("Error!!", "Something went wrong try again!!", "error");

                    }
                    
                },
                error: function(jgXHR , textStatus , errorThrown)
                {
                    //error...
                    swal("Error!!", "Something went wrong try again!!", "error");
                    
                },
                processData: false,
                contentType: false
            })
            
        });
    });
</script>

<!--    loading post using ajax-->
        <script>
            
                function getPost(catId,temp)
                {
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass('active');
                
                
                $.ajax({
                    url:"load_posts.jsp",
                    data:{category_id:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    }
                });
                }
            
                $(document).ready(function(e){
                let allPostRef= $('.c-link')[0]
                    getPost(0,allPostRef);
                });
        </script>

    </body>
</html>
