
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="components/common_css_js.jsp" %>

        
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Damion' rel='stylesheet' type='text/css'>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/templatemo-style.css" rel="stylesheet">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        

    </head>
    <body>
       
        <div id="loader-wrapper">
            <div id="loader"></div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>
        </div>
        
        <!-- End Preloader -->
        <div class="tm-top-header">
            <div class="container">
                <div class="row">
                    <div class="tm-top-header-inner">
                        <div class="tm-logo-container">
                            <img src="img/logo.png" alt="Logo" class="tm-site-logo">
                            <h1 class="tm-site-name tm-handwriting-font">Cafe House</h1>
                        </div>
                        <div class="mobile-menu-icon">
                            <i class="fa fa-bars"></i>
                        </div>
                        <nav class="tm-nav">
                            <ul >
                                <li><a href="index.jsp">Home</a></li>
                                    <%  String admin1, staff1, userr1, username1;
                                        admin1 = (String) session.getAttribute("Admin");
                                        staff1 = (String) session.getAttribute("Editor");
                                        userr1 = (String) session.getAttribute("User");
                                        if (admin1 == null && staff1 == null && userr1 == null) {
                                            //  if ((request.getSession(false).getAttribute("Admin") == null))   {

                                    %>  
                                        <li style="margin-left: 420px!important;"><a href="Login.jsp">Login</a></li>
                                        <li><a href="Register.jsp">Register</a></li>
                                        
                                    <%    } else {

                                        if (admin1 != null) {
                                            username1 = admin1;
                                        } else if (staff1 != null) {
                                            username1 = staff1;
                                        } else {
                                            username1 = userr1;
                                        }

                                    %>

                                <li style="margin-left: 420px!important;" class="nav-item active"> 
                                    <a class="nav-link" href="#!"> <%=username1%> </a>
                                </li>

                                <li class="nav-item active"> 
                                    <a class="nav-link" href="LogoutServlet">Logout</a>
                                </li> 


                                <%

                                    }

                                %>

                            </ul>
                        </nav>   
                    </div>           
                </div>    
            </div>
        </div>
                                
        <section class="tm-welcome-section">
            <div class="container tm-position-relative">
                <div class="tm-lights-container">
                    <img src="img/light.png" alt="Light" class="light light-1">
                    <img src="img/light.png" alt="Light" class="light light-2">
                    <img src="img/light.png" alt="Light" class="light light-3">  
                </div>        
                <div class="row tm-welcome-content">
                    <h2 class="white-text tm-handwriting-font tm-welcome-header"><img src="img/header-line.png" alt="Line" class="tm-header-line">&nbsp;Welcome To&nbsp;&nbsp;<img src="img/header-line.png" alt="Line" class="tm-header-line"></h2>
                    <h2 class="gold-text tm-welcome-header-2">Café House</h2><br>
                    <h4 class="text-white tm-welcome-header-2">EAT OR WE BOTH STARVE</h4>
                    
                    <a href="#main" class="tm-more-button tm-more-button-welcome">Details</a>      
                </div>
                <img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">             
            </div>      
        </section>
        <div class="tm-main-section light-gray-bg">
            <div class="container" id="main">
                <section class="tm-section row">
                    <div class="col-lg-9 col-md-9 col-sm-8">
                        <h2 class="tm-section-header gold-text tm-handwriting-font">The Best Coffee for you</h2>
                        <h2>Cafe House</h2>
                        <p class="tm-welcome-description">Café House one of India’s favorite hangout for coffee and conversations. We strive to provide the best experience to our guests. Our coffees are sourced from thousands of small coffee planters, who made us who we are today and we're glad to be a part of their lives. Cafe House to the youth is a “hangout” spot where they meet people, make conversations, and have a whole lot of fun over steaming cups of great coffee. Thank You for all the love. </p>
                         
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-4 tm-welcome-img-container">
                        <div class="inline-block shadow-img">
                            <img src="img/1.jpg" alt="Image" class="img-circle img-thumbnail">  
                        </div>              
                    </div>            
                </section>          
                
                
                
            </div>
        </div> 
        <footer>
            <div class="tm-black-bg">
                <div class="container">
                    <div class="row margin-bottom-60">
                        <nav class="col-lg-3 col-md-3 tm-footer-nav tm-footer-div">
                            <h3 class="tm-footer-div-title">Main Menu</h3>
                            <ul>
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Directory</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Our Services</a></li>
                            </ul>
                        </nav>
                        <div class="col-lg-5 col-md-5 tm-footer-div">
                            <h3 class="tm-footer-div-title">About Us</h3>
                            <p class="margin-top-15">Kush Gandhi</p>
                            <p class="margin-top-15">Manan Gandhi</p>
                            <p class="margin-top-15">Gunjan Paghdar</p>
                            <p class="margin-top-15">Viren Saroha</p>
                            <p class="margin-top-15">Avik Maheshwari</p>
                        </div>
                        <div class="col-lg-4 col-md-4 tm-footer-div">
                            <h3 class="tm-footer-div-title">Get Social</h3>
                            <p>Follow us on these social media websites</p>
                            <div class="tm-social-icons-container">
                                <a href="#" class="tm-social-icon"><i class="fa fa-facebook"></i></a>
                                <a href="#" class="tm-social-icon"><i class="fa fa-twitter"></i></a>
                                <a href="#" class="tm-social-icon"><i class="fa fa-linkedin"></i></a>
                                <a href="#" class="tm-social-icon"><i class="fa fa-youtube"></i></a>
                                <a href="#" class="tm-social-icon"><i class="fa fa-behance"></i></a>
                            </div>
                        </div>
                    </div>          
                </div>  
            </div>      
            <div>
                <div class="container">
                    <div class="row tm-copyright">
                        <p class="col-lg-12 small copyright-text text-center">Copyright &copy; 2020 Your Cafe House</p>
                    </div>  
                </div>
            </div>
        </footer>   
        
        <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      
        <script type="text/javascript" src="js/templatemo-script.js"></script>      


        


    </body>
</html>
