<%-- 
    Document   : feedbackProcess
    Created on : Apr 24, 2019, 7:34:55 PM
    Author     : 97798
--%>

<%@page import="com.bid.bean.Feedback,com.bid.dao.FeedbackDao" %>

        <jsp:useBean id="b" class="com.bid.bean.Feedback"></jsp:useBean>
        <jsp:setProperty property="*" name="b"></jsp:setProperty>
        <% 
            int i = FeedbackDao.addFeedback(b);
            session.setAttribute("msg", "Your Feedback is  successfully sent!");
            response.sendRedirect("feedback.jsp");
         
         %>
 