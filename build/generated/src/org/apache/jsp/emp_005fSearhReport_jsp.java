package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import ExpenseModel.GetConnection;
import java.sql.Connection;

public final class emp_005fSearhReport_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/flexslider.css\" media=\"screen\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/sequence.css\" media=\"screen\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/lightbox.css\" media=\"screen\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style4.css\" media=\"all\">\n");
      out.write("<!--Special Styles-->\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style3.css\" title=\"default\" media=\"screen\">\n");
      out.write("<link rel=\"alternate stylesheet\" type=\"text/css\" href=\"css/elegant.css\" title=\"elegant\" media=\"screen\">\n");
      out.write("<link rel=\"alternate stylesheet\" type=\"text/css\" href=\"css/modern.css\" title=\"modern\" media=\"screen\">\n");
      out.write("<link rel=\"alternate stylesheet\" type=\"text/css\" href=\"css/colorfull.css\" title=\"colorfull\" media=\"screen\">\n");
      out.write("<!--Responsive-->\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/responsitive.css\" media=\"all\">\n");
      out.write("<!--Google fonts-->\n");
      out.write("<link href='http://fonts.googleapis.com/css?family=Russo+One&subset=latin,latin-ext,cyrillic' rel='stylesheet' type='text/css'>\n");
      out.write("<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300&subset=latin,cyrillic' rel='stylesheet' type='text/css'>\n");
      out.write("<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>\n");
      out.write("<!--Javascript-->\n");
      out.write("<script src=\"js/jquery-1.7.2.min.js\"></script>\n");
      out.write("<!--[if lt IE9]>\n");
      out.write("<script src=\"js/html5.js\"></script>\n");
      out.write("<script src=\"js/IE7.js\"></script>\n");
      out.write("<![endif]-->\n");
      out.write("<style> \n");
      out.write("li.dropdown{display: inline-block;}\n");
      out.write(".dropdown-content a:hover\n");
      out.write("{background-color :#f1f1f1}\n");
      out.write(".dropdown:hover .dropdown-content\n");
      out.write("{display:block;}\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<header class=\"dark\">\n");
      out.write("  <nav>\n");
      out.write("    <div id=\"logo\">\n");
      out.write("        <h2><b>EXPENSE TRACKING</b></h2>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"menu\">\n");
      out.write("\n");
      out.write("         <ul>\n");
      out.write("          <li> <a href=\"emp_registration.jsp\" >Register Employee</a> </li>\n");
      out.write("          <li> <a href=\"view_employee.jsp\">View Employee</a></li>\n");
      out.write("          <li> <a href=\"add_category.jsp\">Add Category</a></li>\n");
      out.write("          <li> <a href=\"#\">View Expenses </a>\n");
      out.write("               <ul>\n");
      out.write("                <li>\n");
      out.write("                     <a href=\"pichartreport.jsp\">Expense Report</a>\n");
      out.write("                     <a href=\"emp_SearhReport.jsp\">Employee Expense Report</a>\n");
      out.write("                     \n");
      out.write("                 </li>\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("          </li>\n");
      out.write("          <li><a href=\"company_logout.jsp\">Logout</a> </li>\n");
      out.write("         \n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("  </nav>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<style>  \n");
      out.write("            \n");
      out.write("            body\n");
      out.write("            {\n");
      out.write("                \n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                background-position: center;\n");
      out.write("                background-size:  auto;\n");
      out.write("                background-color: black;\n");
      out.write("                 \n");
      out.write("            }\n");
      out.write("  </style>\n");
      out.write("      <center>\n");
      out.write("            <br><br><br><br><br>\n");
      out.write("                <form action = \"company_login_task.jsp\" method = \"post\">\n");
      out.write("            <table style=\" background-color: goldenrod;  \" cellspacing=\"5\" cellpadding=\"10\" >\n");
      out.write("                                <tr>\n");
      out.write("                                    <td colspan=\"2\"><h1>Search Employee Details </h1></td>\n");
      out.write("                                </tr>\n");
      out.write("                                \n");
      out.write("                                <tr>\n");
      out.write("                                    <td>\n");
      out.write("                                        <label>Enter Employee id</label>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <input type=\"text\" placeholder=\"Enter  employee id\" name=\"eid\"/>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>\n");
      out.write("                                        <label>Select Category</label>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        \n");
      out.write("                                        <select>\n");
      out.write("                                            <option value=\"\" readonly>Select Category</option>\n");
      out.write("  ");

   Connection con = null;
   try{
       ServletContext context = getServletContext();
       con = GetConnection.getConnection(context);
       String username = request.getParameter("txtuname");
       String pass = request.getParameter("txtpass");
       String sql = "select * from category";
       PreparedStatement ps = con.prepareStatement(sql);
       ps.setString(1,username);
       ps.setString(2, pass);
       ResultSet rs = ps.executeQuery();
       if(rs.next())
       {

                                            
    
      out.write("\n");
      out.write("    <option value=\"");
      out.print( rs.getInt("id"));
      out.write('"');
      out.write('>');
      out.print( rs.getString("c_name"));
      out.write("</option>\n");
      out.write("    ");

    
        }}
   catch(Exception e)
   {
     response.sendRedirect("company_login.jsp");  
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
    
      out.write("\n");
      out.write("         </select>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                     <td colspan=\"2\">\n");
      out.write("                                <center><button type=\"submit\">Login</button></center>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("            </table>                \n");
      out.write("         </form>\n");
      out.write("       </center>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
