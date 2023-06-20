<%@ page import="java.sql.*" %>

<%
	String id = request.getParameter("id");
	String uname = request.getParameter("username");
	String ulastname = request.getParameter("userlastname");
	String ugender = request.getParameter("gender");
	String[] ucourse = request.getParameterValues("course");
	String courses="";
	for(int i=0;i<ucourse.length;i++){
		courses+=ucourse[i]+" ";
	}
	String uaddress = request.getParameter("address");
	String ucity = request.getParameter("city");
	String ustate = request.getParameter("state");
	String uzip = request.getParameter("zip");
	String ucontact = request.getParameter("contact");
	String uemail = request.getParameter("email");
	String upassword = request.getParameter("password");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "update dbregistration set name = '"+uname+"', lastname = '"+ulastname+"', gender = '"+ugender+"', course = '"+courses+"', address = '"+uaddress+"', city = '"+ucity+"', state = '"+ustate+"', zip = '"+uzip+"', contactNo = '"+ucontact+"', email = '"+uemail+"', password = '"+upassword+"' where id = '"+id+"'";
		PreparedStatement pst = con.prepareStatement(sql);
		int i = pst.executeUpdate();
		if(i>0)
		{
			session.setAttribute("sesupdate", "Record Updated Successfully...!!!");
			response.sendRedirect("home.jsp");
		}
	}
	catch(Exception ex)
	{
		out.print("Exception : "+ex);
	}
%>