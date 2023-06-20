<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@page import="javax.mail.Message.RecipientType"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>

<%
	String sfullname = request.getParameter("fullname");

	// Get email id
	String semail = request.getParameter("email");
	boolean resp=false;
	String spassword = request.getParameter("password");
	String susertype = request.getParameter("comboaction");
	String sGender = request.getParameter("gender");
	int sgender = Integer.parseInt(sGender);
	
	Random ob = new Random();
	int otp = ob.nextInt(899999) + 100000;
		
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql1 =  "select * from adminregtable where email = '"+semail+"'";
		PreparedStatement ps = con.prepareStatement(sql1);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			//if(semail.equals(rs.getString("email")))
			//{
				session.setAttribute("sesReg1", "email id already exist!!");
				response.sendRedirect("SignUp.jsp");
				//out.println("Email Id already exist");
			//}
		}
		else
		{
			
			try
				{
					String sql = "insert into adminregtable (fullname, email, password, usertype, gender,otp) values ('"+sfullname+"', '"+semail+"', '"+spassword+"', '"+susertype+"', '"+sgender+"','"+otp+"')";
					PreparedStatement pst = con.prepareStatement(sql);
					int i = pst.executeUpdate();
					if(i!=0)
					{
						session.setAttribute("sesSign", "Successfully Registartion...!!!");
						resp=true;
						//response.sendRedirect("index.jsp");
					}
					//out.println("Data is successfully inserted!");
				}
				catch(Exception ex)
				{
					out.println("Exception : "+ex);
				}
		}
		}
		catch(Exception ex1)
		{
			out.println("Exception : "+ex1);
		}
		 
		// Generate 6 digit OTP number
		
		
		
		// Set session for email 
		session.setAttribute("email", semail);
		//response.sendRedirect("enterEmail1.jsp");
				
		// Set session for otp
		session.setAttribute("otp", otp); // We'll save the OTP in this sesseion to validate later, when user will enter OTP than we'll get this OTP from session & we'll check/compare with the OTP enter by the user (if both the OTP is same then we'll reset the password otherwise we'll show wrong message)
		//String Message = "Your OTP is "+otp;
		
		if(resp){
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
	    message.addRecipient(RecipientType.TO, new InternetAddress(semail));
	    message.setSubject("Get OTP");    
	     message.setText("Your OTP is "+otp);    
	     //send message  
	     Transport.send(message);    
	     //System.out.println("message sent successfully");  
	    } catch (MessagingException e) {
	    	out.println(e);
	    	}   
	response.sendRedirect("enterOTP1.jsp");
		}
%>

