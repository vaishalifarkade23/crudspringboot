<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">  
    </script>
      
    <title>Home Page</title>
  </head>
  
 <style>
.container{
background-color: white;
}
</style>
  
  <body>
  
<%
	
	//int id = (Integer)session.getAttribute("id");
	String hname = "";
	String hemail = (String)session.getAttribute("lemail");
	String hpassword = "";
	String husertype = "";
	int hgender = 0;
	String himage = "";
	//out.println(hname);
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "select * from adminregtable where email = '"+hemail+"'";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			hname = rs.getString("fullname");
			hemail = rs.getString("email");
			hpassword = rs.getString("password");
			husertype = rs.getString("usertype");
			hgender = rs.getInt("gender");
			himage = rs.getString("image");
			//out.println(hemail);
		}
		
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
	session.setAttribute("email", hemail);
	if(himage==null)
	{
		himage="default.png";
	}
%>   


<div class="container">
<h1 style="text-align: center;">Home Page</h1>
<nav class="navbar justify-content-between" style="background-color: #e3f2fd;">

<!-- Image -->

<label class="text-SlateBlue font-weight-bold"><img src="image/<%=himage%>" class="rounded-circle mb-3" style="width: 100px;"/>Welcome <%=hname%><a href="index.jsp"><img src="shutdown.png"></a></label>
<ul class="nav">
	<li class="nav-item">
		<a class="nav-link" href="#">Home</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">Java</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">CSS</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">HTML</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">Javascript</a>
	</li>
</ul>
<form class="form-inline">
	<a href="index.jsp"><i class="fa fa-power-off" style="font-size:24px"></i></a>
</form>
</nav>
<div class="row">

<%
	if(husertype.equalsIgnoreCase("admin")){
	
%>

<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
<ul class="list-group">
	<li class="list-group-item">
		<a class="list-group-item-action" href="#oops">C</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">C++</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">OOPs</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">SQL</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">HTML</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">CSS</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">JavaScript</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Bootstrap</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">JSP</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Servlet</a>
	</li>
</ul>
</div>

<%
	}else{
%>

<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
<ul class="list-group">
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="profileitem">Profile</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="tableitem">Table View</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="emailitem">Send Email</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="passworditem">Create New Password</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="uploaditem">Upload</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="profileimageitem">Upload profile image</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="downloaditem">Download</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="downloadtableitem">Download Table</span></a>

	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="viewdataitem">View Data Using Collection</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="updateitem">Update</span></a>

	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="editformitem">Update form</span></a>
	</li>
</ul>
</div>

<%
}
%>

<div class="col col-lg-9 col-md-9 col-sm-12 col-xs-12">

<!-- Form Section -->
<section id="profile">
<form action="#">

<div class="form-group">
	<label>Full Name</label>
	<input type="text" class="form-control" name="fullname" value="<%=hname%>" disabled>
</div>

<div class="form-group">
	<label>E-Mail</label>
	<input type="text" class="form-control" name="email" value="<%=hemail%>" disabled>
</div>

<div class="form-group">
	<label>Password</label>
	<input type="password" class="form-control" name="password" value="<%=hpassword%>" disabled>
</div>

