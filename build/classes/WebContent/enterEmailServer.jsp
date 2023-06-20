<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@page import="javax.mail.Message.RecipientType"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>

<%
 	// Get email id
	String email = request.getParameter("email");
	
	// Generate 6 digit OTP number
	Random ob = new Random();
	int r1 = ob.nextInt();
	int r2 = ob.nextInt(899999);
	int otp = r2 + 100000;
	
	// Set session for email & otp
	session.setAttribute("email", email);
	//response.sendRedirect("enterEmail.jsp");
	
	session.setAttribute("otp", otp); // We'll save the OTP in this sesseion to validate later, when user will enter OTP than we'll get this OTP from session & we'll check/compare with the OTP enter by the user (if both the OTP is same then we'll reset the password otherwise we'll show wrong message)
	//String Message = "Your OTP is "+otp;
	response.sendRedirect("enterOTP.jsp");
	
	// Send 6 digit OTP to Email
	
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
    message.addRecipient(RecipientType.TO, new InternetAddress(email));
     message.setSubject("Get OTP for password");    
     message.setText("Your OTP is "+otp);    
     //send message  
     Transport.send(message);    
     System.out.println("message sent successfully");  
    } catch (MessagingException e) {out.println(e);}   
	
%>