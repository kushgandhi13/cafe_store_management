package com.mycompany.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        order Order = new order();
        Vector<Integer> item_id = new Vector();
        Vector<String> item_name = new Vector();
        Vector<Integer> item_price = new Vector();
        Vector<Integer> item_qunt = new Vector();

        String category_id = request.getParameter("categoryid");

        System.out.println(category_id + "Hello World");
        String query = "select * from product where ProductCategoryID = ?;";
        String query1 = "select * from product;";
        String url = "jdbc:mysql://localhost:3306/customers";
        String user = "root";
        String pass = "Rishabh123!";

//        System.out.println("in servlet");
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con3 = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = null;
            if (category_id.equals("all") || category_id == null) {
                st = con3.prepareStatement(query1);

            } else {
                st = con3.prepareStatement(query);
                st.setString(1, category_id);
            }

            ResultSet resultSet = st.executeQuery();
//            System.out.println("in try");
            while (resultSet.next()) {

                int proID = resultSet.getInt("ProductID");
                String proName = resultSet.getString("ProductName");
                int proPrice = resultSet.getInt("UnitPrice");
                int proQuantity = Integer.parseInt(request.getParameter(Integer.toString(proID)));

                item_name.add(proName);
                item_id.add(proID);
                item_price.add(proPrice);
                item_qunt.add(proQuantity);

            }

            con3.close();

        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);

        }

        Order.setList_of_itemsID(item_name);
        Order.setPrice_of_items(item_price);
        Order.setQuantity(item_qunt);

        double total = Order.getOrder_price();

        HttpSession session = request.getSession();
        session.setAttribute("order", Order);
        session.setAttribute("total", total);
        session.setAttribute("categoryID", category_id);

        PlaceOrderDao po = new PlaceOrderDao();
        String username = (String) session.getAttribute("username");

        po.createOrder(Order, item_id, username);
        int orderID = po.getOrderID(username);
        session.setAttribute("orderid", orderID);
       
        
        response.sendRedirect("confirmorder.jsp");

    }
}
