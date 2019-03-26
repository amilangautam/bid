<%
  session.removeAttribute("user_session");
  
  session.setAttribute("msg", "logout Successfully");
  response.sendRedirect("login.jsp");
%>