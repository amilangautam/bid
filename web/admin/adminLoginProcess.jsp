<%-- 
    Document   : adminLoginProcess
    Created on : Mar 27, 2019, 9:20:50 AM
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
          
          String rs = obj_UserLoginDao.check_admin(b);
          if(rs=="admin_role"){
              session.setAttribute("admin_session",b);
              response.sendRedirect("dashboard.jsp");
          }else{
              session.setAttribute("msg", "Invalid Login!");
              response.sendRedirect("adminLogin.jsp");
          }
        %>   
    </body>
</html>

