<%-- 
    Document   : editor
    Created on : Oct 29, 2020, 10:59:45 AM
    Author     : kush.gandhi
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Editor Page</title>
</head>
<% //In case, if Editor session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Editor")== null) )
{
%>
<jsp:forward page="/Login.jsp"></jsp:forward>
<%} %>
<body>
<center><h2>Staff</h2></center>
 
<%@include file= "components/navbar.jsp" %>
<%@include file= "components/common_css_js.jsp" %>
 
 
</body>
</html>
