<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        
                        <%@ include file="components/message.jsp" %>
                        <div class="card-body px-5">

                            <div class="container text-center">
                                <img src="img/signup.jpg" style="max-width" width="100px" class="img-fluid"alt="signup_img"/>
                            </div>

                            <form action="RegisterServlet" method="post">
                                    
                                    <div class="form-group">
                                        <label for="fullname">Full Name</label>
                                        <input name="user_fullname" type="text" class="form-control" placeholder="Enter Full Name" id="fullname" aria-describedby="emailHelp">
                                    </div> 
                                
                                    <div class="form-group">
                                        <label for="name">Username</label>
                                        <input name="user_name" type="text" class="form-control" placeholder="Enter Name" id="name" aria-describedby="emailHelp">
                                    </div> 

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input name="user_password" type="password" class="form-control" placeholder="Enter Password" id="password" aria-describedby="emailHelp">
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Email ID</label>
                                        <input name ="user_email" type="email" class="form-control" placeholder="Enter Email-ID" id="email" aria-describedby="emailHelp">
                                    </div>

                                    <div class="form-group">
                                        <label for="phone">Phone Number</label>
                                        <input name="user_phone"type="number" class="form-control" placeholder="Enter Phone" id="phone" aria-describedby="emailHelp">
                                    </div>

   
                                    <div class="container text-center">
                                        <button class="btn btn-outline-success">Register</button>
                                        <button class="btn btn-outline-warning">Reset</button>
                                    </div>   
                                     
                                </form> 
                        </div>
                    </div>                  
                </div>            
            </div>  
        </div>
    </body>
</html>
