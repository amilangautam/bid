<%-- 
    Document   : changeStatusOfBidderForm
    Created on : Apr 6, 2019, 12:59:31 PM
    Author     : 97798
--%>

<%@page import="com.bid.bean.Bid"%>
<%@page import="com.bid.dao.BidDao"%>
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
           String bid_id = request.getParameter("bid_id");
           Bid b = BidDao.getRecordByBidId(Integer.parseInt(bid_id));
        %>
        <div class="signup-form">
             <form action="changeStatusOfBidderProcess.jsp" method="post" onsubmit="return validate();">
                        <h2>Update Status</h2> 
                <input type="hidden" name="bid_id" value="<%=b.getBid_id()%>" >
                <div class="form-group">
                Change Status:<select class="form-control"  name="status">
                            <option value="winner">Winner</option>
                            <option value="pending">Pending</option>
                         </select>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Update Status</button>
                </div>
            </form>
        </div>
    </body>
</html>

