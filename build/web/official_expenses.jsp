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

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <h4><b>EXPENSE TRACKING</b></h4>
    </div>
    <div id="menu">

         <ul>
          <li> <a href="add_expense.jsp" >Add Expenses</a> </li>
          <li> <a href="#">View Expenses</a>
          <ul>
                 <li><a href="personal_expenses.jsp"> Personal Expenses</a></li>
                 <li><a href="official_expenses.jsp">Official Expenses</a></li>
                 
                 
        </ul></li>
          <li><a href="emp_logout.jsp">Logout</a> </li>
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
                background-color: Grey;
                background-image:url('expenseTemplate/css/images/bg/blue.jpg');       
            }
  </style>       
<body>

  <div style="margin-top:140px;">  
      <center>
  <table class="table table-striped" border="3" >
    <thead>
      <tr>
        <th>Category</th>
        <th>Tag</th>
        <th>Date</th>
        <th>Amount</th>
        <th>Payment By</th>
        <th>Bill Receipt</th>
        <th>Remove</th>
                </center>

      </tr>
    </thead>
    <tbody>
        <%
        
          Connection con = null;
         int emp_id = Integer.parseInt(session.getAttribute("emp_id").toString());
          int comp_id = Integer.parseInt(session.getAttribute("comp_id").toString());
          try{
              con = GetConnection.getConnection(getServletContext());
              String sql = "select category.c_name,expense.tag,expense.date, expense.amount,expense.payment_mode,expense.image_name ,expense.id from expense inner join category on expense.cat_id = category.id where expense.comp_id = ? and status=? and expense.emp_id = ?";
              PreparedStatement ps = con.prepareStatement(sql);
              ps.setInt(1,comp_id);
              ps.setString(2,"Official");
             ps.setInt(3,emp_id);
              ResultSet rs = ps.executeQuery();
              while(rs.next())
              {
              %>
                  <tr>
                     <td><%=rs.getString(1)%></td>
                     <td><%=rs.getString(2)%></td>
                     <td><%=rs.getString(3)%></td>
                     <td><%=rs.getString(4)%></td>
                     <td><%=rs.getString(5)%></td>
                     <td>
                         <a href="bill/<%=rs.getString(6)%>" download="">
                         <img src="bill/<%=rs.getString(6)%>" style="width:73px;">
                         </a>
                     </td>
                     
                     <td>
                         <a href="delete_expense.jsp?id=<%=rs.getString(7)%>" onclick="return confirm('Are you sure?')">
                             <button class="btn btn-danger">Delete</button>
                        </a>
                    </td>
                 </tr>          
              <%
              
              }
          }
          catch(Exception e)
          {
          
          }
          finally{
              try{
                 con.close();   
              }
              catch(Exception e)
              {
               
              }
          }
        %>
      
      
    </tbody>
  </table>

 </div>
</body> 
</html>
    