<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String id1=request.getParameter("id");
int id=Integer.parseInt(id1);
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String password=request.getParameter("password");


Connection con;

try{
	 Class.forName("com.mysql.jdbc.Driver");
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
	 String sql="select id,email from newregistration where id='"+id+"' or email='"+email+"'";
	 PreparedStatement pst=con.prepareStatement(sql);
	 ResultSet rs=pst.executeQuery();
	 if(rs.next()){
		 if(rs.getInt("id")==id){
		 session.setAttribute("resp1", "id already exist");
		 response.sendRedirect("newRegistrationForm.jsp");
		}
		  if(rs.getString("email").equalsIgnoreCase(email)){
			 session.setAttribute("resp1", "email id already exist");
			 response.sendRedirect("newRegistrationForm.jsp");
		}
	 }
	 else{
	 
	 try{
		String sql2="insert into newregistration(id, firstname, lastname, email, password) values ('"+id+"','"+fname+"','"+lname+"','"+email+"','"+password+"')";
		PreparedStatement pst1=con.prepareStatement(sql2);
		int i=pst1.executeUpdate();
		if(i!=0){
			session.setAttribute("resp2", "data submitted successfully");
			response.sendRedirect("newRegistrationForm.jsp");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
}
}
	 catch(Exception e)
	{
			out.println(e);
	 }
%>