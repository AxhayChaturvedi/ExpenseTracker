

<%@page import="java.util.Iterator"%>
<%@page import="ExpenseModel.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.expensetracking.dao.CategoryDAO"%>
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
         <!-- <li> <a href="add_expense.jsp" >Add Expenses</a> </li>-->
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

<form action="./UploadServlet" method="post" enctype="multipart/form-data">
            
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
             <br><br><br>
             <br><br><br><br>
             
            <table style="background-color: royalblue" cellspacing="5" cellpadding="10">
                <tr>
                        <td colspan="2"><h1>Add Expense</h1></td>
                    </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        Official:<input type="radio" name="status" checked="" value="Official">
                        Personal:<input type="radio" name="status" value="Personal">
                    </td>
                  </tr>
                  <tr>
                      
                          <td>Category</td>
                            <td><select name ="category">
                                    <option>Select Category</option>
                                    <%
                                       int cId = Integer.parseInt(session.getAttribute("comp_id").toString());
                                      ArrayList<Category> al=  CategoryDAO.selectAllCategory(getServletContext(), cId);
                                      Iterator<Category>itr = al.iterator();
                                      while(itr.hasNext())
                                      {
                                          Category c =itr.next();
                                      
                                    %>
                                    
                                    <option value="<%=c.getId()%>"><%=c.getcName()%></option>
 
                                    <%
                                     }
                                    %>
                        </select>
                  </tr>
                  <tr>
                      <td>Tag</td>
               <td><input type="text" name="tag">    </td>
                  </tr>
              
                <tr>
                    <td>Date</td>
                    <td><input type="date" name="txtdate"></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text"  name="amt"></td>
                </tr>
                <tr>
                    <td>Payment Mode</td>
                        <td><select name="payment_mode">
                                    <option value="Cash" selected="">Cash</option>
                                    <option value="Credit">Credit</option>
                                    <option value="Debit">Debit</option>
                                    <option value="Net Banking">Net Banking</option>

                    </td>
                </tr>
                
                       
                <tr>
                    <td>Attach Receipt</td>
                    <td><input type='file' name="pic"></td>
                </tr>
                <tr>
                    
                    <th colspan="2">
                        
                       <input type="submit" value="Submit">
                       <input type="reset">
                    </th>
                    
                </tr>
            </table> 
           </center>
            
        </form>
    </body>
</html>
