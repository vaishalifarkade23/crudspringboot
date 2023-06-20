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
	int id1=0;
	if(session.getAttribute("id")!=null)
	id1=(Integer)session.getAttribute("id");
	//int id=Integer.parseInt(id1);
	String resp2=(String)session.getAttribute("resp2");
	String resp1=(String)session.getAttribute("resp1");
	if(resp2!=null){
	%>
	<script>
	swal({
		  title: "Good job!",
		  text: "<%=resp2%>",
		  icon: "success",
		  button: "ok",
		});
	</script>
		<% 
	
	}
	if(resp1!=null){
	%>
	<script>
	swal({
		  title: "Failed!",
		  text: "<%=resp1%>",
		  icon: "error",
		  button: "ok",
		});
	</script>
		<% 
	session.invalidate();	
	}
%>
    
<form class="form-horizontal" action="newRegistrationServer.jsp">
<fieldset>

<!-- Form Name -->
<legend>Register Yourself</legend>
<!-- Id -->
<div class="form-group">
  <label class="col-md-4 control-label">Id</label>  
  <div class="col-md-4">
  <input type="text" class="form-control" name="id" value="<%=id1%>">
  <a href="generate.jsp"><button type="button" class="form-control btn btn-danger">Generate</button></a>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="fname">First Name</label>  
  <div class="col-md-4">
  <input id="fname" name="fname" type="text" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="lname">Last Name</label>  
  <div class="col-md-4">
  <input id="lname" name="lname" type="text" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="email">Email</label>  
  <div class="col-md-4">
  <input id="email" name="email" type="text" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="password">Password</label>
  <div class="col-md-4">
    <input id="password" name="password" type="password" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="save"></label>
  <div class="col-md-8">
    <button id="save" name="save" class="btn btn-success">Register</button>
    <button id="clear" name="clear" class="btn btn-danger">Reset</button>
  </div>
</div>

</fieldset>
</form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>