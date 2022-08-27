

<link rel="stylesheet" href="css/style.css"/>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark tm-top-header">
    <div class="container">
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link " href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                
            </ul>

            <ul class="navbar-nav ml-auto">

                <%  String admin, staff, userr, username;
                    admin = (String) session.getAttribute("Admin");
                    staff = (String) session.getAttribute("Editor");
                    userr = (String) session.getAttribute("User");
                    if (admin == null && staff == null && userr == null) {
                        //  if ((request.getSession(false).getAttribute("Admin") == null))   {

                %>   
                <li class="nav-item active"> 
                    <a class="nav-link" href="Login.jsp">Login </a>
                </li>

                <li class="nav-item active"> 
                    <a class="nav-link" href="Register.jsp">Register</a>
                </li>

                <%    } else {
                    
                        if (admin != null) {
                            username = admin;
                        } else if (staff != null) {
                            username = staff;
                        } else {
                            username = userr;
                        }

                %>
                
                <li class="nav-item active"> 
                    <a class="nav-link" href="#!"> <%=username%> </a>
                </li>

                <li class="nav-item active"> 
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li> 


                <%

                    }

                %>



            </ul>


        </div>
    </div>
</nav>