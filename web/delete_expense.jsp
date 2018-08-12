 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ExpenseModel.GetConnection "%>
<%@page import="java.sql.Connection"%>
<%
   Connection con = null;
   boolean status = false;
   try{
        con = GetConnection.getConnection(getServletContext());
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "delete from expense where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,id);
       if(ps.executeUpdate()!=0)
          response.sendRedirect("official_expenses.jsp");
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