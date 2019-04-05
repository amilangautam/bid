<%-- 
    Document   : dashboard
    Created on : Mar 27, 2019, 9:21:35 AM
    Author     : 97798
--%>

<%@page import="com.bid.bean.UserLogin"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
       
       UserLogin obj_UserLogin = (UserLogin) session.getAttribute("admin_session");
       if(obj_UserLogin == null){
           session.setAttribute("msg","please Login First!");
           response.sendRedirect("adminLogin.jsp");
       }
         %> 
        <h1>Hello World!</h1>
        <a href="adminLogoutProcess.jsp">Logout</a>
    </body>
</html>

