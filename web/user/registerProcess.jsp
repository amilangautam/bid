<%-- 
    Document   : registerProcess
    Created on : Mar 26, 2019, 11:54:37 AM
    Author     : 97798

--%>
<%@page import="com.bid.bean.UserLogin,com.bid.dao.UserLoginDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <jsp:useBean id="b" class="com.bid.bean.UserLogin"></jsp:useBean>
        <jsp:setProperty property="*" name="b"></jsp:setProperty>
        <% 
            int i = UserLoginDao.insert(b);
            session.setAttribute("msg","successfully registered, please login!");
            response.sendRedirect("login.jsp");
         %>
    </body>
</html>
