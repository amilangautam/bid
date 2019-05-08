<%-- 
    Document   : changeStatusOfBidderProcess
    Created on : May 8, 2019, 5:20:57 PM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bid.bean.Bid,com.bid.dao.BidDao,java.util.*" %>

<jsp:useBean id="b" class="com.bid.bean.Bid"></jsp:useBean>
<jsp:setProperty property="*" name="b"></jsp:setProperty> 
<%
 int i = BidDao.updateStatus(b);
 session.setAttribute("msg", "Bidder Updated Sucssfully!");
 response.sendRedirect("bid.jsp");
 
%>
