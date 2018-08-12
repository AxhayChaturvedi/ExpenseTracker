<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ExpenseModel.GetConnection"%>
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
      <h1>expense tracking</h1>
    </div>
    <div id="menu">

         <ul>
         <!-- <li> <a href="emp_registration.jsp" >Register Employee</a> </li>-->
          <li> <a href="view_employee.jsp">View Employee</a></li>
          <li> <a href="add_category.jsp">Add Category</a></li>
          <li> <a href="#">View Expenses </a>
               <ul>
                <!-- <li><a href="emp_pichartreport.jsp">Employee </a>-->
                     <a href="pichartreport.jsp">Category</a>
                 </li>
        </ul>

          </li>
          <li><a href="company_logout.jsp">Logout</a> </li>
         
      </ul>
         </li>
      </ul>
        
    </div>
  </nav>
</header>

        <form action="emp_registration_task.jsp" method="post" >
            <style>
             body
            {
                
                background-repeat: no-repeat;
                background-position: center;
                background-size:  auto;
                background-color: black;
                background-image:url('expenseTemplate/css/images/bg/blue.jpg');       
            }
            
        
        </style>
            <center>
                <br><br><br><br><br><br><br>
                <table style="background-color: royalblue" cellspacing="5" cellpadding="10" >
                    <tr>
                        <td colspan="2"><h1>Employee Registration</h1></td>
                    </tr>
                    <tr>
                        <td>
                            <label>Employee Id</label>
                        </td>
                        
                        <td>
                                <input type="text" name="txtempid">
                        <td>
                    </tr>
                    <tr>
                        <td>
                            <label>Name</label>
                        </td>
                        
                        <td>
                                <input type="text" name="txtname">
                        <td>
                    </tr>
                    <tr>
                        <td>
                            <label>Email Address</label>
                        </td>
                        
                        <td>
                                <input type="email" name="txtemail">
                        <td>
                    </tr>
                    <tr>
                        <td>
                            <label>Contact no.</label>
                        </td>
                        <td>
                                <input type="text" name="txtcontact">
                        <td>
                    </tr>
                     <tr>
                        <td>
                            <label>Enter Username</label>
                        </td>
                        <td>
                                <input type="text" name="txtuname">
                        <td>
                    </tr>
                     <tr>
                        <td>
                            <label>Enter Password</label>
                        </td>
                        <td>
                                <input type="password" name="txtpass">
                        <td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center><button type="submit">Register</button></center>
                        </td>
                        
                    <tr>

               </table>
                
        </form>
              
    
    </body>
</html>
