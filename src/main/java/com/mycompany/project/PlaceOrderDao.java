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
import javax.servlet.http.HttpSession;

public class PlaceOrderDao {
    
    public int getOrderID(String username)
    {
        String query1 = "  select * from orders where Username=? order by OrderID desc LIMIT 1;";

        String url = "jdbc:mysql://localhost:3306/customers";
        String user = "root";
        String pass = "Rishabh123!";
        
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query1);

            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            if(rs.next()){
                
                return rs.getInt("OrderID");
                
            }
            con.close();
            

        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);

        }
        return 0;
        
    }
    
    public boolean insertItem(int orderid, String username,int proid, int quantity)
    {
        String query1 = " insert into orderdetails(OrderID,Username,ProductID,Quantity) values(?,?,?,?);";

        String url = "jdbc:mysql://localhost:3306/customers";
        String user = "root";
        String pass = "Rishabh123!";
        
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query1);

            st.setString(1, Integer.toString(orderid));
            st.setString(2, username);
            st.setInt(3, proid);
            st.setInt(4, quantity);

            int rs = st.executeUpdate();
            if(rs == 1){
                
                return true;
                
            }
            con.close();
            

        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);

        }
        return false;
    }
    
    public boolean createOrder(order Order, Vector<Integer> temp_id,String username) {
        String query1 = " insert into orders(Order_Price,Username) values(?,?);";

        String url = "jdbc:mysql://localhost:3306/customers";
        String user = "root";
        String pass = "Rishabh123!";

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query1);

            st.setString(1, Integer.toString((int) Order.getOrder_price()));
            st.setString(2, username);

            int rs = st.executeUpdate();
            if(rs == 1){
                int orderid = getOrderID(username);
                Vector<Integer> item_qunt = Order.getQuantity();
                
                for (int i = 0; i < temp_id.size(); i++) {
                    insertItem(orderid, username, temp_id.get(i), item_qunt.get(i));
                }
                
                return true;
                
            }
            con.close();
            

        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);

        }
        return false;
    }

}
