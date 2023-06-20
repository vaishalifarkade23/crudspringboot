<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Register Form</title>
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
    
<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Register</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validate()" action="newRegisterServer.jsp" method="">
                            
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Full Name</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="fullname" id="fullname">
                                    </div>
                                    <small class="text-danger" id="chkfullname"></small>
                                </div>
								
                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="email" id="email">
                                    </div>
                                    <small class="text-danger" id="chkemail"></small>
                                </div>

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">User Name</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="username" id="username">
                                    </div>
                                    <small class="text-danger" id="chkusername"></small>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" class="form-control" name="password" id="password">
                                    </div>
                                    <small class="text-danger" id="chkpasswoed"></small>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
                                    <div class="col-md-6">
                                        <input type="password" class="form-control" name="confirmpass" id="confirmpass">
                                    </div>
                                    <small class="text-danger" id="chkconfpwd"></small>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Select Gender</label>
                                    <div class="col-md-6">
                                        <select name="combogender" class="form-control" id="combogender">
                                        	<option value="select gender">Select Gender</option>
                                        	<option value="Male">Male</option>
                                        	<option value="Female">Female</option>
                                        </select>
                                    </div>
                                    <small class="text-danger" id="chkgender"></small>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Select City</label>
                                    <div class="col-md-6">
                                        <select name="combocity" class="form-control" id="combocity">
                                        	<option value="select city">Select City</option>
                                        	<option value="Amravati">Amravati</option>
                                        	<option value="Nashik">Nashik</option>
                                        	<option value="Solapur">Solapur</option>
                                        	<option value="Kolhlapur">Kolhlapur</option>
                                        	<option value="Nagpur">Nagpur</option>
                                        </select>
                                    </div>
                                    <small class="text-danger" id="chkcity"></small>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Registered As</label>
                                    <div class="col-md-6">
                                        <select name="comboreg" class="form-control" id="comboreg">
                                        	<option value="select user type">Select User Type</option>
                                        	<option value="Admin">Admin</option>
                                        	<option value="Student">Student</option>
                                        </select>
                                    </div>
                                    <small class="text-danger" id="chkusertype"></small>
                                </div>
                                
  								<div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Address</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="address" id="address">
                                    </div>
                                    <small class="text-danger" id="chkaddress"></small>
                                </div>

                                <div class="col-md-6 offset-md-4">
                                 	<button type="submit" class="btn btn-primary">
                                        Register
                                        </button>
                                    </div>
                                
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</main>

<script type="text/javascript">
	function validate()
	{
		var fullname = document.getElementById('fullname').value;
		var letters = /^[A-Za-z\s]+$/;
		
		var email = document.getElementById('email').value;
		var emailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		
		var Username = document.getElementById('username').value;
		var Usernameletters = /^[A-Za-z\s]+$/;
		
		var password = document.getElementById('password').value;
		var pwdformat=  /^[A-Za-z]\w{7,14}$/;
		
		var conformpwd = document.getElementById('confirmpass').value;
		
		var gender = document.getElementById('combogender').value;
		
		var city = document.getElementById('combocity').value;
		
		var userType = document.getElementById('comboreg').value;
		
		var address = document.getElementById('address').value;
		var addressletters = /^[0-9a-zA-Z]+$/;
		
		if(fullname == "" || fullname == null)
		{
			document.getElementById('chkfullname').innerHTML = "*Full name is required";
			document.getElementById('fullname').focus();
			return false;
		}
		else if(!fullname.match(letters))
		{
			document.getElementById('chkfullname').innerHTML = "*Alpha numeric value should be in letters";
			document.getElementById('fullname').focus();
			return false;
		}
		else if(email == "" || email == null)
		{
			document.getElementById('chkemail').innerHTML = "*Email id is Required";
			document.getElementById('email').focus();
			return false;
		}
		else if(!email.match(emailformat))
		{
			document.getElementById('chkemail').innerHTML = "*Please enter valid email id";
			document.getElementById('email').focus();
			return false;
		}
		else if(Username == "" || Username == null)
		{
			document.getElementById('chkusername').innerHTML = "*User name required";
			document.getElementById('username').focus();
			return false;
		}
		else if(!Username.match(Usernameletters))
		{
			document.getElementById('chkusername').innerHTML = "*Alpha numeric value should be in letters";
			document.getElementById('username').focus();
			return false;
		}
		else if(password == "" || password == null)
		{
			document.getElementById('chkpasswoed').innerHTML = "*Password is Required";
			document.getElementById('password').focus();
			return false;
		}
		else if(!password.match(pwdformat))
		{
			document.getElementById('chkpasswoed').innerHTML = "*Please enter valid password";
			document.getElementById('password').focus();
			return false;
		}
		else if(conformpwd == "" || conformpwd == null)
		{
			document.getElementById('chkconfpwd').innerHTML = "*Confirm password is Required";
			document.getElementById('confirmpass').focus();
			return false;
		}
		else if(password != conformpwd)
		{
			document.getElementById('chkconfpwd').innerHTML = "*Password are not same";
			return false;
		}
		else if(gender == "select gender")
		{
			//alert(Please select state);
			document.getElementById('chkgender').innerHTML = "*Please select gender";
			return false;
		}
		else if(city == "select city")
		{
			//alert(Please select state);
			document.getElementById('chkcity').innerHTML = "*Please select city";
			return false;
		}
		else if(userType == "select user type")
		{
			//alert(Please select state);
			document.getElementById('chkusertype').innerHTML = "*Please select user type for registration form";
			return false;
		}
		else if(address == "" || address == null) 
		{
			document.getElementById('chkaddress').innerHTML = "*Please enter address";
			document.getElementById('address').focus();
			return false;
		}
		/*else if(!address.match(addressletters)) 
		{
			document.getElementById('chkaddress').innerHTML = "*Enter appropriate Address!";
			document.getElementById('address').focus();
			return false;
		}*/
		else
		{
			return true;
		}
		
	}
</script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>