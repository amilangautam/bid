<%-- 
    Document   : index
    Created on : Mar 26, 2019, 10:45:03 AM
    Author     : 97798
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script src="bootstrap/css/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
   <body>
        <div>
               <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                  <a class="navbar-brand" href="#">BID ON</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto"> <li class="nav-item">
                       
                      <li class="nav-item ">
                        <a class="nav-link" href="user\login.jsp">Sign In</a>
                      </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                 <%
                        try {
                                String data = session.getAttribute("msg").toString();
                   %>
                                <%= data %>
                   <%         
                                session.removeAttribute("msg");
                            } catch (Exception e) {
                            }
                 %>
              </div>
            </nav>
        </div>
    </body>
</html>
