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
       String sql = "select * from employee where empemail = ? and emppass = ?";
       PreparedStatement ps = con.prepareStatement(sql);
       ps.setString(1,username);
       ps.setString(2, pass);
       
       ResultSet rs = ps.executeQuery();
       if(rs.next())
       {
         session.setAttribute("emp_id", rs.getString(1));
         session.setAttribute("current_user",username);
         session.setAttribute("comp_id", rs.getString("c_id"));
         response.sendRedirect("emp_homepage.jsp");
       }
       else
       {
         response.sendRedirect("emp_login.jsp");
       }
   }
   catch(Exception e)
   {
     response.sendRedirect("emp_login.jsp");  
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