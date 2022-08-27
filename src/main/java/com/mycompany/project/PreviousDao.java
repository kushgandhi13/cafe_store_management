/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class PreviousDao {

    public order check(String order_id, String username) {
        order Order = new order();
        Vector<String> item_name = new Vector();
        Vector<Integer> item_price = new Vector();
        Vector<Integer> item_qunt = new Vector();

        String url = "jdbc:mysql://localhost:3306/customers";
        String user = "root";
        String pass = "Rishabh123!";
        String query = " select pt.ProductName, UnitPrice, od.Quantity from orderdetails as od LEFT JOIN product as pt ON od.ProductID = pt.ProductID where od.OrderID = ? and od.Username=?;";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query);
            
            st.setString(1,order_id);
            st.setString(2,username);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                item_name.add(rs.getString("ProductName"));
                item_price.add(rs.getInt("UnitPrice"));
                item_qunt.add(rs.getInt("Quantity"));
            }

            Order.setList_of_itemsID(item_name);
            Order.setPrice_of_items(item_price);
            Order.setQuantity(item_qunt);
            
            con.close();
            return Order;
            
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);

        }

        return null;
    }

}
