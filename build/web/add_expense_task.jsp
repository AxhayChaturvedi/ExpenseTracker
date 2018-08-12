
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracking","root","root");
        String status = request.getParameter("status");
        String tag = request.getParameter("tag");
        String date = request.getParameter("date");
        String amount = request.getParameter("amount");
        String payment = request.getParameter("payment");
        String sql = "insert into company(c_name,c_type,c_address,c_contact,c_email) values(?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, type);
        ps.setString(3, address);
        ps.setString(4, contact);
        ps.setString(5, email);
        if(ps.executeUpdate()!=0)
        {
            %>
            <script>
                alert("Company Registration Successfull");
                window.location.href="company_login.jsp";
            </script>
            <%
            }
        else
        {
            %>
            <script>
                alert("Company Registration Failed");
                window.location.href="company_registration.jsp"
            </script>
            <%
        }
            
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    finally
     {
        try
        {
            con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    
}
%>
