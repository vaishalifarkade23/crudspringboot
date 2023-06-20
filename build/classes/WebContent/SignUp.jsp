<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>SignUp</title>
  </head>
  <body>
   
   <!-- email already exit -->
    <%
		
		String sesReg1=(String)session.getAttribute("sesReg1");
		if(sesReg1!=null)
		{
			%>
			<script>
			swal({
				  title: "Failed!",
				  text: "<%=sesReg1%>",
				  icon: "error",
				  button: "ok",
				});
			</script>
			<div class="alert alert-danger"><%= sesReg1%></div>
			<% 
			session.invalidate();	
		}
	 %>
   
   <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Register Form</div>
                        <div class="card-body">
                            <form action="signUpServer.jsp" method="post">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Full Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="fullname" class="form-control" name="fullname">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">E-Mail</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email" class="form-control" name="email">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" id="user_name" class="form-control" name="password">
                                    </div>
                                </div>
				
								<div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">User Type</label>
                                    <div class="col-md-6">
                                        <select name="comboaction" class="form-control">
        									<option value="Admin">Admin</option>
        									<option value="Student">Student</option>
      									</select>
                                    </div>
                                </div>
                               
                               <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <input type="radio" name="gender" value=0>Male
    									<input type="radio" name="gender" value=1>Female
                                    </div>
                                </div>
                               
                               	<div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-success">Register</button>
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