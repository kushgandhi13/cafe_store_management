
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>

<html>
    <head>
        <title>Menu</title>
    </head>
    <body>
        <form action="PreviousOrderServlet" method="Post">
            <div class="container text-center">
                <input type="text" id="orderid" name="orderid" placeholder="Enter OrderID">
                <button class="btn bg-dark text-white">Submit</button>
            </div>
        </form>


        <%
            String query = "select * from product;";
            String query1 = "select * from productcategory;";
            String query2 = "select * from product where ProductCategoryID = ? ;";
            String url = "jdbc:mysql://localhost:3306/customers";
            String user = "root";
            String pass = "Rishabh123!";
            String cid = null;
            int catid = 0;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pass);

                PreparedStatement st1 = con.prepareStatement(query1);
                ResultSet rs = st1.executeQuery();


        %>

        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <div class="col-md-2">

                    <div class="list-group">
                        <a href="user.jsp?category=all" class="list-group-item list-group-item-action bg-dark text-white"> All Products </a>

                        <%      while (rs.next()) {
                                String catName = rs.getString("ProductCategoryName");
                                int catID = rs.getInt("ProductCategoryID");
                        %>      

                        <a href="user.jsp?category=<%= catID%>" class="list-group-item list-group-item-action"><%=catName%></a>

                        <%
                                }

                                cid = request.getParameter("category");
                                catid = Integer.parseInt(cid);
                                con.close();

                            } catch (Exception e) {
                                e.getStackTrace();
                                System.out.println("error : " + e);

                            }
                        %>
                    </div>

                </div>

                <div class="col-md-10">  

                    <form action="OrderServlet" method="post">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                </tr>
                            </thead>
                            <%
                                if (cid == null || cid.equals("all")) {
                                    
                                    if (cid == null) {
                                        cid = "all";
                                    }
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con1 = DriverManager.getConnection(url, user, pass);
                                        PreparedStatement st = con1.prepareStatement(query);
                                        ResultSet resultSet = st.executeQuery();

                                        while (resultSet.next()) {
                                            int proID = resultSet.getInt("ProductID");
                                            String proName = resultSet.getString("ProductName");
                                            int proPrice = resultSet.getInt("UnitPrice");

                            %> 

                            <tbody>
                                <tr>
                                    <th scope="row"><%=proID%></th>
                                    <td><%=proName%></td>
                                    <td><%=proPrice%></td>
                                    <td> <input type="text" id="<%=proID%>" name="<%=proID%>" required ></td>

                            <input type="hidden" name="categoryid" value="<%=cid%>">
                            </tr>
                            </tbody> <%

                                        
                                    }
                                        con1.close();

                                } catch (Exception e) {
                                    e.getStackTrace();
                                    System.out.println("error : " + e);

                                }

                            } else {
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con2 = DriverManager.getConnection(url, user, pass);
                                    PreparedStatement st2 = con2.prepareStatement(query2);
                                    st2.setInt(1, catid);
                                    ResultSet rs2 = st2.executeQuery();
                                    while (rs2.next()) {

                                        int proID = rs2.getInt("ProductID");
                                        String proName = rs2.getString("ProductName");
                                        int proPrice = rs2.getInt("UnitPrice");

                            %> 

                            <tbody>
                                <tr>
                                    <th scope="row"><%=proID%></th>
                                    <td><%=proName%></td>
                                    <td><%=proPrice%></td>
                                    <td> <input type="text" id="<%=proID%>" name="<%=proID%>" required ></td>
                            <input type="hidden" name="categoryid" value="<%=cid%>">
                            </tr>
                            </tbody> <%
                                            //
                                            //                                    System.out.println(proID);
                                            //                                    System.out.println(proName);

                                        }
                                        con2.close();
                                    } catch (Exception e) {
                                        e.getStackTrace();
                                        System.out.println("error : " + e);

                                    }
                                }
                            %>



                        </table>
                        <div class="container text-center">
                            <button class="btn btn-outline-success ">Submit</button>
                        </div>

                    </form>

                </div>

            </div>
        </div>


    </body>
</html>
