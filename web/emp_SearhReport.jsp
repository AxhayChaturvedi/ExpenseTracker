
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ExpenseModel.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/flexslider.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/sequence.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/style4.css" media="all">
<!--Special Styles-->
<link rel="stylesheet" type="text/css" href="css/style3.css" title="default" media="screen">
<link rel="alternate stylesheet" type="text/css" href="css/elegant.css" title="elegant" media="screen">
<link rel="alternate stylesheet" type="text/css" href="css/modern.css" title="modern" media="screen">
<link rel="alternate stylesheet" type="text/css" href="css/colorfull.css" title="colorfull" media="screen">
<!--Responsive-->
<link rel="stylesheet" type="text/css" href="css/responsitive.css" media="all">
<!--Google fonts-->
<link href='http://fonts.googleapis.com/css?family=Russo+One&subset=latin,latin-ext,cyrillic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
<!--Javascript-->
<script src="js/jquery-1.7.2.min.js"></script>
<!--[if lt IE9]>
<script src="js/html5.js"></script>
<script src="js/IE7.js"></script>
<![endif]-->
<style> 
li.dropdown{display: inline-block;}
.dropdown-content a:hover
{background-color :#f1f1f1}
.dropdown:hover .dropdown-content
{display:block;}
</style>
</head>

<header class="dark">
  <nav>
    <div id="logo">
        <h2><b>EXPENSE TRACKING</b></h2>
    </div>
    <div id="menu">

         <ul>
          <li> <a href="emp_registration.jsp" >Register Employee</a> </li>
          <li> <a href="view_employee.jsp">View Employee</a></li>
          <li> <a href="add_category.jsp">Add Category</a></li>
          <li> <a href="#">View Expenses </a>
               <ul>
                <li>
                     <a href="pichartreport.jsp">Expense Report</a>
                     <a href="emp_SearhReport.jsp">Employee Expense Report</a>
                     
                 </li>
        </ul>

          </li>
          <li><a href="company_logout.jsp">Logout</a> </li>
         
      </ul>
    </div>
  </nav>
</header>

<style>  
            
            body
            {
                
                background-repeat: no-repeat;
                background-position: center;
                background-size:  auto;
                background-color: black;
                 
            }
  </style>
      <center>
            <br><br><br><br><br>
            <form action = "emp_pichartreport.jsp" method = "post">
            <table style=" background-color: goldenrod;  " cellspacing="5" cellpadding="10" >
                                <tr>
                                    <td colspan="2"><h1>Search Employee Details </h1></td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <label>Enter Employee id</label>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="Enter  employee id" name="eid"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Select Category</label>
                                    </td>
                                    <td>
                                        
                                        <select name="cat">
                                            <option value="" readonly>Select Category</option>
  <%
   Connection con = null;
   try{
       ServletContext context = getServletContext();
       con = GetConnection.getConnection(context);
       int c_id=(Integer)session.getAttribute("comp_id");
       String sql = "select * from category where c_id= "+c_id;
       PreparedStatement ps = con.prepareStatement(sql);
       ResultSet rs = ps.executeQuery();
       while(rs.next())
       {
   %>
    <option value="<%= rs.getInt("id")%>"><%= rs.getString("c_name")%></option>
    <%
    
        }}
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
         </select>


                                    </td>
                                </tr>
                                <tr>
                                     <td colspan="2">
                                <center><button type="submit">Search Expense</button></center>
                                    </td>
                                </tr>
            </table>                
         </form>
       </center>
</html>