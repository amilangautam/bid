<%-- 
    Document   : addProduct
    Created on : Mar 28, 2019, 9:24:18 AM
    Author     : 97798
--%>

<%@page import="com.bid.bean.UserLogin"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/user_register.css">
        <script src="../bootstrap/css/bootstrap.min.js"></script>
        <title>Add Product</title>
    </head>
    <body>
        <%
       UserLogin us = (UserLogin)session.getAttribute("user_session");
       if(us == null){
           session.setAttribute("loginMsg", "Please Login First !");
           response.sendRedirect("login.jsp");
       }
         %>
        <div class="signup-form">
            <form action="addProductProcess.jsp" method="post" enctype="multipart/form-data">
                        <h2>Add Product</h2>
                        
                <div class="form-group">
                        <input type="text" class="form-control" name="pname" placeholder="Product Name" required="required">
                </div>
                <div class="form-group">
                Product Category:<select class="form-control" name="category">
                            <option value="Books">Books</option>
                            <option value="Electronoics">Electronics</option>
                            <option value="Beauty">Beauty</option>
                            <option value="Houseware">Housewares</option>
                            <option value="Clothing">Clothing</option>
                             <option value="Fashion">fashion</option>
                         </select>
                </div>
                <div class="form-group">
                    <textarea class="form-control" rows="5" cols="50" placeholder="Product Description" name="description"></textarea>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control"  name="initialprice" onkeypress="isInputNumber(event)" placeholder="Initial Price" required="required">
                    <script>
                        function isInputNumber(evt){
                            var ch = String.fromCharCode(evt.which);
                            if(!(/[0-9]/.test(ch))){
                                evt.preventDefault();
                            }
                        }
                    </script>
                 </div>
                <div class="form-group">
                         <%
                          TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
                          SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

                          Date today4 = new Date();
                          String date4 = format.format(today4);
                        %>
                 Bid Deadline: <input type="text" value="<%=date4 %>" class="form-control" name="date" required="required">
                 </div> 
                 <div class="form-group">
                    <input type="file" class="form-control"  name="filename" placeholder="product Image" required="required">
                 </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Add Product</button>
                </div>
            </form>
               
        </div>
    </body>
</html>
