<%@ page import="java.sql.*" %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
	String sql="select max(id) from newregistration";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		int id=rs.getInt(1)+1;
		session.setAttribute("id", id);
		response.sendRedirect("newRegistrationForm.jsp");
		//out.println(id);
	}
	
	}catch(Exception e){
	out.println(e);
	}
%>
