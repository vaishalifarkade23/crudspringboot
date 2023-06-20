<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for user names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <form action="tabelServer.jsp" method="post">
  <table class="table table-bordered table-striped" id="table">
  
    <thead>
      <tr>
      	<th>Select</th>
      	<th>ID</th>
        <th>User Name</th>
        <th>Email</th>
        <th>Password</th>
      </tr>
    </thead>
    
    <tbody id="myTable">
      
    <% 
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
        String sql = "select * from newsigninform";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
        	%>
        	<tr>
        		<td><input type="checkbox" id="checkboxid" name="checkboxname" value=<%= rs.getInt("id")%>></td>
        		<td><%= rs.getInt("id")%></td>
        		<td><%= rs.getString("username")%></td>
        		<td><%= rs.getString("email")%></td>
        		<td><%= rs.getString("password")%></td>
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
  </table>
  			<div class="col-md-6 offset-md-4">
        		 <button type="submit" class="btn btn-primary" name="deletebtn" onclick="deleteRow();">Delete</button>
            </div>
  </form>
</div>

<!--  <script>
	function deleteRow() 
	{
		if (document.getElementById('checkboxid').checked)
			{
	        	var answer = confirm('Are you sure you want to delete this checkbox?');
	         	if (answer)
	           		{
	           			$("#checkboxid").remove();
	           		}
			}
		else
			{
				alert("Pls check the checkbox.");
			}
  	}
</script> -->

</body>
</html>
