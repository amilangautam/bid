<%-- 
    Document   : deleteBidProcess
    Created on : May 8, 2019, 4:34:12 PM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bid.bean.Bid,com.bid.dao.BidDao,java.util.*" %>

<jsp:useBean id="info" class="com.bid.bean.Bid"></jsp:useBean>
<jsp:setProperty property="*" name="info"></jsp:setProperty> 
<%
  
 int i= BidDao.deleteBid(info);
 session.setAttribute("msg", "Bid Deleted Successfully !!");
 response.sendRedirect("bid.jsp");
 
%>
