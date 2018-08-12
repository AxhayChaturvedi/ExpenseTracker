
   
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
        
      </ul>
    </div>
  </nav>
</header>

    <br><br><br><br><br><br>
    <center>        <%
         int id=Integer.parseInt(request.getParameter("id"));
         EmployeeDao cm=new EmployeeDao();
         ResultSet rs= cm.show(id,getServletContext());
         if(rs.next())
         {
         %>
       <form action="employee_update.jsp">
           <table style="background-color: orange" cellspacing="5" cellpadding="10">
               <tr>
               <th colspan="2">Edit Employee Details</th>
               <th><input type="hidden" value="<%=rs.getInt(1)%>" name="primaryid"/></th>
               </tr>
               <tr>
                    <td>Employee ID</td>
                    <td>
                        <input type="text" value="<%=rs.getString(8)%>" name="eid"/>
                    </td>
                </tr>  
                <tr>
                    <td>Employee Name</td>
                    <td>
                        <input value="<%=rs.getString(2)%>" type="text" name="ename"/>
                    </td>
                </tr>
                <tr>
                    <td>Employee Contact</td>
                    <td>
                        <input type="text" value="<%=rs.getString(4)%>" name="econtact"/>
                    </td>
                </tr>
                <tr>
                    <td>Employee Email</td>
                    <td>
                        <input type="text" value="<%=rs.getString(3)%>" name="email"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Update"/>
                    </td>
                </tr>
            </table>
       </form>
    </center>
        
       <% } %>
    </body>
</html>
