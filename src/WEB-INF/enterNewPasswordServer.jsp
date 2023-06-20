<%@ page import="java.sql.*" %>
<%
	String Newpassword = request.getParameter("newpassword");
	String Confpassword = request.getParameter("confpassword");
	
	if(Newpassword != null && Confpassword != null && Newpassword.equals(Confpassword))
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
			String sql = "update adminregtable set password = ? where email = ?";
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, Newpassword);
			pst.setString(2, (String) session.getAttribute("email"));
			
			int i = pst.executeUpdate();
			if(i>0)
			{
				session.setAttribute("status", "Password Reset Successfully");
				response.sendRedirect("index.jsp");
			}
			else
			{
				session.setAttribute("status", "Password Reset Failed");
				response.sendRedirect("index.jsp");
			}
		}
		catch(Exception ex)
		{
			out.println("Exception : "+ex);
		}
	}
%>