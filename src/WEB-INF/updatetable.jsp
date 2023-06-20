<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
   <div class="container">
<form action="updatetableserver.jsp" method="post">
<table class="table table-bordered table-striped">
		 
            <tr>
                                    <th>Id</th>
									<th>User Name</th>
							        <th>Email</th>
									<th>Password</th>
									<th>Address</th>
									<th>Upload</th>
									<th>Select</th>					   
            </tr>
             <% 
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
        String sql = "select * from attachmentregister";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
        	%>
        	<tr>
        		
        		<td><%= rs.getInt("id")%></td>
        		<td><%= rs.getString("username")%></td>
        		<td><%= rs.getString("email")%></td>
        		<td><%= rs.getString("password")%></td>
        		<td><%= rs.getString("address")%></td>
        		<td><%= rs.getString("attachments")%></td>
        		<td><a href="updatetableserver.jsp?id=<%=rs.getString("id")%>">Edit</a></td>
        		
        	</tr>
        	<%
		}
	}
	catch (Exception ex) 
	{
		out.print("Exception : "+ex);
	}
	%>
      
    	
    	
        
</table>
</form>
</div>

								
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>