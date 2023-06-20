<%@ page import="java.sql.*" %>
<%
	String semail = request.getParameter("email");
	String username = request.getParameter("username");
	String spassword = request.getParameter("password");
	String suserType = request.getParameter("radioaction");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "select * from newsigninform where email = '"+semail+"' and password = '"+spassword+"' and registeredtype = '"+suserType+"'";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			session.setAttribute("semail", semail);
			session.setAttribute("sesSignIn", "Login Successfully...!!!");
			//response.sendRedirect("newAdminPage.jsp");
			
			if(suserType.equalsIgnoreCase("Admin"))
			{
				response.sendRedirect("newAdminPage.jsp");
			}
			else
			{
				response.sendRedirect("newStudentForm.jsp");
			}
			
		}
		else
		{
			session.setAttribute("sesSignIn", "Wrong Credential...!!!");
			response.sendRedirect("newSignInForm.jsp");
		}
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
%>
