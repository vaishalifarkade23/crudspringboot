<%@ page import="java.sql.*" %>
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
   
   <%

	String id = request.getParameter("id");
	String ename = "";
	String elastname = "";
	String egender = "";
	String ecourse = "";
	String eaddress = "";
	String ecity = "";
	String estate = "";
	String ezip = "";
	String econtact = "";
	String eemail = "";
	String epassword = "";
	
	try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
        String sql = "select * from dbregistration where id = '"+id+"' ";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
        	ename = rs.getString("name");
        	elastname = rs.getString("lastname");
        	egender = rs.getString("gender");
        	ecourse = rs.getString("course");
        	eaddress = rs.getString("address");
        	ecity = rs.getString("city");
        	estate = rs.getString("state");
        	ezip = rs.getString("zip");
        	econtact = rs.getString("contactNo");
        	eemail = rs.getString("email");
        	epassword = rs.getString("password");
        }
    }
    catch(Exception ex)
    {
        System.out.println("Exception : "+ex.getMessage());
    }

%>
    
  <div class="container">
  <div class="row">
  		<div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
    	</div>
    	<div class="col col-lg-8 col-md-6 col-sm-6 col-xs-12">
    		<div class="modal-body" >
        	<div style="border:thin solid black; padding:20px">
          		<form action="editserver.jsp" method="get">
          		<div class="form-group">
        			
        			<input type="hidden" name="id" class="form-control" value=<%=id%>>
        		</div>
        		<div class="form-group">
        			<label>Name</label>
        			<input type="text" name="username" class="form-control" value=<%=ename%>>
        		</div>
        		
        		<div class="form-group">
        			<label>Last Name</label>
        			<input type="text" name="userlastname" class="form-control" value=<%=elastname%>>
        		</div>
        		
				<div class="form-group">
    				<label>Select gender</label>
    				<input type="radio" name="gender" value="male"
    					<%
    						if(egender.equalsIgnoreCase("Male"))
    							out.println("checked");
    					%>
    				>Male
    				<input type="radio" name="gender" value="female"
    					<%
    						if(egender.equalsIgnoreCase("Female"))
    							out.println("checked");
    					%>
    				>Female
    				<input type="radio" name="gender"
    					<%
    						if(egender.equalsIgnoreCase("Other"))
    							out.println("checked");
    					%>
    				>Other
    			</div>
    			
    			<div class="form-group">
    				<label>Select the course</label>
    					<%
    						String[] coursess = ecourse.split(" ");
    						for(int i=0; i<coursess.length; i++)
    						{
    							%>
    							<input type="checkbox" name="course"  value="java"
    							<% 
    							if(coursess[i].equalsIgnoreCase("Java"))
    								out.println("checked");
    					
    					%>
    				>Java
    				<input type="checkbox" name="course"  value="C#"
    					<%
    					if(coursess[i].equalsIgnoreCase("C#"))
							out.println("checked");
    					%>
    				>C#
    				<input type="checkbox" name="course" value="python"
    					<%
    					if(coursess[i].equalsIgnoreCase("Python"))
							out.println("checked");
    					%>
    				>Python
    				<input type="checkbox" name="course" value="C++"
    					<%
    					if(coursess[i].equalsIgnoreCase("C++"))
							out.println("checked");
    					%>
    				>C++
    				<%
    						}
    				%>
    			</div>
    			    			
        		<div class="form-group">
        			<label>Address</label>
        			<textarea name="address" value="<%=eaddress %>"></textarea>
        		</div>
        		
        		<div class="form-row">
    			<div class="form-group col-md-6">
      				<label>City</label>
     				 <input type="text" class="form-control" name="city" value=<%=ecity%>>
    			</div>
    			
    			<div class="form-group col-md-4">
      				<label>State</label>
      				<select name="state" class="form-control" >
        				<option value="select">Select state</option>
        				<option value="Andhra Pradesh"
        					<% 
								if (estate.equalsIgnoreCase("Andhra Pradesh")) {
							%>
							selected
							<%
							}
							%>
        				>Andhra Pradesh</option>
        				<option value="Bihar"
        					<% 
								if (estate.equalsIgnoreCase("Bihar")) {
							%>
							selected
							<%
							}
							%>
        				>Bihar</option>
        				<option value="Gujarat"
        					<% 
								if (estate.equalsIgnoreCase("Gujarat")) {
							%>
							selected
							<%
							}
							%>
        				>Gujarat</option>
        				<option value="Himachal Pradesh"
        					<% 
								if (estate.equalsIgnoreCase("Himachal Pradesh")) {
							%>
							selected
							<%
							}
							%>
        				>Himachal Pradesh</option>
        				<option value="Jammu and Kashmir"
        					<% 
								if (estate.equalsIgnoreCase("Jammu and Kashmir")) {
							%>
							selected
							<%
							}
							%>
        				>Jammu and Kashmir</option>
        				<option value="Maharashtra"
        					<% 
								if (estate.equalsIgnoreCase("Maharashtra")) {
							%>
							selected
							<%
							}
							%>
        				>Maharashtra</option>
        				<option value="Rajasthan"
        					<% 
								if (estate.equalsIgnoreCase("Rajasthan")) {
							%>
							selected
							<%
							}
							%>
        				>Rajasthan</option>
        				<option value="Sikkim"
        					<% 
								if (estate.equalsIgnoreCase("Sikkim")) {
							%>
							selected
							<%
							}
							%>
        				>Sikkim</option>
        				<option value="Tamil Nadu"
        					<% 
								if (estate.equalsIgnoreCase("Tamil Nadu")) {
							%>
							selected
							<%
							}
							%>
        				>Tamil Nadu</option>
      				</select>
    			</div>
    			
    			<div class="form-group col-md-2">
      				<label>Zip</label>
      				<input type="text" class="form-control" name="zip" value=<%=ezip%>>
    			</div>
  				</div>
        		
        		<div class="form-group">
        			<label>Contact Number</label>
        			<input type="text" name="contact" class="form-control" value=<%=econtact%>>
        		</div>
        		
        		<div class="form-group">
        			<label>Email</label>
        			<input type="text" name="email" class="form-control" value=<%=eemail%>>
        		</div>
        		
        		<div class="form-group">
        			<label>Password</label>
        			<input type="password" name="password" class="form-control" value=<%=epassword%>>
        		</div>
        		
        		<div class="form-group">
        			<label>Confirm Password</label>
        			<input type="password" name="confirmpassword" class="form-control">
        		</div>
        		
        		<div class="form-group">
        			<button type="submit" class="btn btn-success">Update</button>
        			<!--  <a href="home.jsp" class="btn btn-default">Back</a> -->
        		</div>
        		
        		</form>
    		</div>
    		</div>
    	</div>
    	<div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
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