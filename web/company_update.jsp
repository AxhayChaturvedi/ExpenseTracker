
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ExpenseModel.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%
  Connection con = null;
  try{
      con = GetConnection.getConnection(getServletContext());
      int id=Integer.parseInt(request.getParameter("cid"));
            String cname=request.getParameter("cname");
            String ctype=request.getParameter("ctype");
            String caddress=request.getParameter("caddress");
            String ccontact=request.getParameter("ccontact");
            String email=request.getParameter("email");
      String sql = "update company set c_name=?,c_type=?,c_address=?,c_contact=?,c_email where c_id =?";
      PreparedStatement ps = con.prepareStatement(sql);
      
      ps.setString(1,cname);
      ps.setString(2,ctype);
      ps.setString(3, caddress);
      ps.setString(4, ccontact);
      ps.setString(5, email);
      ps.setInt(6, id);
      if(ps.executeUpdate()!=0)
      {
      %>
         <script>
             alert("Record Updated..");
             window.location.href="view_company.jsp"
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