<%-- 
    Document   : adminLogin
    Created on : Mar 27, 2019, 9:18:18 AM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/admin_login.css">
        <script src="../bootstrap/css/bootstrap.min.js"></script>
        <title>Admin Login</title>
    </head>
   <body>
        <div class="login-form">
            <%
            try {
                  String data = session.getAttribute("loginMsg").toString();
              %>
                   
                   <div class="alert alert-danger" role="alert">
                        <%= data %>
                   </div>
              <%         
                  session.removeAttribute("loginMsg");
                } catch (Exception e) {
                
                }
              %>
            <form action="adminLoginProcess.jsp" method="post">
                <h2 class="text-center">Admin Sign In</h2>       
                <div class="form-group">
                    <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Log in</button>
                </div>
                       
            </form>
              <%
            try {
                  String data = session.getAttribute("msg").toString();
              %>
                   
                   <div class="alert alert-danger" role="alert">
                        <%= data %>
                   </div>
              <%         
                  session.removeAttribute("msg");
                } catch (Exception e) {
                
                }
              %>
            
           
        </div>
       
    </body>
</html>

