<%-- 
    Document   : deleteProduct
    Created on : Apr 5, 2019, 12:49:08 PM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bid.bean.Product,com.bid.dao.ProductDao,java.util.*" %>

<html>
    <head></head>
    <body>
<jsp:useBean id="info" class="com.bid.bean.Product"></jsp:useBean>
<jsp:setProperty property="*" name="info"></jsp:setProperty> 
<%
  int i= ProductDao.deleteProduct(info);
 session.setAttribute("msg", "Product Deleted Successfully !!");
 response.sendRedirect("home.jsp");
 
%>
        
    </body>
</html>
