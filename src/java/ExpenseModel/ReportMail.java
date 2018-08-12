package ExpenseModel;

import java.sql.ResultSet;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ReportMail {
  public static void sendEmail(String toEmail,ResultSet rs)
  {
     //Get the session object
         Properties props = new Properties();
         props.put("mail.smtp.host", "smtp.gmail.com");
         props.put("mail.smtp.socketFactory.port", "465");
         props.put("mail.smtp.socketFactory.class",
            "javax.net.ssl.SSLSocketFactory");
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.port", "465");
         Session session = Session.getDefaultInstance(props,
   new javax.mail.Authenticator() {
   @Override
   protected PasswordAuthentication getPasswordAuthentication() {
        //char  password[] = "9009557337".toCharArray();
        return new PasswordAuthentication("expensetrackingteam@gmail.com","expense@tracking");//change accordingly
   }
  });

  //compose message
        try {
           MimeMessage message = new MimeMessage(session);
           message.setFrom(new InternetAddress("expensetrackingteam@gmail.com"));//change accordingly
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(toEmail));
           message.setSubject("Expense Tracking Password..");
           //String data = "<a href='activate.jsp?email="+toEmail+"'>activate account</a>";
           String data = "<table border='1'><tr>" +
"        <th>Category</th>" +
"        <th>Tag</th>" +
"        <th>Date</th>" +
"        <th>Amount</th>" +
"        <th>Payment By</th>" +

"      </tr>";
           while(rs.next())
           {
            data = data+ "<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td</tr>";               
                  
           }
           data = data+"</table>";
         //  message.setText(data,"utf-8","text/hmtl");
           
           //message.setText("Dear User Your Password is "+pass);
           //send message
           message.setContent(data, "text/html; charset=utf-8");
           Transport.send(message);
           System.out.println("message sent successfully");
        } catch (Exception e)
        {
             e.printStackTrace();
        }
    }    
}
