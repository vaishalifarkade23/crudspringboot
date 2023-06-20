<!-- update  data  -->
<section id="updateview">

 <a href="collection1.jsp">view data using collection</a>
 
 <%
	List list1=(List)session.getAttribute("list");
    if(list1==null)
    {
    	
    }
    else
    {
    	%>
    	
    	<div class="container">
        <form action="#" method="post">
         <table class="table table-bordered table-striped">
		 
            <tr>
                				    <th>Id</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Gender</th>
									<th>Course</th>
									<th>Address</th>
									<th>City</th>
									<th>State</th>
									<th>Contact No.</th>
									<th>Dob</th>
									<th>Email</th>
									<th>Password</th>
									<th>Select</th>	
            </tr>
        <% 
    	Iterator itr1=list1.iterator();
        String id1="";
    	while(itr1.hasNext())
    	{
    	%>
    	<tr>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><%=itr1.next() %></td>
    	<td><a href="dashboard.jsp?id=<%=itr1.next() %>" id="edit">Edit</a></td>
    	</tr>
    	<% 
    	}
    	%>
    	
    	<% 
    }
%>
        
</table>
</form>
</div>
</section>
<section id="edit_form_section">
<%
String id=request.getParameter("id");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
	String sql = "SELECT * FROM attachmentregister WHERE id='"+id+"' "; 
	PreparedStatement pst = con.prepareStatement(sql);
	ResultSet rs = pst.executeQuery();
	
	while(rs.next())
	{
   %>
      <!-- form -->
      
      <form action="updateserver1.jsp" method="post" enctype = "multipart/form-data">
<section class="vh-100" style="background-color: #2779e2;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-9">

        <h1 class="text-white mb-4">Apply for a job</h1>

        <div class="card" style="border-radius: 15px;">
          <div class="card-body">
          
           <div class="row align-items-center pt-4 pb-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Id</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="id" class="form-control form-control-lg" value="<%=rs.getString(1) %>"/>

              </div>
            </div>
          

            <div class="row align-items-center pt-4 pb-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Full name</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="text" name="fullname" class="form-control form-control-lg" value="<%=rs.getString(2) %>"/>

              </div>
            </div>

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Email address</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input type="email" name="email" class="form-control form-control-lg"  value="<%=rs.getString(3) %>" />

              </div>
            </div>

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Password</h6>

              </div>
              <div class="col-md-9 pe-5">

				<input type="text" name="password" class="form-control form-control-lg"  value="<%=rs.getString(4) %>"/>
				
                </div>
            </div>

           
            
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">

                <h6 class="mb-0">Upload CV</h6>

              </div>
              <div class="col-md-9 pe-5">

                <input class="form-control form-control-lg" id="formFileLg" type="file" name="file"   value="<%=rs.getString(6) %>" />
                <div class="small text-muted mt-2">Upload your CV/Resume or any other relevant file. Max file
                  size 50 MB</div>

              </div>
            </div>

            <div class="px-5 py-4">
              <button type="submit" class="btn btn-primary btn-lg">Update</button>
            </div>

          </div>
        </div>

      </div>
    </div>
  </div>
</section>
</form>
   
<% 
    }
}
catch(Exception e)
{
	out.print(e);
	
}
%>











</section>
