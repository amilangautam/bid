<%-- 
    Document   : viewMyProductBid
    Created on : Apr 10, 2019, 7:24:17 AM
    Author     : 97798
--%>
<%@page import="com.bid.bean.UserLogin"%>
<%@page import="java.util.List"%>
<%@page import="com.bid.dao.BidDao"%>
<%@page import="com.bid.bean.Bid"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Description</title>
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/productDescription.css">
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="../css/userHomeCard.css">
        <script src="../bootstrap/css/bootstrap.min.js"></script>
        <style>
            .bidNote{
                font-size: 12px;
            }
        </style>
        
    </head>
    <body>
        <%
       UserLogin us = (UserLogin)session.getAttribute("user_session");
       if(us == null){
           session.setAttribute("loginMsg", "Please Login First !");
           response.sendRedirect("login.jsp");
       }
         %>
        <div class="container">
          <%
            String pid = request.getParameter("pid");
            List<Bid> list= BidDao.getMyProductBid(Integer.parseInt(pid));
            request.setAttribute("list",list);
            int count =0;
        %>
         <div class="row">
             <div class="col-md-2">
                 <a href="myProduct.jsp?email=<%if(us != null){ %><%= us.getEmail() %><%}%>">Back</a>
             </div>
                <div class="col-md-8">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style=" position: absolute; top:150px;">
                    <h1>Total Bidder</h1>
                <thead>
                  <tr>
                    <th>SN.</th>
                    <th>Bidder</th>
                    <th>Bid Amount</th>
                    <th>Status</th>
                   </tr>
                </thead>
                <tbody>
                 <c:forEach items="${list}" var="p"> 
                 <tr>
                     <td><%= ++count %></td>
                     <td>${p.getEmail()}</td>
                     <td>${p.getBid_price()}</td>
                     <td>${p.getStatus()}</td>
                 </tr>
                  </c:forEach>
                 </tbody>
              </table>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </body>
</html>
