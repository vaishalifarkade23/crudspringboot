
<%@page import="javax.mail.Message.RecipientType"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>


<%
	String From = request.getParameter("emailfrom");
	String to = request.getParameter("emailto");
	String Subject = request.getParameter("subject");
	String Message = request.getParameter("message");
	
	//Get properties object    
    Properties props = new Properties();    
    props.put("mail.smtp.host", "smtp.gmail.com");    
    props.put("mail.smtp.socketFactory.port", "465");    
    props.put("mail.smtp.socketFactory.class",    
              "javax.net.ssl.SSLSocketFactory");    
    props.put("mail.smtp.auth", "true");    
    props.put("mail.smtp.port", "465");  
    
    //get Session   
    Session session1 = Session.getInstance(props,    
     new javax.mail.Authenticator() {    
     protected PasswordAuthentication getPasswordAuthentication() {    
     return new PasswordAuthentication("vaishalifarkade143@gmail.com","crxgdeiiukusodku");  
     }    
    });    
    
    //compose message    
    try {    
     MimeMessage message = new MimeMessage(session1);    
    // message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
    message.addRecipient(RecipientType.TO, new InternetAddress(to));
     message.setSubject(Subject);    
     message.setText(Message);    
     //send message  
     Transport.send(message);    
     System.out.println("message sent successfully");    
    } catch (MessagingException e) {throw new RuntimeException(e);}    
%>