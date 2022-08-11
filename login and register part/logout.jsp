<%
session.removeAttribute("customer");
session.removeAttribute("admin");
response.sendRedirect("login");
%>