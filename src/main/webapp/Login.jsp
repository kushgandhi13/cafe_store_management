
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>  
        <%@include file="components/navbar.jsp" %>
        
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        
                        <div class="card mt-3">
                            
                            <div class="card-header bg-dark text-white">
                                <h3>Login Here</h3>
                            </div>
                            
                            <div class="card-body">
                            <form name="form" action="LoginServlet" method="post">
                                <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
                                    <div class="form-group">
                                      <label for="username">Username</label>
                                      <input type="text" class="form-control" name="username" id="username" placeholder="Enter username">
                                    </div>
                                    <div class="form-group">
                                      <label for="password">Password</label>
                                      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                                    </div>
                                <a href="Register.jsp" class="text-center d-block mb-3"> If not registered click here</a>
                                    <div class="container text-center">
                                        <button class="btn btn-primary bg-success border-0" type="submit" value="Login">Submit</button>
                                        <button class="btn btn-primary bg-danger border-0" type="reset" value="Login">Reset</button>
                                    </div>
           
                            </form>  
                        </div>
                    </div> 
                </div>
            </div>
    </body>
</html>
