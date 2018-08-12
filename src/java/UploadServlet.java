

import ExpenseModel.GetConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet(urlPatterns = {"/UploadServlet"})

public class UploadServlet extends HttpServlet {


 private boolean isMultipart;
 private String filePath;
 private int maxFileSize = 5000 * 1024;
 private int maxMemSize = 4 * 1024;
 private File file;

 public void init() {
  // Get the file location where it would be stored.
  filePath=//"D://image//";
        getServletContext().getRealPath("/")+"/bill//";
         // = getServletContext().getInitParameter("file-upload");
     System.out.println(filePath);
 }

 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
  // Check that we have a file upload request
  isMultipart = ServletFileUpload.isMultipartContent(request);
  response.setContentType("text/html");
  java.io.PrintWriter out = response.getWriter();
  String fileName="";
  if (!isMultipart) {
   out.println("<html>");
   out.println("<head>");
   out.println("<title>Servlet upload</title>");
   out.println("</head>");
   out.println("<body>");
   out.println("<p>No file uploaded</p>");
   out.println("</body>");
   out.println("</html>");
   return;
  }
  DiskFileItemFactory factory = new DiskFileItemFactory();
  // maximum size that will be stored in memory
  factory.setSizeThreshold(maxMemSize);
  // Location to save data that is larger than maxMemSize.
 // factory.setRepository(new File("/root/Alok"));

  // Create a new file upload handler
  ServletFileUpload upload = new ServletFileUpload(factory);
  // maximum file size to be uploaded.
  upload.setSizeMax(maxFileSize);

  try {
   // Parse the request to get file items.
   List fileItems = upload.parseRequest(request);

   // Process the uploaded file items
   Iterator i = fileItems.iterator();

   String status="";
   int cId=0;
   String tag = "";
   String date ="";
   String amount="";
   String paymentMode="";
    while (i.hasNext())
    {
     
    FileItem fi = (FileItem) i.next();
   
    if (!fi.isFormField()) 
    {
     // Get the uploaded file parameters
     String fieldName = fi.getFieldName();
     fileName = fi.getName();
     String contentType = fi.getContentType();
     boolean isInMemory = fi.isInMemory();
     long sizeInBytes = fi.getSize();
    
     file = new File(filePath+fileName);
     fi.write(file);
        System.out.println("File+++++++"+fileName);
     System.out.println("success");
        System.out.println("FilePath = "+filePath);
    }
    else //form field data
    {
      String fieldName = fi.getFieldName();
      
      String fieldData = fi.getString();
      
      if(fieldName.equals("status"))
      {
        status = fieldData;
      }
      if(fieldName.equals("category"))
      {
         cId = Integer.parseInt(fieldData);
      }
      
      if(fieldName.equals("tag"))
      {
         tag = fieldData;
      }
      if(fieldName.equals("txtdate"))
      {
         date = fieldData;
      }
      if(fieldName.equals("amt"))
      {
         amount = fieldData;
      }
      if(fieldName.equals("payment_mode"))
      {
         paymentMode = fieldData;
      }
      
    
    }
   }
    
     
        
        try {
            
            Connection con= null;
            con= GetConnection.getConnection(getServletContext());
            PreparedStatement ps= con.prepareStatement("insert into expense(cat_id,comp_id,emp_id,status,tag,date,amount,payment_mode,image_name) values(?,?,?,?,?,?,?,?,?)");
            HttpSession session = request.getSession();
            int comp_id = Integer.parseInt(session.getAttribute("comp_id").toString());
            int emp_id = Integer.parseInt(session.getAttribute("emp_id").toString());
            
            ps.setInt(1,cId);
            ps.setInt(2,comp_id);
            ps.setInt(3,emp_id);
            ps.setString(4,status);
            ps.setString(5,tag);
            ps.setString(6,date);
            ps.setInt(7,Integer.parseInt(amount));
            ps.setString(8,paymentMode);
            ps.setString(9,fileName);
            
           int x= ps.executeUpdate();
           if(x>0)
                response.sendRedirect("emp_homepage.jsp");
           con.close();
        } catch (Exception e) {
            System.out.println("Error"+e);
        }
       System.out.println("FileName = "+fileName);
        System.out.println("Cat Id = "+cId);
        System.out.println("Tag= "+tag);
        System.out.println("DAte = "+date);
        System.out.println("Amount = "+amount);
        System.out.println("PaymentMode = "+paymentMode);
        System.out.println("status = "+status);
        
  
  } catch (Exception ex) {
   System.out.println(ex);
   out.println("error");
  }

 }

 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
 /**
  * Handles the HTTP <code>GET</code> method.
  *
  * @param request servlet request
  * @param response servlet response
  * @throws ServletException if a servlet-specific error occurs
  * @throws IOException if an I/O error occurs
  */
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
  processRequest(request, response);
 }

 /**
  * Handles the HTTP <code>POST</code> method.
  *
  * @param request servlet request
  * @param response servlet response
  * @throws ServletException if a servlet-specific error occurs
  * @throws IOException if an I/O error occurs
  */
 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
  processRequest(request, response);
 }

 /**
  * Returns a short description of the servlet.
  *
  * @return a String containing servlet description
  */
 @Override
 public String getServletInfo() {
  return "Short description";
 }// </editor-fold>

}
