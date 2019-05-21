<%-- 
    Document   : registerProcess
    Created on : Mar 26, 2019, 11:54:37 AM
    Author     : 97798

            
            String productEmail = request.getParameter("productEmail");
            String userEmail = request.getParameter("userEmail");
            if( productEmail.equals(userEmail)){
                session.setAttribute("msg", "sorry! You can not bid on your own product!");
                response.sendRedirect("home.jsp");
            }else{
                int i = BidDao.bidProduct(bd);
                session.setAttribute("msg", "Product Bided Successfully!");
                response.sendRedirect("home.jsp");
            }
         
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
            String productEmail = request.getParameter("productEmail");
            String userEmail = request.getParameter("userEmail");
            if( productEmail.equals(userEmail)){
                session.setAttribute("msg", "Sorry ! This is your own product!");
                response.sendRedirect("home.jsp");
            }else{
                int i = BidDao.bidProduct(bd);
                session.setAttribute("msg", "Product Bided Successfully!");
                response.sendRedirect("home.jsp");
            }
         %>
    </body>
</html>
