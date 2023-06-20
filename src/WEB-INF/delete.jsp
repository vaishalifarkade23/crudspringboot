<%@ page import="java.sql.*" %>

<%
	
	int id = Integer.parseInt(request.getParameter("id"));
	String[] checkbox=request.getParameterValues("checkbox");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "delete from newsigninform where id = '"+id+"'" ;
		PreparedStatement pst = con.prepareStatement(sql);
		int i = pst.executeUpdate();
		if(i>0)
		{
			session.setAttribute("sesdelete", "Record Deleted Successfully...!!!");
			response.sendRedirect("tabel.jsp");
		}
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
	
%>


