package ExpenseModel;

import ExpenseModel.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

public class EmployeeDao {
 
 public static boolean insertEmployee(EmployeeDto emp,ServletContext context)
 {
     Connection con = null;
     boolean status = false;
     try{
        con =  GetConnection.getConnection(context);
        String sql = "insert into employee(empname,empemail,empcontact,empuane,emppass) values(?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,emp.geteName());
        ps.setString(2,emp.geteContact());
        ps.setString(3,emp.geteEmail());
        if(ps.executeUpdate()!=0)
          status = true;
          
     }
     catch(Exception e)
     {
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
     return status;
 }
 
 public static ArrayList<EmployeeDto> setAllEmployee(ServletContext context)
 {
    Connection con = null;
     ArrayList<EmployeeDto>al = new ArrayList<>();
    try{
       con =  GetConnection.getConnection(context);
       String sql = "select empname,empcontact,empemail from employee";
       PreparedStatement ps = con.prepareStatement(sql);
       ResultSet rs = ps.executeQuery();
       while(rs.next())
       { 
           
         String eName = rs.getString(1);
         String eContact = rs.getString(2);
         String eEmail = rs.getString(3);
         EmployeeDto emp = new EmployeeDto(eName, eContact, eEmail);
         al.add(emp);
       }
    }
    catch(Exception e)
    {
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
    return al;
 }
 public static boolean deleteEmployee(int id,ServletContext context)
 {
   Connection con = null;
   boolean status = false;
   try{
       con = GetConnection.getConnection(context);
       String sql = "delete from employee where id =?";
       PreparedStatement ps = con.prepareStatement(sql);
       ps.setInt(1,id);
       if(ps.executeUpdate()!=0)
          status = true; 
   }
   catch(Exception e)
   {
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
   return status;
 }
 public static EmployeeDto selectRecordById(int id,ServletContext context)
 {
    Connection con = null;
    EmployeeDto emp = null;
    try{
        con = GetConnection.getConnection(context);
        String sql = "select id,empname,empcontact,empemail from employee where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {
          int eid=rs.getInt(1);
          String eName = rs.getString(2);
          String eContact = rs.getString(3);
          String eEmail = rs.getString(4);
          
           new EmployeeDto(eid,eName, eContact, eEmail);
        }
    }
    catch(Exception e)
    {
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
    return emp;
 }
 public static boolean updateRecordById(EmployeeDto emp,ServletContext context)
 {
     boolean status =false;
    Connection con = null;
    try{
        con = GetConnection.getConnection(context);
        String sql = "update employee set empname =?,empcontact = ?,empemail = ? where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,emp.geteName());
        ps.setString(2, emp.geteContact());
        ps.setString(3,emp.geteEmail());
        if(ps.executeUpdate()!=0)
            status =true;
    }
    catch(Exception e)
    {
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
    return status;
 }
 public ResultSet showAll(ServletContext context, int compId)
 {
   ResultSet rs=null;
   try {
   Connection con=ExpenseModel.GetConnection.getConnection(context);
   String s="select * from employee where c_id =?";
   PreparedStatement ps= con.prepareStatement(s);
   ps.setInt(1,compId);
   rs=ps.executeQuery();
  } catch (Exception e) {
  }
   return rs;
 }
  public int deleteCust(int id,ServletContext context)
 {
     int x=0;
     try {
       Connection con=ExpenseModel.GetConnection.getConnection(context);
         String s="delete from employee where id=?";
         PreparedStatement ps= con.prepareStatement(s);
         ps.setInt(1, id);
         x=ps.executeUpdate();
     } catch (Exception e) {
     }
     return x;
 }
  public ResultSet show(int id,ServletContext context)
 {
   ResultSet rs=null;
   try {
    Connection con=ExpenseModel.GetConnection.getConnection(context);
   String s="select * from employee where id=?";
   PreparedStatement ps= con.prepareStatement(s);
   ps.setInt(1, id);
   rs=ps.executeQuery();
  } catch (SQLException e) {
  }
   return rs;
 }
  public int updateCust(EmployeeDto ob,ServletContext context)
 {
  int x=0;
  try {
        Connection con=ExpenseModel.GetConnection.getConnection(context);
    String s="update employee set empname=?,empemail=?,empcontact=? "
            + "where id=?";
      ///System.out.println("hhhhhhhhhhhhhhhhhhhhhhh"+ob.geteContact());
    PreparedStatement ps= con.prepareStatement(s);
        ps.setInt(4, ob.getId());
        ps.setString(1,ob.geteName());
        ps.setString(2,ob.geteContact());
        ps.setString(3,ob.geteEmail());
   x=ps.executeUpdate();
  } catch (SQLException e) {
      System.out.println(e);
  }
  return x;
 }
}
