<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random" %>
<%@page import="javax.mail.Message.RecipientType"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>

<%
	// Get OTP from session
	int otpsession = (Integer) session.getAttribute("otp");

	// Get OTP from form
	String otpvalue = request.getParameter("Otp");
	int otpform = Integer.parseInt(otpvalue);
	
	String email=(String)session.getAttribute("email");
	String Password = " ";
	
	if(otpsession == otpform)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
			String sql = "select * from adminregtable where email = '"+email+"'";
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				Password = rs.getString("password");
			}
		}
		catch(Exception e)
		{
			System.out.print(e);
			e.printStackTrace();
		}
	}
	else
	{
		out.println("OTP not matched");
		
		session.setAttribute("message", "Wrong OTP");
		response.sendRedirect("enterOTP.jsp");
	}
%>

<%
 	
	
	
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
     message.setSubject("Your pervious password");    
     message.setText("Your password is "+Password);    
     //send message  
     Transport.send(message);    
     System.out.println("message sent successfully");  
    } catch (MessagingException e) {out.println(e);}   
	
%>
