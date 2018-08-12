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
<%
DefaultPieDataset pieDataset = new DefaultPieDataset();     
String sql = "select sum(expense.amount) as Total,category.c_name from expense inner join category on expense.cat_id = category.id where emp_id = ? and status = 'Official' group by expense.cat_id";    
int emp_id = Integer.parseInt(session.getAttribute("emp_id").toString());
Connection con = null;
try{
    con = GetConnection.getConnection(getServletContext());
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, emp_id);
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
    File image = new File(getServletContext().getRealPath("/")+"img/aboutus.png"); 
    ChartUtilities.saveChartAsPNG(image, chart, 700, 200); 
   
} 
catch (java.io.IOException exc) 
{ 
    System.err.println("Error writing image to file"); 
}
//String image = getServletContext().getRealPath("/")+"aboutus.png";
//out.print(image);
%>
<img src="img/aboutus.png"/>