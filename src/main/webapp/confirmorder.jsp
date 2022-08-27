

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Vector"%>
<%@page import="com.mycompany.project.order"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>

    <%@include file="components/navbar.jsp" %>
    <%@include file="components/message.jsp" %>


    <%        

        order Order = (order) session.getAttribute("order");
        double total = (Double) session.getAttribute("total");
        String catid = (String) session.getAttribute("categoryID");
        Integer orderid = (Integer)session.getAttribute("orderid");

        Vector<String> proName = Order.getList_of_itemsID();
        Vector<Integer> proPrice = Order.getPrice_of_items();
        Vector<Integer> proQuantity = Order.getQuantity();
        int totalQuantity = 0;

    %>

    <div class="container">
        <h2>Order Details: Your OrderID is <%= orderid%></h2>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Product Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%      for (int i = 0; i < proName.size(); i++) {

                        String name = proName.get(i);
                        int price = proPrice.get(i);
                        int quantity = proQuantity.get(i);
                        if (quantity == 0) {
                            continue;
                        }

                        totalQuantity = totalQuantity + quantity;
                %>        

                <tr>
                    <td><%=name%></td>
                    <td><%=price%></td>
                    <td><%=quantity%></td>
                </tr>
                <%
                    }

                %>



            </tbody>
        </table>
    </div>
    <div>
        <h3 style= "margin-left: 130px;">  Net payable amount = <%=total%> </h3>
    </div>

    <form>

        <input style="margin-left:130px; margin-top: 10px" type="text" id="promocode" name="promo" placeholder="Enter Promocode">

        <div class="container text-center">
            <button class="btn btn-outline-success mt-5">Confirm Order</button>
        </div>
    </form>

    <%
        String query = "select DiscountPercent,IsOfferOnInvoiceAmount,Promocode from offermaster;";
        String url = "jdbc:mysql://localhost:3306/customers";
        String user = "root";
        String pass = "Rishabh123!";
        String code = request.getParameter("promo");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);

            PreparedStatement st1 = con.prepareStatement(query);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {

                String promoCode = rs.getString("Promocode");
                double discount = rs.getDouble("DiscountPercent");
                int tot = rs.getInt("IsOfferOnInvoiceAmount");

                if (code.equals(promoCode)) {
                    total = total * ((100.00 - discount) / 100.00);

                %> 

                    <h3 style="margin-left:130px; margin-top:40px"> Total after promocode <%=code%> applied = <%=total%></h3>

                <%
                } else {
                    continue;
                }

            }

        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);

        }
        HttpSession httpSessionn = request.getSession();
        httpSessionn.setAttribute("message", "Your order has been placed successfully");

    %>    

</html>
