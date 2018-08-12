
<%  
response.setHeader("Cache-control","No-store");
response.setHeader("pragma","no-cache");

session.invalidate();
response.sendRedirect("index.html");
response.setHeader("Cache-control","No-store");
%>