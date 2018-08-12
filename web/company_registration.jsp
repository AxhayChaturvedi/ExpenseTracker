
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
      <h1>expense tracking</h1>
    </div>
    <div id="menu">

         <ul>
             <li> <a href="admin_homepage.jsp">Home</a> </li>
         <!-- <li>  <a href="company_registration.jsp">Registered Company</a></li>-->
          <li>  <a href="view_company.jsp">View Company</a></li>
           <li><a href="AdminLogout.jsp">logout</a>
             
         </li>
      </ul>
        
    </div>
  </nav>
</header>

    <body>
        <style>
              
            
           
            body
            {
                
                background-repeat: no-repeat;
                background-position: center;
                background-size:  auto;
                background-color: black;
                background-image:url('expenseTemplate/css/images/bg/orange.jpg');       
            }
            
        
            /* Bordered form */
form {
    padding: center;
    
    
  
    
}

/* Full-width inputs */
input[type=text], input[type=password] {
    width: 80%;
    padding: 14px 20px;
    margin: 8px 0;
    display: inline-block;
  
}

/* Set a style for all buttons */
button {
    background-color: black;
    color: orangered;
    padding:100;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width:  30%;
    height: 40px;
}




            
        </style>
        
        <form action="company_registration_task.jsp" method="post">
          
            <center>
                <br><br><br><br><br><br><br>
               
                <table style="background-color: goldenrod" cellspacing="5" cellpadding="10" >
                    <tr>
                        <td colspan="2"><h1>Company Registration</h1></td>
                    </tr>
                    <tr>
                        <td>
                            <label>Company Name</label>
                        </td>
                        
                        <td>
                                <input type="text" name="txtname">
                        <td>
                    </tr>
                     <tr>
                        <td>
                            <label>Company Type</label>
                        </td>
                        
                        <td>
                                <input type="text" name="txttype">
                        <td>
                    </tr>
                     <tr>
                        <td>
                            <label>Company Address</label>
                        </td>
                        
                        <td>
                                <input type="textarea" name="txtaddress">
                        <td>
                    </tr>
                    <tr>
                        <td>
                            <label>Contact No:</label>
                        </td>
                        
                        <td>
                                <input type="text" name="txtcontact">
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
                            <label>Enter Username</label>
                        </td>
                        
                        <td>
                                <input type="textarea" name="txtuname">
                        <td>
                    </tr>
                     <tr>
                        <td>
                            <label>Enter your Password</label>
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

                
                
                
                
           
              
        
