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

  <title>Admin-Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
    <%
       UserLogin as = (UserLogin)session.getAttribute("admin_session");
       if(as == null){
           session.setAttribute("loginMsg", "Please Login First !");
           response.sendRedirect("adminLogin.jsp");
       }
         %>

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1" href="dashboard.jsp">Start Bootstrap</a>
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
                if(as != null){ %> <%= as.getEmail() %> <%}
            %> <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="adminLogoutProcess.jsp">Logout</a>
        </div>
      </li>
    </ul>
  </nav>

  <div id="wrapper">
  <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="dashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Product</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="viewUser.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>User</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Bid</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="bid.jsp">Bid Detail</a>
          <a class="dropdown-item" href="bidWinner.jsp">Bid Winner</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewFeedback.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Feedback</span></a>
      </li>
    </ul>
   <!-- product detail -->
   
   
   
  <!-- main body start -->
   <div id="content-wrapper">
     <div class="container-fluid">
     <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Product</li>
        </ol>
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Product Detail
          </div>
          <div class="card-body">
            <div class="table-responsive">
                  <%  
                    List<Product> list=ProductDao.getAllProductRecordsByAdmins();
                    request.setAttribute("list",list);  
                    int count = 0;
                  %>
                <div class="row">
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
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Product Id</th>
                    <th>Seller</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>CLose Date</th>
                    <th>Initial price</th>
                    <th>Edit</th>
                    <th>Delete</th>
                   </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="u"> 
                  <tr>
                    <td>${u.getPid()}</td>
                    <td>${u.getEmail()}</td>
                    <td>${u.getPname()}</td>
                    <td><img src="../image/product/${u.getFilename()}" height="100" width="140" ></td>
                    <td>${u.getCategory()}</td>
                    <td>${u.getDescription()}</td>
                    <td>${u.getDate()}</td>
                    <td>${u.getInitialprice()}</td>
                    <td><a href="editProduct.jsp?pid=${u.getPid()}">Edit</a></td>  
                    <td><a href="deleteProductProcess.jsp?pid=${u.getPid()}">Delete</a> </td>
                  </tr>
                </c:forEach>
                 <tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
      </div>
      <!-- /.container-fluid -->
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
            <span aria-hidden="true">�</span>
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
