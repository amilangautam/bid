<%-- 
    Document   : registerProcess
    Created on : Mar 26, 2019, 11:54:37 AM
    Author     : 97798

--%>
<%@page import="com.bid.bean.Bid,com.bid.dao.BidDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <jsp:useBean id="bd" class="com.bid.bean.Bid"></jsp:useBean>
        <jsp:setProperty property="*" name="bd"></jsp:setProperty>
        <% 
            int i = BidDao.bidProduct(bd);
            response.sendRedirect("home.jsp");
         %>
    </body>
</html>
