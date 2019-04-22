<%-- 
    Document   : productDescription
    Created on : Apr 10, 2019, 7:24:17 AM
    Author     : 97798

--%>
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
    </head>
    <body>
        <div class="container">
                 <% 
                   String pid = request.getParameter("pid");
                   Product p = ProductDao.getRecordById(Integer.parseInt(pid));

                 %>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-4">
                    <img src="../image/product/<%= p.getFilename()%>" height="300" width="350" style="margin-top: 30px">
                    <h5>Product Name :<span><%= p.getPname()%></span></h5>
                    <h5>Category :<span><%= p.getCategory()%></span></h5>
                    <h5>Base Price :<span><%= p.getInitialprice()%></span></h5>
                    <h5>Bid Deadline :<span><%= p.getDate()%></span></h5>
                    <h5>Product Description:</h5>
                    <p> " <%= p.getDescription()%> "</p>
                    <form action="" method="post">
                                 
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-lg btn-block">Bid Now</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-6"></div>
            </div>
        </div>
    </body>
</html>
