package com.mycompany.project;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PreviousOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PreviousDao po = new PreviousDao();

        String orderID = request.getParameter("orderid");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("User");
        session.setAttribute("orderid",Integer.parseInt(orderID));
        
        
        order Order = new order();
        
        Order = po.check(orderID, username);
        
        
        if(Order != null ){
            session.setAttribute("order", Order);
            session.setAttribute("total", Order.getOrder_price());
        
            response.sendRedirect("confirmorder.jsp");
        }
        else{
            response.sendRedirect("menu.jsp");
        }
    }

}
