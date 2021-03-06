<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracking","root","root");
        String name = request.getParameter("txtname");
        String type = request.getParameter("txttype");
        String address = request.getParameter("txtaddress");
        String contact = request.getParameter("txtcontact");
        String email = request.getParameter("txtemail");
        String uname = request.getParameter("txtuname");
        String pass = request.getParameter("txtpass");
        String sql = "insert into company(c_name,c_type,c_address,c_contact,c_email,c_uname,c_pass) values(?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, type);
        ps.setString(3, address);
        ps.setString(4, contact);
        ps.setString(5, email);
        ps.setString(6, uname);
        ps.setString(7, pass);
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
                window.location.href="company_registration.jsp";
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
