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
             <li> <a href="index.html">Home</a> </li>
          <li>  <a href="#about">About</a></li>
          <li>  <a href="#contact">Contact</a></li>
           <li><a href="#login">login</a>
             <ul>
                 <li><a href="admin_login.jsp"> Admin login</a></li>
                     <li><a href="company_login.jsp">Company login</a></li>
                    <li> <a href="emp_login.jsp">Employee login</a></li>
                 
        </ul>
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
            
        
            /* Bordered form */
form {
     
    margin-top: 150px;
   
}
/* Full-width inputs */
.txt {
   
   height:30px;
    width:200px;
}

/* Set a style for all buttons */
button {
    background-color: black;
    color: orangered;
    border: none;
    cursor: pointer;
    width:  200px;
    height: 40px;
}

</style>
</head>

         

        
            <br>
                <form action = "admin_login_task.jsp" method = "post">
                    <table align="center" style=" 
    width: 500px;
    border: 2px solid black;
    border-radius: 10px;
    background-color: goldenrod;
" cellspacing="20px">
                                <tr>
                                    <th colspan="2"><h1>Admin Login</h1></th>
                                </tr>
                                
                                <tr align="center">
                                    <td>
                                        <label for="txtuname">Username</label>
                                    </td>
                                    <td>
                                        <input type="text" name="txtuname" class="txt"/>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td>
                                        <label for="txtpass">Password</label>
                                    </td>
                                    <td>
                                        <input type="password" name="txtpass" class="txt"/>
                                    </td>
                                </tr>
                                <tr>
                                     <td colspan="2">
                                <center><button type="submit">Login</button></center>
                                    </td>
                                </tr>
            </table>                
         </form>
       </center>
    </body>
</html>