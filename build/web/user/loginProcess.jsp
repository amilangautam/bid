<%-- 
    Document   : loginProcess
    Created on : Mar 26, 2019, 12:48:07 PM
    Author     : 97798

--%>
<%@page import="com.bid.bean.UserLogin,com.bid.dao.UserLoginDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="b" class="com.bid.bean.UserLogin"></jsp:useBean>
        <jsp:setProperty property="*" name="b"></jsp:setProperty>
        <%
          UserLoginDao obj_UserLoginDao = new UserLoginDao();
          boolean flag = obj_UserLoginDao.check_user(b);
          if(flag){
              session.setAttribute("user_session",b);
              response.sendRedirect("home.jsp");
          }else{
              session.setAttribute("msg", "Invalid Login!");
              response.sendRedirect("login.jsp");
          }
        %>   
    </body>
</html>
