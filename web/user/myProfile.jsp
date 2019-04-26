<%-- 
    Document   : home
    Created on : Mar 26, 2019, 11:36:10 AM
    Author     : 97798
https://www.bootdey.com/snippets/view/Table-user-information#html
 
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
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="../css/userHomeCard.css">
  <style>
      .addProduct{
          color: white; position: absolute;left: 223px;text-decoration: none;
          
      }
      .addProduct:hover{
          color: rgba(255, 255, 255, 0.75);
          text-decoration: none;
      }
       .inf-content{
    border:1px solid #DDDDDD;
    -webkit-border-radius:10px;
    -moz-border-radius:10px;
    border-radius:10px;
    box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
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
      <li class="nav-item">
        <a class="nav-link" href="feedback.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Feedback</span></a>
      </li>
    </ul>
   <!-- product detail -->
   
   <!-- main body start -->
         <%
            String email = request.getParameter("email");
            UserLogin u = UserLoginDao.getSessionRecordByEmail(email);
        %>
   <div id="content-wrapper">
   
            <div class="container bootstrap snippet">
<div class="panel-body inf-content">
    <div class="row">
        <div class="col-md-4">
            <img alt="" style="width:600px;" title="" class="img-circle img-thumbnail isTooltip" src="../image/user/user.png" data-original-title="Usuario"> 
            <ul title="Ratings" class="list-inline ratings text-center">
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
            </ul>
        </div>
        <div class="col-md-6">
            <strong>My Profile</strong><br>
            <div class="table-responsive">
            <table class="table table-condensed table-responsive table-user-information">
                <tbody>
                    <tr>        
                        <td>
                            <strong>
                                <span class="fas fa-asterisk text-primary"></span>
                                User Id                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                            <%= u.getUser_id() %>     
                        </td>
                    </tr>
                    <tr>    
                        <td>
                            <strong>
                                <span class="fa fa-user  text-primary"></span>    
                                Firstname                                               
                            </strong>
                        </td>
                        <td class="text-primary text-capitalize">
                            <%= u.getFirstname() %>     
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="fa fa-cloud text-primary"></span>  
                                Lastname                                                
                            </strong>
                        </td>
                        <td class="text-primary text-capitalize">
                           <%= u.getLastname() %>   
                        </td>
                    </tr>
                    
                    <tr>        
                        <td>
                            <strong>
                                <span class="fa fa-address-card text-primary"></span>  
                                Address                                                
                            </strong>
                        </td>
                        <td class="text-primary text-capitalize">
                           <%= u.getAddress() %>   
                        </td>
                    </tr>


                    <tr>        
                        <td>
                            <strong>
                                <span class="fa fa-eye text-primary"></span> 
                                Role                                                
                            </strong>
                        </td>
                        <td class="text-primary text-capitalize">
                            <%= u.getRole() %> 
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="fa fa-phone text-primary"></span> 
                                Phone                                                
                            </strong>
                        </td>
                        <td class="text-primary text-capitalize">
                            <%= u.getMobile() %> 
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="fa fa-envelope text-primary"></span> 
                                Email                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <%= u.getEmail() %>  
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="fa fa-calendar text-primary"></span>
                                created                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <%= u.getRegistered_date() %> 
                        </td>
                    </tr>
                                                       
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>
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

