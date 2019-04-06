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
        <title>Admin-- Edit User</title>
    </head>
    <body>
        <div class="signup-form">
            <%
                  String user_id = request.getParameter("user_id");
                  UserLogin p = UserLoginDao.getRecordById(Integer.parseInt(user_id));
            %>    
            <form action="editUserProcess.jsp" method="post" onsubmit="return validate();">
                        <h2>Edit User</h2>
                       
                <div class="form-group">
                    <input type="text"  class="form-control" name="firstname" required="required">
                </div>
                <div class="form-group">
                        <input type="text" class="form-control" name="lastname" placeholder="Lastname" required="required">
                </div>
                <div class="form-group">
                        <input type="text" class="form-control" name="address" placeholder="Address" required="required">
                </div>
               <div class="form-group">
                        <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                </div>
                <div class="form-group">
                        <input type="text" class="form-control" name="mobile"  pattern="[9]{1}[8]{1}[0-9]{8}" placeholder="Mobile" required="required">
                </div>
                <div class="form-group">
                User type:<select class="form-control" name="role">
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                         </select>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="passwords" name="password" placeholder="Password" required="required">
                </div>
                 <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
                </div>
            </form>
        </div>
    </body>
</html>

