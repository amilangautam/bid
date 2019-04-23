<%-- 
    Document   : addAdminProcess
    Created on : Apr 23, 2019, 10:44:31 AM
    Author     : 97798
--%>

<%@page import="com.bid.bean.UserLogin,com.bid.dao.UserLoginDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <jsp:useBean id="b" class="com.bid.bean.UserLogin"></jsp:useBean>
        <jsp:setProperty property="*" name="b"></jsp:setProperty>
        <% 
            int i = UserLoginDao.insertAdmin(b);
            session.setAttribute("msg","Admin Added Successfully !");
            response.sendRedirect("viewUser.jsp");
         %>

