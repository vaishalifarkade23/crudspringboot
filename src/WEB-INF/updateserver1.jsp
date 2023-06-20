<%@ page import="java.sql.*"%>



<%
String id=request.getParameter("id");
String fname=request.getParameter("fullname");
String email=request.getParameter("email");
String pass=request.getParameter("password");
String attachment=request.getParameter("file");


try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
	String sql = "UPDATE attachmentregister SET `fullName`='"+fname+"',`email`='"+email+"',`password`='"+pass+"',`userType`='"+attachment+"' WHERE `id`='"+id+"'";
	PreparedStatement pst = con.prepareStatement(sql);
	int i =pst.executeUpdate();
	if(i>0)
	{
		//session.setAttribute("sesupdate", " Updated Sucessfully" );
		response.sendRedirect("dashboard.jsp");
	}
}catch(Exception e){
	out.print(e);
	}
%>