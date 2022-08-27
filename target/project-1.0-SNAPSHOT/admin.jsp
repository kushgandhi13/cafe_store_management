
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Page</title>
    </head>
    <% //In case, if Admin session is not set, redirect to Login page
        if ((request.getSession(false).getAttribute("Admin") == null)) {
    %>
    <jsp:forward page="/Login.jsp"></jsp:forward>
    <%
        }
    %>

    <%@include file="components/common_css_js.jsp" %>  
    <body>    
        <%@include file="components/navbar.jsp" %>  
        <%@include file="components/message.jsp" %>
        <div class="container admin">

            <div class="row mt-3">

                <!--column 1-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle " src="img/group.png" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>

                </div>

                <!--column 2-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/staff.png" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Staff</h1>
                        </div>
                    </div>

                </div>

                <!--column 3-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>

                </div>

            </div>


            <!--row-2-->

            <div class="row mt-3">

                <!--column 1-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>

                </div>

                <!--column 2-->
                <div class="col-md-4">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/shopping-cart.png" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>

                </div>

                <!--column 3-->
                <div class="col-md-4">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>

                </div>

            </div>


        </div>

        <!--add category modal-->

        <!-- Modal -->
        
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductOperationServlet" method="post">
                            
                            <input type="hidden" name="operation" value="addcategory">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="catID" placeholder="Enter category ID"/>
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter new category"/>
                            </div> 
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>  
                    </div>
                </div>
            </div>
        </div>

        <!--end of modal-->
        
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addproduct">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="proID" placeholder="Enter productID"/>
                            </div> 
                            <div class="form-group">
                                <input type="text" class="form-control" name="proCategoryID" placeholder="Enter product category ID"/>
                            </div>     
                            <div class="form-group">    
                                <input type="text" class="form-control" name="proName" placeholder="Enter product Name"/>
                            </div> 
                            <div class="form-group">
                                <input type="text" class="form-control" name="proDetail" placeholder="Enter product Detail"/>
                            </div> 
                            <div class="form-group">
                                <input type="text" class="form-control" name="proPrice" placeholder="Enter product Price"/>
                            </div> 
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>  
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
