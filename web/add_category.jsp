
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ExpenseModel.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
</head>
      <body> 
         
         
        <form action="#" method="post">
            <br><br><br><br><br>
            <center>  
                
                <table>
                     <tr>
                        <td>
                            <label>Category Name</label>
                        </td>
                        
                        <td>
                                <input type="text" name="txtname">
                        <td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center><button type="submit">Add</button></center>
                        </td>
                        
                    <tr>
     

               </table>
            </center>
        </form>
          <%
            String c_name = request.getParameter("txtname");
            if(c_name!=null)
            {
              int c_id = Integer.parseInt(session.getAttribute("comp_id").toString());
              String sql = "insert into category(c_id,c_name) values(?,?)";
              Connection con = GetConnection.getConnection(getServletContext());
              PreparedStatement ps = con.prepareStatement(sql);
              ps.setInt(1,c_id);
              ps.setString(2,c_name);
              if(ps.executeUpdate()!=0)
              {
              %>
                <script>
                    alert("Category Add");
                    window.location.href="company_homepage.jsp"
                </script>    
              <%
              }
            }
          %>
</body>
</html>