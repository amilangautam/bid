<%-- 
    Document   : changePasswordProcess
    Created on : Apr 23, 2019, 1:17:30 PM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bid.bean.UserLogin,com.bid.dao.UserLoginDao,java.util.*" %>

<jsp:useBean id="b" class="com.bid.bean.UserLogin"></jsp:useBean>
<jsp:setProperty property="*" name="b"></jsp:setProperty> 
<%
 int i = UserLoginDao.changeUserPassword(b);
 session.setAttribute("msg", "Password Changed Successfully, Please Login!");
 response.sendRedirect("login.jsp");
 
%>
