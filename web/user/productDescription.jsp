<%-- 
    Document   : productDescription
    Created on : Apr 10, 2019, 7:24:17 AM
    Author     : 97798
--%>
<%@page import="com.bid.bean.UserLogin"%>
<%@page import="java.util.List"%>
<%@page import="com.bid.dao.ProductDao"%>
<%@page import="com.bid.bean.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Description</title>
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/productDescription.css">
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
                   Product p = ProductDao.getRecordById(Integer.parseInt(pid));
                 %>
        <script>
            function validatePrice() {
                var x = document.forms["myForm"]["bid_price"].value;
                if (x <= <%=p.getInitialprice()%>){
                    alert("Bid amount must be greater than <%=p.getInitialprice()%>");
                    return false;
                }
            }
        </script>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <img src="../image/product/<%= p.getFilename()%>" height="300" width="350" style="margin-top: 30px">
                    <h5>Product Name :<span><%= p.getPname()%></span></h5>
                    <h5>Category :<span><%= p.getCategory()%></span></h5>
                    <h5>Minimum Bid :<span><%= p.getInitialprice()%></span></h5>
                    <h5>Bid Deadline :<span><%= p.getDate()%></span></h5>
                    <h5>Product Description:</h5>
                    <p> " <%= p.getDescription()%> "</p>
                    <form action="bidProcess.jsp" method="post" name="myForm" onsubmit="return validatePrice()">
                        
                         <div class="form-group">
                             <input type="hidden" name="pid" value="<%= p.getPid()%>">
                             <input type="hidden" name="email" value="<%if(us != null){ %><%=us.getEmail()%><%}%>">
                            <input type="text" class="form-control" onkeypress="isInputNumber(event)"  name="bid_price" placeholder="Enter bid amount" required="required">
                            
                            <script>
                                  function isInputNumber(evt){
                                        var ch = String.fromCharCode(evt.which);
                                        if(!(/[0-9]/.test(ch))){
                                            evt.preventDefault();
                                        }
                                    }
                                 </script>
                             <span class="bidNote">Note: Your bid amount must be greater than <%=p.getInitialprice()%></span>    
                         </div>     
                        
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-lg btn-block">Bid Now</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </body>
</html>
