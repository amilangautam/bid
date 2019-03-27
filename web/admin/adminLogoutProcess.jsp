<%
  session.removeAttribute("admin_session");
  
  session.setAttribute("msg", "logout Successfully");
  response.sendRedirect("adminLogin.jsp");
%>