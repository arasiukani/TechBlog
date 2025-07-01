

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! Something went wrong</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
          clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 64% 100%, 31% 91%, 0 100%, 0 0);      }
    </style>
        
    
    </head>
    <body>
        <div class="container text-center">
            <img  src="img/computer.png" class="img-fluid" style="height: 60vh;width: 60vh">
        <h3 class="display-3"> Sorry ! Something went wrong..</h3>
        <%= exception%>
        <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
    </div>   
    </body>
</html>
