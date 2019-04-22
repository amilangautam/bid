<%-- 
    Document   : editUser
    Created on : Apr 6, 2019, 12:59:31 PM
    Author     : 97798
--%>

<%@page import="com.bid.bean.UserLogin"%>
<%@page import="com.bid.dao.UserLoginDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/user_register.css">
        <script src="../bootstrap/css/bootstrap.min.js"></script>
        <script src="../javascript/userLogin.js"></script>
        <title>Update User</title>
    </head>
    <body>
        
        <%
           String user_id = request.getParameter("user_id");
           UserLogin b = UserLoginDao.getRecordById(Integer.parseInt(user_id));
        %>
        <div class="signup-form">
             <form action="editUserProcess.jsp" method="post" onsubmit="return validate();">
                        <h2>Edit User</h2>
                <input type="hidden" name="user_id" value="<%= b.getUser_id() %>" >     
                <div class="form-group">
                    <input type="text"  class="form-control" value="<%= b.getFirstname() %>" name="firstname" required="required" placeholder="Firstname">
                </div>
                <div class="form-group">
                        <input type="text" class="form-control" value="<%= b.getLastname() %>" name="lastname " placeholder="Lastname" required="required">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" value="<%= b.getAddress() %>" name="address" placeholder="Address" required="required">
                </div>
               <div class="form-group">
                        <input type="email" class="form-control" value="<%= b.getEmail() %>"  name="email" placeholder="Email" required="required">
                </div>
                <div class="form-group">
                        <input type="text" class="form-control" value="<%= b.getMobile() %>" name="mobile"  pattern="[9]{1}[8]{1}[0-9]{8}" placeholder="Mobile" required="required">
                </div>
                <div class="form-group">
                User type:<select class="form-control"  name="role">
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                         </select>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" value="<%= b.getPassword() %>" id="passwords" name="password" placeholder="Password" required="required">
                </div>
                 <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Update User</button>
                </div>
            </form>
        </div>
    </body>
</html>

