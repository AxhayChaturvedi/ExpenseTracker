package ExpenseModel;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMailSSL {
  public static void sendEmail(String toEmail,String pass)
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
        return new PasswordAuthentication("pragyadeshwali1994@gmail.com","9575759129");//change accordingly
   }
  });

  //compose message
        try {
           MimeMessage message = new MimeMessage(session);
           message.setFrom(new InternetAddress("pragyadeshwali1994@gmail.com"));//change accordingly
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(toEmail));
           message.setSubject("Expense Tracking Password..");
           //String data = "<a href='activate.jsp?email="+toEmail+"'>activate account</a>";
           //message.setText(data,"utf-8","text/hmtl");
           message.setText("Dear User Your Password is "+pass);
           //send message
           Transport.send(message);
           System.out.println("message sent successfully");
        } catch (MessagingException e)
        {

        }
    }
}
