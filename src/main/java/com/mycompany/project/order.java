package com.mycompany.project;

import java.util.Vector;

public class order {
    protected int orderID;
    protected double Order_price;
    protected Vector<String> list_of_itemsID;
    protected Vector<Integer> price_of_items;
    protected Vector<Integer> quantity;

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public double getOrder_price() {
        
        for (int i = 0; i < this.price_of_items.size(); i++){
            Order_price += (price_of_items.get(i) * quantity.get(i));
        }
        
        return Order_price;
    }


    public Vector<String> getList_of_itemsID() {
        return list_of_itemsID;
    }

    public void setList_of_itemsID(Vector<String> list_of_itemsID) {
        this.list_of_itemsID = list_of_itemsID;
    }

    public Vector<Integer> getPrice_of_items() {
        return price_of_items;
    }

    public void setPrice_of_items(Vector<Integer> price_of_items) {
        this.price_of_items = price_of_items;
    }

    

    public Vector<Integer> getQuantity() {
        return quantity;
    }

    public void setQuantity(Vector<Integer> quantity) {
        this.quantity = quantity;
    }

    
    
}


