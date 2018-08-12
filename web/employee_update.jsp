<%@page import="java.sql.PreparedStatement"%>
<%@page import="ExpenseModel.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%
  Connection con = null;
  try{
      con = GetConnection.getConnection(getServletContext());
      int primaryId = Integer.parseInt(request.getParameter("primaryid"));
      String emp_id = request.getParameter("eid");
      String name = request.getParameter("ename");
      String contact = request.getParameter("econtact");
      String email = request.getParameter("email");
      String sql = "update employee set empname=?,empemail=?,empcontact=?,emp_id=? where id =?";
      PreparedStatement ps = con.prepareStatement(sql);
      
      ps.setString(1,name);
      ps.setString(2,email);
      ps.setString(3, contact);
      ps.setString(4, emp_id);
      ps.setInt(5, primaryId);
      if(ps.executeUpdate()!=0)
      {
      %>
         <script>
             alert("Record Updated..");
             window.location.href="view_employee.jsp"
         </script>    
      <%
      }
  
  }
  catch(Exception e)
  {
    e.printStackTrace();
  }
  finally{
      try{
          con.close();
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
  }
%>