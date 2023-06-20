<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Login Page</title>
  </head>
  <body>
  
  <%
   		String sesSign = (String)session.getAttribute("sesSign");
   		if(sesSign == null)
   		{
   			
   		}
   		else
   		{
   			%>
   			<!--  <div class="alert alert-success"><%= sesSign%></div> -->
   			<% 
   			session.setAttribute("sesSign", null);
   		}
   %>
   
   <%
   		String seslogin = (String)session.getAttribute("seslogin");
   		if(seslogin == null)
   		{
   			
   		}
   		else
   		{
   			%>
   			<div class="alert alert-danger"><%= seslogin%></div>
   			<% 
   			session.setAttribute("seslogin", null);
   		}
   %>
   
   <%
   		String status = (String)session.getAttribute("status");
   		if(status == null)
   		{
   			
   		}
   		else
   		{
   			%>
   			<div class="alert alert-success"><%= status%></div>
   			<% 
   			session.setAttribute("status", null);
   		}
   %>
  
  <div class="container">
  <div class="row">
  		<div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
    	</div>
    	<div class="col col-lg-8 col-md-6 col-sm-6 col-xs-12">
    		<div class="modal-body" >
        	<div style="border:thin solid black; padding:20px">
        	<h2 style="text-align: center">Login Page</h2>
    			<form action="indexLoginServer.jsp" method="post">
    		
    			<div class="form-group">
    				<div class="col-md-5">
        			<label>Email</label>	
        			<input type="text" name="email" class="form-control">
        			</div>
        		</div>
        	
    			<div class="form-group">
    				<div class="col-md-5">
        			<label>Password</label>
        			<input type="password" name="password" class="form-control">
        			</div>
        		</div>
    		
    			<div class="form-group">
    				<div class="col-md-9">
    				<label></label>
    				<input type="radio" name="radioaction" value="Admin">Admin
    				<input type="radio" name="radioaction" value="Student">Student
    				</div>
    			</div>
    		
    			<div class="form-group">
    				<div class="col-md-9">
        			<button type="submit" class="btn btn-success">Login</button>
        			</div>
        		</div>
    		
    			<div class="form-group">
    				<div class="col-md-9">
        			<a href="enterEmail.jsp" >Forget Password</a>|<a href="SignUp.jsp">Sign Up</a>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>