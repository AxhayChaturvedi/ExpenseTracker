package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import ExpenseModel.GetConnection;
import java.sql.Connection;
import org.jfree.chart.ChartUtilities;
import java.io.File;
import java.awt.Font;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

public final class pichartreport_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

DefaultPieDataset pieDataset = new DefaultPieDataset();   
String sql = "select sum(expense.amount) as Total,category.c_name from expense inner join category on expense.cat_id = category.id where comp_id = ? emp_id = ?and status = 'Official' group by expense.cat_id";    
int comp_id = Integer.parseInt(session.getAttribute("comp_id").toString());
//String sql = "select sum(expense.amount) as Total,category.c_name from expense inner join category on expense.cat_id = category.id where comp_id = ? and status = 'Official' group by expense.cat_id";    
//int comp_id = Integer.parseInt(session.getAttribute("comp_id").toString());

Connection con = null;
try{
    con = GetConnection.getConnection(getServletContext());
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1,comp_id);
    ResultSet rs = ps.executeQuery();
    
    
    while(rs.next())
    {
       pieDataset.setValue(rs.getString(2), new Integer(rs.getInt(1))); 
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
    ChartUtilities.saveChartAsPNG(image, chart, 1400, 600); 
   
} 
catch (java.io.IOException exc) 
{ 
    System.err.println("Error writing image to file"); 
}
//String image = getServletContext().getRealPath("/")+"MyChart.png";
//out.print(image);

      out.write("\n");
      out.write("<img src=\"images/MyChart.png\"/>");
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
