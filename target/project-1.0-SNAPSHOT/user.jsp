
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>User Page</title>
    </head>
    <% //In case, if User session is not set, redirect to Login page.
        if ((request.getSession(false).getAttribute("User") == null)) {
    %>
    <jsp:forward page="/Login.jsp"></jsp:forward>
    <%}
    %>
    <%@include file="components/common_css_js.jsp" %>

    <body>
        
        <center><h2>Menu</h2></center>
        <%@include file="/menu.jsp"%>


    </body>
</html>