<div class="form-group">
	<label>User Type</label>
	<select class="form-control" name="">
		<option
		<%
			if(husertype.equalsIgnoreCase("admin")){
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
	<label>Gender</label>
	<div class="form-check">
	<input type="radio" name="gender" class="form-check-input" 
	<%
		if(hgender==0){
	%>
	checked
	<%
		}else{
	%>
	disabled
	<% 
	}
	%>
	>
	<label class="form-check-label">Male</label>
	<input type="radio" name="gender" 
	<%
		if(hgender==1){
	%>
	checked
	<%
		}else{
	%>
	disabled
	<% 
	}
	%>
	>
	<label class="form-check-label">Female</label>
	</div>
	</div>

</form>
</section>

<!-- Tabel Section -->
<section id="tableview">
<div class="container">
  <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for user names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <form action="1tableserver.jsp" method="post">
  <table class="table table-bordered table-striped" id="table">
  
    <thead>
      <tr>
      	<th>Select</th>
      	<th>ID</th>
        <th>FullName</th>
        <th>Email</th>
        <th>Password</th>
        <th>Usertype</th>
         <th>Gender</th>
      </tr>
    </thead>
    
    <tbody id="myTable">
      
    <% 
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
        String sql = "select * from adminregtable";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
        	%>
        	<tr>
        		<td><input type="checkbox" id="checkboxid" name="checkboxname" value=<%= rs.getInt("id")%>></td>
        		<td><%= rs.getInt("id")%></td>
        		<td><%= rs.getString("fullname")%></td>
        		<td><%= rs.getString("email")%></td>
        		<td><%= rs.getString("password")%></td>
        		<td><%= rs.getString("usertype")%></td>
        		<td><%= rs.getString("gender")%></td>
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
</section>


<!-- Email Section -->
<section id="emailview">
<div class="container">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header bg-primary text-white"><i class="fa fa-envelope"></i> Contact us.
                </div>
                <div class="card-body">
                    <form action="sendemail.jsp">
                        <div class="form-group">
                            <label>From</label>
                            <input type="email" class="form-control" id="emailfrom" name="emailfrom" aria-describedby="emailHelp" required>
                            <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                        </div>
                        
                        <div class="form-group">
                            <label>To</label>
                            <input type="email" class="form-control" id="emailto" name="emailto" aria-describedby="emailHelp" required>
                            <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                        </div>
                        
                        <div class="form-group">
                            <label>Subject</label>
                            <input type="text" class="form-control" id="subject" name="subject" aria-describedby="emailHelp" required>
                            <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                        </div>
                        
                        <div class="form-group">
                            <label>Message</label>
                            <textarea class="form-control" id="message" rows="6" required name="message"></textarea>
                        </div>
                        
                        <div class="mx-auto">
                        <button type="submit" class="btn btn-primary text-right">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
                    
</section>

<!-- Create new password -->
<section id="passwordview">
<div class="container">
  	<div class="row">
  	
  	<div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
  	</div>
  
  	<div class="col col-lg-8 col-md-6 col-sm-6 col-xs-12">
  	<div class="modal-body" >
  	<div style="border:thin solid black; padding:20px">
  	<form action="enterNewPasswordServer.jsp" method="post">
  
  	<div class="form-group">
  		<div class="col-md-5">
  			<label>New Password</label>
  			<input type="text" name="newpassword" class="form-control">
  		</div>
  	</div>
  	
  	<div class="form-group">
  		<div class="col-md-5">
  			<label>Confirm Password</label>
  			<input type="password" name="confpassword" class="form-control">
  		</div>
  	</div>
  	
  	<div class="form-group">
    	<div class="col-md-9">
        	<button type="submit" class="btn btn-info">Reset</button>
        </div>
    </div>
    
  	</form>
  	</div>
  	</div>
 	</div>
 	
 	<div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
  	</div>
 	
  	</div>
  </div>
</section>

<!--  Upload Section -->
<section id="uploadsection">
<form action="upload.jsp" method="post" enctype="multipart/form-data">

	<div class="form-group">
  		<div class="col-md-5">
  			<input type="file" name="file" class="form-control">
  		</div>
  	</div>
  	
  	<div class="form-group">
  		<div class="col-md-5">
  			<button type="submit" class="btn btn-primary">Upload</button>
  		</div>
  	</div>
  	
</form>
</section>

<!-- Upload Profile Image -->
<section id="profileimagesection">
	<form action="profile.jsp" method="post" enctype="multipart/form-data">

	<div class="form-group">
  		<div class="col-md-5">
  			<input type="file" name="file" class="form-control">
  		</div>
  	</div>
  	
  	<div class="form-group">
  		<div class="col-md-5">
  			<button type="submit" class="btn btn-success">Upload</button>
  		</div>
  	</div>
  	
	</form>
	</section>
	
<!--Download  -->
<section id="downloadview">
<a href="download.jsp">download</a>
</section>

<!-- download table -->
<section id="downloadtableview">
<div class="container">
 
  <form action="#" method="post">
  <table class="table table-bordered table-striped" id="table">
  
    <thead>
      <tr>
        <th>id</th>
      	<th>fullname</th>
      	<th>email</th>
        <th>password</th>
        <th>address</th>
        <th>filename</th>
         <th>download</th>
      </tr>
    </thead>
    
    <tbody id="myTable">
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
        		<td><a href="download1.jsp?fname=<%=rs.getString("attachments")%>">download</a></td>
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
  			
  </form>
</div>
</section>

<!-- view data using collection -->
<section id="collectiondataview">
 <a href="collection.jsp">view data using collection</a>
						
<%
	List list=(List)session.getAttribute("list");
    String id=(String)session.getAttribute("id");
    if(list==null)
    {
    	
    }
    else
    {
    	%>
    	<div class="container">
<form action="coll.jsp" method="post">
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
    	Iterator itr=list.iterator();
        String id1="";
    	while(itr.hasNext())
    		id1=(String)itr.next();
    	{
    	%>
    	<tr>
    	<td><%=id1 %></td>
    	<td><%=itr.next() %></td>
    	<td><%=itr.next() %></td>
    	<td><%=itr.next() %></td>
    	<td><%=itr.next() %></td>
    	<td><%=itr.next() %></td>
    	<td><a href="dashboard.jsp?id=<%=id1 %>" id="edit">Edit</a></td>
    	</tr>
    	<% 
    	}
    }
%>

</table>
</form>
</div>
</section>

<section id="updateview">
<% 
String id2 = request.getParameter("id");
try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
        String sql = "select * from dbregistration where id = '"+id+"' ";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
        	%>
        	        <div class="container-fluid">
	<div class="row">
		
		<div class="col col-lg-2 ">
			
		</div>
		<div class="col col-lg-8">
<form action="#" method="post" enctype = "multipart/form-data">
<section class="vh-100" style="background-color: #2779e2;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-9">

        <h1 class="text-white mb-4">Apply for a job</h1>
       
       <input type="text" hidden value="<%=rs.getInt(1) %>">
        <div class="card" style="border-radius: 15px;">
          <div class="card-body">

            <div class="row align-items-center pt-4 pb-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Full name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="fullname" class="form-control form-control-lg" value="<%=rs.getString(2)%>"/>

              </div>
            </div>

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Email address</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="email" name="email" class="form-control form-control-lg"  value="<%=rs.getString(3)%>"/>

              </div>
            </div>

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Password</h6>

              </div>
              <div class="col-md-9 pe-5">

				<input type="text" name="password" class="form-control form-control-lg"  value="<%=rs.getString(4)%>"/>
				
                </div>
            </div>

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Address</h6>

              </div>
              <div class="col-md-9 pe-5">

                <textarea name="address" class="form-control" rows="3" value="<%=rs.getString(5)%>"/></textarea>

              </div>
            </div>
            
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Upload CV</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input class="form-control form-control-lg" id="formFileLg" type="file" name="file" value="<%=rs.getString(6)%>"/>
                <div class="small text-muted mt-2">Upload your CV/Resume or any other relevant file. Max file
                  size 50 MB</div>

              </div>
            </div>

            <div class="px-5 py-4">
              <button type="submit" class="btn btn-primary btn-lg">Register</button>
            </div>

          </div>
        </div>

      </div>
    </div>
  </div>
</section>
</form>
		</div>
		
		<div class="col col-lg-2">
			
		</div>
		
	</div>
</div>
        	 <% 
        }
    }
        catch(Exception ex)
        {
            System.out.println("Exception : "+ex.getMessage());
        }

        %>
