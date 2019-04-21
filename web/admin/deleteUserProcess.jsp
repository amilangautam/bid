<%-- 
    Document   : deleteUserProcess
    Created on : Apr 6, 2019, 12:46:44 PM
    Author     : 97798
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bid.bean.UserLogin,com.bid.dao.UserLoginDao,java.util.*" %>

<jsp:useBean id="info" class="com.bid.bean.UserLogin"></jsp:useBean>
<jsp:setProperty property="*" name="info"></jsp:setProperty> 
<%
  int i= UserLoginDao.deleteUser(info);
 session.setAttribute("msg", "User Deleted Successfully !!");
 response.sendRedirect("viewUser.jsp");
 
%>

