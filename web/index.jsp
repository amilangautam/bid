<%-- 
    Document   : index
    Created on : Mar 26, 2019, 10:45:03 AM
    Author     : 97798
https://bootsnipp.com/snippets/O5yMd
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
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/indexProduct.css">
        <script src="bootstrap/css/bootstrap.min.js"></script>
        <title>Bid On</title>
    </head>
   <body>
        <div>
               <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                  <a class="navbar-brand" href="#">BID ON</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto"> <li class="nav-item">
                       
                      <li class="nav-item ">
                        <a class="nav-link" href="user\login.jsp">Sign In</a>
                      </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                 <%
                        try {
                                String data = session.getAttribute("msg").toString();
                   %>
                                <%= data %>
                   <%         
                                session.removeAttribute("msg");
                            } catch (Exception e) {
                            }
                 %>
              </div>
            </nav>
        </div>
 <div class="container">
     <h1></h1>
                   <%  
                    List<Product> list=ProductDao.getAllRecords();
                    request.setAttribute("list",list);  
                    int count = 0;
                  %>
    <div class="row">
        <c:forEach items="${list}" var="u">
            <div class="col-md-3 col-sm-6" style="padding-bottom: 15px;">
            <div class="product-grid4" style="border: 1px solid black">
                <div class="product-image4">
                    <a href="user/productDescription.jsp?pid=${u.getPid()}">
                        <img class="pic-1" src="image/product/${u.getFilename()}" height="180" width="200">
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title">${u.getPname()}</h3>
                    <h3 class="title">Category:<a href="#">${u.getCategory()}</a></h3>
                    <h3 class="title">Close Date:${u.getDate()}</h3>
                    <div class="price">
                     Initial Price:   ${u.getInitialprice()}
                    </div>
                    <a class="add-to-cart" href="user/productDescription.jsp?pid=${u.getPid()}">BID</a>
                </div>
            </div>
        </div>
        </c:forEach>

        
    </div>
</div>
<hr>
    </body>
</html>
