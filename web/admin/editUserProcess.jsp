<%-- 
    Document   : editUserProcess
    Created on : Apr 6, 2019, 12:59:50 PM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bid.bean.UserLogin,com.bid.dao.UserLoginDao,java.util.*" %>

<jsp:useBean id="b" class="com.bid.bean.UserLogin"></jsp:useBean>
<jsp:setProperty property="*" name="b"></jsp:setProperty> 
<%
 int i = UserLoginDao.updateUser(b);
 session.setAttribute("msg", "Data Updated Sucssfully!");
 response.sendRedirect("viewUser.jsp");
 
%>
