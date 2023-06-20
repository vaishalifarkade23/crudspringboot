<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Sign In Form</title>
  </head>
  <body>
  
<!-- Registration Successful -->    
<%
	String sesReg = (String)session.getAttribute("sesReg");
	if(sesReg == null)
	{
		
	}
	else
	{
		%>
			<script type="text/javascript">swal({
				  title: "Good job!",
				  text: "<%=sesReg%>",
				  icon: "success",
				  button: "ok",
				});</script>
		<% 
	}
%>

<%
	String sesSignIn = (String)session.getAttribute("sesSignIn");
	if(sesSignIn == null)
	{
		
	}
	else
	{
		%>
			<script type="text/javascript">Swal.fire({
				  icon: 'error',
				  title: 'Wrong Credential...!!!',
				  text: 'Something went wrong!',
				  footer: '<a href="">Why do I have this issue?</a>'
				})</script>
				
				<div class="alert alert-danger"><%= sesSignIn%></div>
				
		<% 
	}
%>
    
  <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12" style="border:thin solid black; padding:20px">
                        <form id="login-form" class="form" action="newSignInServer.jsp" method="post">
                            <h3 class="text-center text-info">Sign In Form</h3>
                            
                            <div class="form-group">
                                <label for="username" class="text-info">Email/User Name</label><br>
                                <input type="text" name="email" class="form-control">
                            </div>
                            
                            <div class="form-group">
                                <label for="password" class="text-info">Password</label><br>
                                <input type="password" name="password" class="form-control">
                            </div>
                            
                            <div class="form-group">
                                <input type="radio" name="radioaction" value="Admin">Admin
    							<input type="radio" name="radioaction" value="Student">Student
                            </div>
                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                            
                            <div class="form-group">
                                <a href="#">Forget Password</a>|<a href="newRegisterForm.jsp">Sign Up</a>
                            </div>
                            
                        </form>
                    </div>
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