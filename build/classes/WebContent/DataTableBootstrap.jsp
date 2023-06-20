<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" >
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css">

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" ></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>

<title>Insert title here</title>
</head>
<body>

<div class="container">
<h2 style="text-align: center;">FILTER TABLE </h2>
<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                					<th>Sr. no.</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Gender</th>
									<th>Course</th>
									<th>Address</th>
									<th>City</th>
									<th>State</th>
									<th>Contact No.</th>
									<th>Email</th>
			</tr>
        </thead>
        <tbody>
       							 <%
								try {
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
									String sql = "select * from db_registration";
									PreparedStatement ps =con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();
									while (rs.next())
									{
								%>
           <tr>
									<td><%= rs.getInt("Id")%></td>
									<td><%=rs.getString("FirstName")%></td>
									<td><%=rs.getString("LastName")%></td>
									<td><%=rs.getString("Gender")%></td>
									<td><%=rs.getString("Course")%></td>
									<td><%=rs.getString("Address")%></td>
									<td><%=rs.getString("City")%></td>
									<td><%=rs.getString("State")%></td>
									<td><%=rs.getString("Contact")%></td>
									<td><%=rs.getString("Email")%></td>
									</tr>
								<%
								}
								
								}	
								catch (Exception ex) 
								{
									out.print("Exception : "+ex);
								}
								%>
        </tbody>
        <tfoot>
            <tr>
                				<th>Sr. no.</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Gender</th>
									<th>Course</th>
									<th>Address</th>
									<th>City</th>
									<th>State</th>
									<th>Contact No.</th>
									<th>Email</th>	
            </tr>
        </tfoot>
    </table>
 </div>   
 
<!-- JavaScript -->
<script>
	$(document).ready(function () {
    $('#example').DataTable();
	});
</script>

</body>
</html>