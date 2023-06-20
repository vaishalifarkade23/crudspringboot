<%@ page import="java.sql.*"%>
<%
	// Get OTP from session
	int otpsession = (Integer) session.getAttribute("otp");

	// Get OTP from form
	String otpvalue = request.getParameter("Otp");
	int otpform = Integer.parseInt(otpvalue);
	
	String email=(String)session.getAttribute("email");
	
	if(otpsession == otpform)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
			String sql = "insert into adminregtable (email) values ('"+email+"')";
			PreparedStatement pst = con.prepareStatement(sql);
			int i = pst.executeUpdate();
			out.println("Thank you for register.!");
		}
		catch(Exception e)
		{
			System.out.print(e);
			e.printStackTrace();
		}
		
		session.setAttribute("status", "success");
		response.sendRedirect("enterNewPassword.jsp");
		
		
	}
	else
	{
		out.println("OTP not matched");
		
		session.setAttribute("message", "Wrong OTP");
		response.sendRedirect("enterOTP.jsp");
	}
%>
