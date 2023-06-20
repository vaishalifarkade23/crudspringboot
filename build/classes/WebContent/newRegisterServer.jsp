<%@page import="java.sql.*" %>

<% 
	String rfullname = request.getParameter("fullname");
	String remail = request.getParameter("email");
	String rusername = request.getParameter("username");
	String rpassword = request.getParameter("password");
	String rgender = request.getParameter("combogender");
	String rcity = request.getParameter("combocity");
	String rRegisteredAs = request.getParameter("comboreg");
	String raddress = request.getParameter("address");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql =  "select email from newsigninform where email = '"+remail+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			if(rs.getString("email").equalsIgnoreCase(remail))
			{
				session.setAttribute("sesReg1", "email id already exist!!");
				response.sendRedirect("newRegisterForm.jsp");
			}
		}
		else
		{
			try
			{
				String sql1 = "insert into newsigninform (fullname, email, username, password, gender, city, registeredtype, address) values ('"+rfullname+"', '"+remail+"', '"+rusername+"', '"+rpassword+"', '"+rgender+"', '"+rcity+"', '"+rRegisteredAs+"', '"+raddress+"')";
				PreparedStatement pst = con.prepareStatement(sql1);
		 		int i = pst.executeUpdate();
		 		if(i>0)
		 		{
		 			session.setAttribute("sesReg", "Successfully Registartion...!!!");
					response.sendRedirect("newSignInForm.jsp");
		 		}
			}
			catch(Exception ex)
			{
				out.print("Exception"+ex);
			}
		}
	} 
	catch(Exception ex)
	{
		out.print("Exception" +ex);
	}
%>


		