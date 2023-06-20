<%@ page import="java.sql.*" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Student Page</title>
    <link rel="stylesheet" href="CSS/style.css">
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
  </head>
  <body>
  
  <%
	String sesSignIn = (String)session.getAttribute("sesSignIn");
	if(sesSignIn == null)
	{
		
	}
	else
	{
		%>
			<div class="alert alert-success"><%= sesSignIn%></div>
		<% 
	}
%>
    
  
  <%
	
	//int id = (Integer)session.getAttribute("id");
	String hfullName = "";
	String hemail = (String)session.getAttribute("semail");
	String huserName = "";
	String hpassword = "";
	String hgender = "";
	String hcity = "";
	String husertype = "";
	String haddress = "";
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "select * from newsigninform where email = '"+hemail+"'";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			hfullName = rs.getString("fullname");
			hemail = rs.getString("email");
			huserName = rs.getString("username");
			hpassword = rs.getString("password");
			hgender = rs.getString("gender");
			hcity = rs.getString("city");
			husertype = rs.getString("registeredtype");
			haddress = rs.getString("address");
		}
		
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
%>   
  
  
  <div class="wrapper">
  	<div class="sidebar">
  		<h2>Sidebar</h2>
  			<ul>
  				<li><a href="#"><i class="fas fa-home"></i>Home</a></li>
  				<li><a href="#"><i class="fas fa-user"></i>Profile</a></li>
  				<li><a href="#"><i class="fas fa-address-card"></i>Assignment</a></li>
  				<li><a href="#"><i class="fas fa-bell"></i>Announcements</a></li>
  				<li><a href="#"><i class="fas fa-book-open"></i>Class Notebook</a></li>
  				<li><a href="#"><i class="fas fa-shapes"></i>Modules</a></li>
  				<li><a href="#"><i class="fas fa-newspaper"></i>Newsela</a></li>
  				<li><a href="#"><i class="fas fa-award"></i>Grades</a></li>
  				<li><a href="#"><i class="fa-brands fa-microsoft"></i>Office 365</a></li>
  			</ul>
  	</div>
  	<div class="main_content">
  		<div class="header">Welcome!! <br><%=hfullName%> , Have a nice day.</div>
  		<div class="info">
  			<div>
  			
  				<form action="#">

				<div class="form-group">
					<label>Full Name</label>
					<input type="text" class="form-control" name="fullname" value="<%=hfullName%>" disabled>
				</div>

				<div class="form-group">
					<label>E-Mail</label>
					<input type="text" class="form-control" name="email" value="<%=hemail%>" disabled>
				</div>
				
				<div class="form-group">
					<label>User Name</label>
					<input type="text" class="form-control" name="email" value="<%=huserName%>" disabled>
				</div>

				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" value="<%=hpassword%>" disabled>
				</div>
				
				<div class="form-group">
					<label>Gender</label>
					<select class="form-control" name="">
					<option
					<%
						if(hgender.equalsIgnoreCase("Male")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<%
					}
					%>
					>Male
					</option>
					<option 
					<%
						if(hgender.equalsIgnoreCase("Female")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<% 
						}
					%>
					>Female
					</option>
					</select>
			</div>
				
				<div class="form-group">
					<label>City</label>
					<select class="form-control" name="">
					<option
					<%
						if(hcity.equalsIgnoreCase("Amravati")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<%
					}
					%>
					>Amravati
					</option>
					<option 
					<%
						if(hcity.equalsIgnoreCase("Nashik")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<% 
						}
					%>
					>Nashik
					</option>
					<option 
					<%
						if(hcity.equalsIgnoreCase("Solapur")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<% 
						}
					%>
					>Solapur
					</option>
					<option 
					<%
						if(hcity.equalsIgnoreCase("Kolhlapur")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<% 
						}
					%>
					>Kolhlapur
					</option>
					<option 
					<%
						if(hcity.equalsIgnoreCase("Nagpur")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<% 
						}
					%>
					>Nagpur
					</option>
					</select>
			</div>
				
				<div class="form-group">
					<label>Registered As</label>
					<select class="form-control" name="">
					<option
					<%
						if(husertype.equalsIgnoreCase("Admin")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<%
					}
					%>
					>Admin
					</option>
					<option 
					<%
						if(husertype.equalsIgnoreCase("Student")){
					%>
					selected
					<%
						}else{
					%>
					disabled
					<% 
						}
					%>
					>Student
					</option>
					</select>
			</div>

			<div class="form-group">
					<label>Address</label>
					<textarea rows="3" cols="20" class="form-control"><%=haddress%></textarea>
				</div>
			
				</form>
  
  			</div>
  		</div>
  	</div>
  </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>