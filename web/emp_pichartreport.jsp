<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ExpenseModel.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Font"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.chart.plot.PiePlot"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
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
  </style><br><br><br><br><br><br><br><br><br><br>
  <a href="emp_SearhReport.jsp">Back to search</a>
  <center>

      <%
DefaultPieDataset pieDataset = new DefaultPieDataset();     
String sql = "select expense.amount as Total,(select category.c_name from category where id=?) from expense inner join category on expense.comp_id = category.c_id where expense.comp_id = ?  and expense.emp_id=? and  expense.cat_id=? and status like 'Official' group by expense.comp_id";    
int comp_id = (Integer)session.getAttribute("comp_id");
int eid=Integer.parseInt(request.getParameter("eid"));
String catName=request.getParameter("cat");
System.out.println("**** "+catName+"*********");
//int emp_id = (Integer)session.getAttribute("emp_id");
//out.print(comp_id);
Connection con = null;
try{
    con = GetConnection.getConnection(getServletContext());
    PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1,catName);
    ps.setInt(2,comp_id);
    ps.setInt(3, eid);
    ps.setString(4,catName);
    ResultSet rs = ps.executeQuery();
    
    
    if(rs.next())
    {
        
       pieDataset.setValue(rs.getString(2), new Integer(rs.getInt(1))); 
    }
    else
    {
    
        out.print("<script>alert('No record found'); window.location='emp_SearhReport.jsp';</script>");
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
      e.printStackTrace();
    }
}


JFreeChart chart = ChartFactory.createPieChart( 
    "Sample Pie-Chart created using JFreeChart!", pieDataset, true, 
    true, true);

chart.setTitle(""); 
chart.setAntiAlias(true); 
//chart.setTextAntiAlias(false);

PiePlot plot = (PiePlot) chart.getPlot(); 
plot.setLabelFont(new Font("Tahoma", Font.PLAIN, 11)); 
try 
{ 
    // Converting the PieChart into a PNG image 
    File image = new File(getServletContext().getRealPath("/")+"images/MyChart.png"); 
    ChartUtilities.saveChartAsPNG(image, chart, 800,400); 
   
} 
catch (java.io.IOException exc) 
{ 
    System.err.println("Error writing image to file"); 
}
String image = getServletContext().getRealPath("/")+"MyChart.png";
//out.print(image);
%>
<img src="images/MyChart.png"/>