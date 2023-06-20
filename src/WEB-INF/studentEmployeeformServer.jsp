<%@ page import="java.sql.*"%>
<% 
String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");
String usertype=request.getParameter("usertype");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
	String sql="insert into `"+usertype+"` (name,email,password,usertype) values ('"+name+"','"+email+"','"+password+"','"+usertype+"')";
	PreparedStatement pst=con.prepareStatement(sql);
	int i=pst.executeUpdate();
	if(i!=0)
	{
		session.setAttribute("sesreg", "data is submited");
		response.sendRedirect("studentEmployeeform.jsp");
	}
}
catch(Exception e)
{
	out.print("error :" +e);
}


%>