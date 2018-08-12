<%-- 
    Document   : delete
    Created on : 2 Mar, 2017, 2:26:56 PM
    Author     : root
--%>

<%@page import="ExpenseModel.CompanyDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            CompanyDao cm=new CompanyDao();
            int x=cm.deleteComp(id,application);
            if(x>0)
            {
            %>
            <script>
                alert("Customer Information Deleted");
                window.location="view_company.jsp";
            </script>
            <% } %>
    </body>
</html>
