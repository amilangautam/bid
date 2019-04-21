<%
  session.removeAttribute("admin_session");
  
  session.setAttribute("msg", "Logout Successfully");
  response.sendRedirect("adminLogin.jsp");
%>