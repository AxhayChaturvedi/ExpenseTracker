package com.expensetracking.dao;

import ExpenseModel.Category;
import ExpenseModel.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletContext;

public class CategoryDAO {
   
   public static ArrayList<Category> selectAllCategory(ServletContext context,int cId)
   {
       Connection con = null;
       ArrayList<Category> al = new ArrayList<>();
       try{
           con = GetConnection.getConnection(context);
           
           String sql = "select * from category where c_id= ?";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setInt(1, cId);
           ResultSet rs = ps.executeQuery();
           while(rs.next())
           {
              int id = rs.getInt(2);
              String cName = rs.getString(3);
               Category c = new Category(id, cName);
               al.add(c);
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
           
}
