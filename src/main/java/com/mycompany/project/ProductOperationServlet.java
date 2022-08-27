
package com.mycompany.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        String op = request.getParameter("operation");
        
        String catID = request.getParameter("catID");
        String catTitle = request.getParameter("catTitle");
        
        String proName = request.getParameter("proName");
        String proPrice = request.getParameter("proPrice");
        String proDetail = request.getParameter("proDetail");
        String proID = request.getParameter("proID");
        String proCategoryID = request.getParameter("proCategoryID");
        
        response.setContentType("text/html;charset=UTF-8");
        {
            
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root", "Rishabh123!");

                if (op.trim().equals("addcategory")) {

                    PreparedStatement ps = con.prepareStatement("insert into ProductCategory(ProductCategoryID,ProductCategoryName) values(?,?);");

                    ps.setString(1, catID);
                    ps.setString(2, catTitle);

                    int x = ps.executeUpdate();

                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Product Category added");
                    response.sendRedirect("admin.jsp");  
                } 
                
                else if (op.trim().equals("addproduct")) {
                    
                    PreparedStatement ps = con.prepareStatement("insert into Product(ProductID,ProductCategoryID,ProductName,AdditionalDetail,UnitPrice) values(?,?,?,?,?);");
                    ps.setString(1, proID);
                    ps.setString(2, proCategoryID);
                    ps.setString(3, proName);
                    ps.setString(4, proDetail);
                    ps.setString(5, proPrice);
                    
                    int x = ps.executeUpdate();
                    
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Product added");
                    response.sendRedirect("admin.jsp");
                    
                } else {
                    
                    System.out.println("none");
                    response.sendRedirect("admin.jsp");
                }
                con.close();
                

            } catch (Exception e) {
                
                response.sendRedirect("admin.jsp");
                e.printStackTrace();
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
