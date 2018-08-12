<%@page import="ExpenseModel.SendMailSSL"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracking","root","root");
        int c_id = Integer.parseInt(session.getAttribute("comp_id").toString());
        String name = request.getParameter("txtname");
        String email = request.getParameter("txtemail");
        String contact = request.getParameter("txtcontact");
        String empId = request.getParameter("txtempid");
        String empuname = request.getParameter("txtuname");
        String emppass = request.getParameter("txtpass");
        String sql = "insert into employee(empname,empemail,empcontact,c_id,emp_id,empuname,emppass) values(?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        //Random random= new Random();
        //String pass = Integer.toString(random.nextInt(9000000));
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, contact);
        ps.setInt(4, c_id);
        ps.setString(5,empId);
        ps.setString(6,empuname);
        ps.setString(7,emppass);
       
        if(ps.executeUpdate()!=0)
        {
            %>
            <script>
                alert("Employee Registration Successfull");
                window.location.href="emp_login.jsp"
            </script>
            <%
            }
        else
        {
            %>
            <script>
                alert("Employee Registration Failed");
                window.location.href="emp_registration.jsp";
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