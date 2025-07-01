<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home - Tech Blog</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
          clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 64% 100%, 31% 91%, 0 100%, 0 0);      }
    </style>
</head>

<body>  <!-- Body ka background white -->

    <!-- Navbar include -->
    <%@include file="normal_Navbar.jsp" %>
    
<!--    Banner-->
<div class="container-fluid p-0 m-0">
    
    <div class="jumbotron primary-background banner-background text-white">
        <div class="container">
        <h3 class="display-3">Welcome to TechBlog</h3>
        
        <p>Welcome to technical blog, world of technology
            Every programming language is powerful when used with the right mindset.
Whether it's Python’s simplicity or Java’s strength, your skills make the real difference.
Learn one language deeply and understand the fundamentals.
Because in the world of code, your logic speaks louder than your language.</p>
        
        <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>  Start ! its free</button>
        <a href="login-page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>    Login</a>
        </div>
    </div>
    
    
    
</div>


<!--    cards-->
<div class="container">
    
    <div class="row  mb-2">
        <div class="col-md-4">
            <div class="card" >
                <div class="card-body">
                  <h5 class="card-title">Java Programming </h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>
        </div>
         <div class="col-md-4">
            <div class="card" >
                <div class="card-body">
                  <h5 class="card-title">Java Programming </h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>
        </div>
         <div class="col-md-4">
            <div class="card" >
                <div class="card-body">
                  <h5 class="card-title">Java Programming </h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-4">
            <div class="card" >
                <div class="card-body">
                  <h5 class="card-title">Java Programming </h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>
        </div>
         <div class="col-md-4">
            <div class="card" >
                <div class="card-body">
                  <h5 class="card-title">Java Programming </h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>
        </div>
         <div class="col-md-4">
            <div class="card" >
                <div class="card-body">
                  <h5 class="card-title">Java Programming </h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn primary-background text-white">Read more</a>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- JavaScript Libraries -->
    <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

</body>
</html>
