<%@ page import="java.sql.*" %>

<%
    	//int id = Integer.parseInt(request.getParameter("id"));	
    	String[] select = request.getParameterValues("checkboxname");
    	if(select != null && select.length != 0)
    	{
    		//out.println("You have selected : ");
    		for(String s:select)
    		{
    			//out.println(select[i]);
    			try
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
					String sql = "delete from newsigninform where id = '"+s+"'" ;
					PreparedStatement pst = con.prepareStatement(sql);
					int a = pst.executeUpdate();
					if(a>0)
					{
						out.println("You have deleted : "+a+" records.");
					}
				}
				catch(Exception ex)
				{
					out.println("Exception : "+ex);
				}	
    		}
    	}
%> 