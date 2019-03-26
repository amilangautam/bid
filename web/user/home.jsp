<%-- 
    Document   : home
    Created on : Mar 26, 2019, 11:36:10 AM
    Author     : 97798
--%>
<%@page import="com.bid.bean.UserLogin" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
       
       UserLogin obj_UserLogin = (UserLogin) session.getAttribute("user_session");
       if(obj_UserLogin == null){
           session.setAttribute("msg","please Login First!");
           response.sendRedirect("login.jsp");
       }
         %> 
        <h1>Hello World!</h1>
        <a href="logoutProcess.jsp">Logout</a>
    </body>
</html>
