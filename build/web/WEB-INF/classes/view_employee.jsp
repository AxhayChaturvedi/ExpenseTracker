<%-- 
    Document   : showall
    Created on : Apr 24, 2017, 4:31:55 PM
    Author     : ADMIN
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ExpenseModel.EmployeeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/flexslider.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/sequence.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/style.css" media="all">
<!--Special Styles-->
<link rel="stylesheet" type="text/css" href="css/style1.css" title="default" media="screen">
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
          <li> <a href="#">View Expenses </a>
               <ul>
                 <li><a href="#"> Grid View</a>
                     <a href="#">Chart</a>
                 </li>
        </ul>

          </li>
          <li><a href="company_logout.jsp">Logout</a> </li>
         </li>
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
                background-image:url('expenseTemplate/css/images/bg/orange.jpg');       
            }
  </style>       
<body>
    <br><br><br><br><br><br>
    <center>
        <table style="background-color: orange" cellspacing="5" cellpadding="10">
            <tr>
                <th>Employee ID</th>
                <th>Employee Name</th>
                <th>Employee Contact</th>
                <th>Employee Email</th>
                <th>Action</th>
            </tr>
            <%
             EmployeeDao cm=new EmployeeDao();
             ResultSet rs= cm.showAll(application);
             while(rs.next())
             {
             %>
             <tr>
                 <td><%=rs.getInt(1)%></td>
                 <td><%=rs.getString(2)%></td>
                 <td><%=rs.getString(3)%></td>
                 <td><%=rs.getString(4)%></td>
                 <td>
                     <a href="Employee_edit.jsp?id=<%=rs.getInt(1)%>">
                         <img src="edit.png" width="20" height="20"/>
                     </a>
                     <a onclick="return confirm('Do you want to delete..???')" href="Employee_delete.jsp?id=<%=rs.getInt(1)%>">
                         <img src="delete.png" width="20" height="20"/>
                     </a>
                 </td>
             </tr>
             <% } %>
    </center>
        </table>
    </body>
</html>