</section>

              
</div>
</div>
</div>


<script>
	$(document).ready(function(){
		//alert('Hello');
		$("#profile").show();
		$("#tableview").hide();
		$("#emailview").hide();
		$("#passwordview").hide();
		$("#uploadsection").hide();
		$("#profileimagesection").hide();
		$("#downloadview").hide();
		$("#downloadtableview").hide();
		$("#collectiondataview").hide();
		$("#updateview").hide();
		$("#editformview").hide();
		
		$("#profileitem").click(function(){
			$("#profile").show();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").hide();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#tableitem").click(function(){
			$("#profile").hide();
			$("#tableview").show();
			$("#emailview").hide();
			$("#uploadsection").hide();
			$("#passwordview").hide();
			$("#profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").hide();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#emailitem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").show();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").hide();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#passworditem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").show();
			$("#uploadsection").hide();
			$("profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").hide();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#uploaditem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").show();
			$("profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").hide();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#profileimageitem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#profileimagesection").show();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").hide();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#downloaditem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#profileimagesection").hide();
			$("#downloadview").show();
			$("#downloadtableview").hide();
			$("#collectiondataview").hide();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#downloadtableitem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").show();
			$("#collectiondataview").hide();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#viewdataitem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").show();
			$("#updateview").hide();
			$("#editformview").hide();
		});
		
		$("#updateitem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").hide();
			$("#updateview").show();
			$("#editformview").hide();
		});
		
		$("#editformitem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#profileimagesection").hide();
			$("#downloadview").hide();
			$("#downloadtableview").hide();
			$("#collectiondataview").show();
			$("#updateview").show();
			$("#editformview").show();
		});
		
	});
	
	
	
</script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>






