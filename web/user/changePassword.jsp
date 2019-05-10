<%-- 
    Document   : home
    Created on : Mar 26, 2019, 11:36:10 AM
    Author     : 97798
--%>
<%@page import="com.bid.dao.UserLoginDao"%>
<%@page import="com.bid.bean.UserLogin"%>
<%@page import="java.util.List"%>
<%@page import="com.bid.dao.ProductDao"%>
<%@page import="com.bid.bean.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>User DashBoard</title>

  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="../css/userHomeCard.css">
  <script src="../javascript/userLogin.js"></script>
  <style>
      .addProduct{
          color: white; position: absolute;left: 223px;text-decoration: none;
          
      }
      .addProduct:hover{
          color: rgba(255, 255, 255, 0.75);
          text-decoration: none;
      }
                                                                        
  </style>

</head>

<body id="page-top">
    <%
       UserLogin us = (UserLogin)session.getAttribute("user_session");
       if(us == null){
           session.setAttribute("loginMsg", "Please Login First !");
           response.sendRedirect("login.jsp");
       }
         %>

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1" href="home.jsp">Bid On</a>

    <a href="addProduct.jsp" class="addProduct">Add Product</a>

    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search Product . . . ." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
   </form>
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <%
                if(us != null){ %> <%= us.getEmail() %> <%}
            %>
            <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="logoutProcess.jsp">Logout</a>
        </div>
      </li>
    </ul>
  </nav>

  <div id="wrapper">
  <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Product</span>
        </a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Profile</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="myProfile.jsp?email=<%if(us != null){ %><%= us.getEmail() %><%}%>">My profile</a>
          <a class="dropdown-item" href="changePassword.jsp">Change Password</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Bid</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="myBid.jsp?email=<%if(us != null){ %><%= us.getEmail() %><%}%>">My Bid</a>
          <a class="dropdown-item" href="bidWinner.jsp">Bid Winner</a>
          <a class="dropdown-item" href="myProduct.jsp?email=<%if(us != null){ %><%= us.getEmail() %><%}%>">My product</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="feedback.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Feedback</span></a>
      </li>
    </ul>
   <!-- product detail -->
   
   <!-- main body start -->
   <div id="content-wrapper">
      <hr>
      <div class="container">
        <form class="form" action="changePasswordProcess.jsp" method="post" id="registrationForm" onsubmit="return validate();">
           <div >
                <span id="message_cpassword" style="color:red;"> </span>
                </div>
            <div class="form-group">
                    <div class="col-xs-6">
                        <label for="password">
                            <h4>Password</h4></label>
                <input type="hidden" name="email"  value="<%if(us != null){ %><%= us.getEmail() %><%}%>">        
                <input type="password" class="form-control" name="password" id="passwords" placeholder="password" title="enter your password.">
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-xs-6">
                        <label for="password2">
                            <h4>Verify Password</h4></label>
                        <input type="password" class="form-control" name="confirm_password" id="confirm_passwords" placeholder="confirm password" title="enter your password2.">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-12">
                        <br>
                        <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                        <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                    </div>
                </div>
                
         </form>
      </div>
   </div>
   <!-- main body finisehed -->
              
              
 
 <!-- /.content-wrapper -->
 </div>
  <!-- /#wrapper -->
  
  
  

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
 <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="../vendor/chart.js/Chart.min.js"></script>
  <script src="..vendor/datatables/jquery.dataTables.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="javascript/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="../javascript/demo/datatables-demo.js"></script>
  <script src="../javascript/demo/chart-area-demo.js"></script>

</body>

</html>

