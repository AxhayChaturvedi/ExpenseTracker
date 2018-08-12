
package ExpenseModel;

import Expensemodel.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author manikka
 */
public class AdminDao {
    public boolean insert (AdminDto a) throws Exception
    {
        Connection con;
        con = GetConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("insert into admin value(?,?,?,?,?)");
        ps.setString(1,a.getA_id());
        ps.setString(2,a.getA_name());
        ps.setString(3,a.getEmail_id());
        ps.setString(4,a.getPassword());
        ps.setString(5,a.getContact_no());
        
        return ps.executeUpdate()>0;
    }
public ResultSet showAll()
    {
        ResultSet rs=null;
        try {
            Connection con=GetConnection.getConnection ();
            String s="select * from admin";
            PreparedStatement ps= con.prepareStatement(s);
            rs=ps.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
   
    
}









  

   