<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ExpenseModel.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%
   Connection con = null;
   try{
       ServletContext context = getServletContext();
       con = GetConnection.getConnection(context);
       String username = request.getParameter("txtuname");
       String pass = request.getParameter("txtpass");
       String sql = "select * from admin where username = ? and password = ?  ";
       PreparedStatement ps = con.prepareStatement(sql);
       ps.setString(1,username);
       ps.setString(2, pass);
      
       ResultSet rs = ps.executeQuery();
       if(rs.next())
       {
         session.setAttribute("current_user_email",username);
         session.setAttribute("current_user_name", rs.getString(2));
         response.sendRedirect("admin_homepage.jsp");
       }
       else
       {
         response.sendRedirect("admin_login.jsp");
       }
   }
   catch(Exception e)
   {
     response.sendRedirect("admin_login.jsp");  
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