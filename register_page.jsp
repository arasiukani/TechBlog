<%-- 
    Document   : register_page
    Created on : 28-Apr-2025, 11:11:23 am
    Author     : Aarsi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register page</title>
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 64% 100%, 31% 91%, 0 100%, 0 0);
        }
    </style>
    </head>
    <body>
        <%@include file="normal_Navbar.jsp" %>
        <main class="primary-background banner-background" style="padding-bottom: 80px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle "></span>
                            <br>
                            Register Here
                        </div>
                        <div class="card-body ">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                  <label for="user_name">User Name</label>
                                  <input type="text" name="user_name" class="form-control" id="user_name" placeholder="Enter Name" required>
                                  
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                
                                
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input type="password" name="user_pass" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                  <label for="gender">Select Gender</label>
                                  <br>
                                  <input type="radio" id="gender" name="gender" value="Male"> Male
                                  <input type="radio" id="gender" name="gender" value="Female"> Female
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control"  rows="5" placeholder="Enter somthing about yourself"></textarea>
                                </div>
                                
                                <div class="form-check">
                                  <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">agree terms and conditions<label>
                                </div>
                                <br>
                                
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait....</h4>
                                </div>
                                
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                              </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <!-- SweetAlert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
    $(document).ready(function() {
        console.log("loaded..........");
        
        $('#reg-form').on('submit', function(event) {
            event.preventDefault();
            
            
            let form = new FormData(this);
            
            $("#submit-btn").hide();
            $("#loader").show();
            
            // send register servlet
            $.ajax({
                url: "RegisterServlet",
                type: 'POST',
                data: form,
                success: function(data, textStatus, jqXHR) {
                    console.log(data);
                    $("#submit-btn").show();
                    $("#loader").hide();
                    
                    if(data.trim()==='done')
                    {
                    swal("Register Successfully....We are goint to redirecting to login page")
                        .then((value) => {
                          window.location="login-page.jsp";
                        });
                    }else
                    {
                        swal(data);
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                    $("#submit-btn").show();
                    $("#loader").hide();
                     swal("Somthing went wrong...try again");
                     
                        
                },
                processData: false,
                contentType: false
            });
            
        });
    });
</script>

    </body>
</html>
