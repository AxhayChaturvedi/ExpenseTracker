
package ExpenseModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletContext;

public class GetConnection {
 private static Connection con = null;
 public static Connection getConnection(ServletContext context)
 {
   try{
      String driver =  context.getInitParameter("driver");
      String db_url = context.getInitParameter("db_url");
      String username = context.getInitParameter("username");
      String pass = context.getInitParameter("pass");
      Class.forName(driver);
      con = DriverManager.getConnection(db_url,username,pass);
   } 
   
   catch(ClassNotFoundException | SQLException e)
   {
     e.printStackTrace();
   }
   return con;
 }

    static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
