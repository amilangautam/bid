<%-- 
    Document   : home
    Created on : Mar 26, 2019, 11:36:10 AM
    Author     : 97798
--%>
<%@include file="userHeader.jsp" %>
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
       
  
