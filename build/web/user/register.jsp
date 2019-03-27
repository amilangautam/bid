<%-- 
    Document   : register
    Created on : Mar 26, 2019, 10:43:49 AM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/user_register.css">
        <script src="../bootstrap/css/bootstrap.min.js"></script>
        <script src="../javascript/userLogin.js"></script>
        <title>User Registration</title>
    </head>
    <body>
        <div class="signup-form">
            <form action="registerProcess.jsp" method="post" onsubmit="return validate();">
                        <h2>Register</h2>
                        
                <div class="form-group">
                        <input type="text" class="form-control" name="firstname" placeholder="Firstname" required="required">
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
                    <input type="password" class="form-control" id="passwords" name="password" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="confirm_passwords" name="confirm_password" placeholder="Confirm Password" required="required">
                 </div>        
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
                </div>
                 <div class="alert" role="alert">
                        <span id="message_cpassword"> </span>
                  </div>
            </form>
                <div class="text-center">Already have an account? <a href="login.jsp">Sign in</a></div>
        </div>
    </body>
</html>
