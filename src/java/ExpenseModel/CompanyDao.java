package ExpenseModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

public class CompanyDao {
   
 /*public static boolean insertCompany(CompanyDto emp,ServletContext context)
 {
     Connection con = null;
     boolean status = false;
     try{
        con =  GetConnection.getConnection(context);
        String sql = "insert into copany() values(?,?,?,?,?)";
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
 */
 public static ArrayList<CompanyDto> setAllCompany(ServletContext context)
 {
    Connection con = null;
     ArrayList<CompanyDto>al = new ArrayList<>();
    try{
       con =  GetConnection.getConnection(context);
       String sql = "select c_id,c_name,c_type,c_address,c_contact,c_email from company";
       PreparedStatement ps = con.prepareStatement(sql);
       ResultSet rs = ps.executeQuery();
       while(rs.next())
       { 
           
         int c_id = rs.getInt(1);
         String c_name = rs.getString(2);
         String c_type = rs.getString(3);
         String c_address = rs.getString(4);
         String c_contact = rs.getString(5);
         String c_email = rs.getString(6);
         CompanyDto comp = new CompanyDto(c_id,c_name,c_type,c_address,c_contact,c_email);
         al.add(comp);
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
 public static boolean deleteCompany(int id,ServletContext context)
 {
   Connection con = null;
   boolean status = false;
   try{
       con = GetConnection.getConnection(context);
       String sql = "delete from company where c_id =?";
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
        String sql = "select c_id,c_name,c_type,c_address,c_contact,c_email from company";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {
         int c_id = rs.getInt(1);
         String c_name = rs.getString(2);
         String c_type = rs.getString(3);
         String c_address = rs.getString(4);
         String c_contact = rs.getString(5);
         String c_email = rs.getString(6);
     
         CompanyDto comp = new CompanyDto(c_id,c_name,c_type,c_address,c_contact,c_email);
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
 public static boolean updateRecordById(CompanyDto comp,ServletContext context)
 {
    boolean status =false;
    Connection con = null;
    try{
        con = GetConnection.getConnection(context);
        String sql = "update company set c_name=?,c_type=?,c_address=?,c_contact=?,c_email=? where c_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,comp.getId());
        ps.setString(2, comp.getcName());
        ps.setString(3,comp.getcType());
        ps.setString(4,comp.getcAddress());
        ps.setString(5,comp.getcContact());
        ps.setString(6,comp.getcEmail());
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
 public ResultSet showAll(ServletContext context)
 {
   ResultSet rs=null;
   try {
   Connection con=ExpenseModel.GetConnection.getConnection(context);
   String s="select * from company";
   PreparedStatement ps= con.prepareStatement(s);
   rs=ps.executeQuery();
  } catch (Exception e) {
  }
   return rs;
 }
  public int deleteComp(int id,ServletContext context)
 {
     int x=0;
     try {
       Connection con=ExpenseModel.GetConnection.getConnection(context);
         String s="delete from company where c_id=?";
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
   String s="select * from company where c_id=?";
   PreparedStatement ps= con.prepareStatement(s);
   ps.setInt(1, id);
   rs=ps.executeQuery();
  } catch (SQLException e) {
  }
   return rs;
 }
  public int updateCust(CompanyDto ob,ServletContext context)
 {
  int x=0;
  try {
        Connection con=ExpenseModel.GetConnection.getConnection(context);
    String s="update company set c_name=?,c_type=?,c_address=?,c_contact=?,c_email=?"
            + "where c_id=?";
    PreparedStatement ps= con.prepareStatement(s);
       ps.setInt(1,ob.getId());
        ps.setString(2, ob.getcName());
        ps.setString(3,ob.getcType());
        ps.setString(4,ob.getcAddress());
        ps.setString(5,ob.getcContact());
        ps.setString(6,ob.getcEmail());
        x=ps.executeUpdate();
  } catch (SQLException e) {
  }
  return x;
 }

}
