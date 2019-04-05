<%-- 
    Document   : editProduct
    Created on : Apr 5, 2019, 1:10:18 PM
    Author     : 97798
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TimeZone"%>
<%@page import="com.bid.bean.Product,com.bid.dao.ProductDao,java.util.*" %>
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
           String pid = request.getParameter("pid");
           Product p = ProductDao.getRecordById(Integer.parseInt(pid));
            
         %>
        <div class="signup-form">
            <form action="editProductProcess.jsp" method="post" enctype="multipart/form-data">
                        <h2>Edit Product</h2>
                <input type="hidden" name="id" value="<%=p.getPid() %>">      
                <div class="form-group">
                Product Name      <input type="text" class="form-control" name="pname" placeholder="Product Name" value="<%=p.getPname()%>" required="required">
                </div>
                <div class="form-group">
                Product Category:<select class="form-control" name="category" value="<%= p.getCategory()%>" >
                            <option value="Books">Books</option>
                            <option value="Electronoics">Electronics</option>
                            <option value="Beauty and Cosmetics">Beauty and Cosmetics</option>
                            <option value="Health and Personal Care">Health and Personal Care</option>
                            <option value="Houseware">Housewares</option>
                            <option value="Clothing and Fashion">Clothing and Fashion</option>
                         </select>
                </div>
                <div class="form-group">
                 Product Description   <textarea class="form-control" value="<%= p.getDescription()%>" rows="5" cols="50" placeholder="Product Description" name="description"></textarea>
                </div>
                <div class="form-group">
                Initial Price    <input type="text" class="form-control" value="<%= p.getInitialprice()%>"  name="initialprice" onkeypress="isInputNumber(event)" placeholder="Initial Price" required="required">
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
                 Bid Deadline: <input type="text" value="<%= p.getDate()%>" class="form-control" name="date" required="required">
                 </div> 
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Add Product</button>
                </div>
            </form>
               
        </div>
    </body>
</html>
