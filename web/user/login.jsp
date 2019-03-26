<%-- 
    Document   : login
    Created on : Mar 26, 2019, 10:43:31 AM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/user_login.css">
        <script src="../bootstrap/css/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
   <body>
        <div class="login-form">
            <form action="loginProcess.jsp" method="post">
                <h2 class="text-center">Log in</h2>       
                <div class="form-group">
                    <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Log in</button>
                </div>
                <div class="clearfix">
                    <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
                    <a href="#" class="pull-right">Forgot Password?</a>
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
            <p class="text-center"><a href="register.jsp">Create an Account</a></p>
           
        </div>
       
    </body>
</html>
