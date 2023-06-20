<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.sql.*" %>
<%
	String path = "C:\\Users\\123\\workspace\\AdminStudentForm\\WebContent\\image"; 
	String Email = (String) session.getAttribute("lemail");
	if (ServletFileUpload.isMultipartContent(request)) 
	{
			try
			{

				String fname = null;
				String fsize = null;
				String ftype = null;
                String fpath=null;
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						fname = new File(item.getName()).getName();
						fsize = new Long(item.getSize()).toString();
						ftype = item.getContentType();
						item.write(new File(path + File.separator+fname));
						
						try{
		                	Class.forName("com.mysql.jdbc.Driver");
		                	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
		                	String sql="update adminregtable set image = '"+fname+"' where email = '"+Email+"' ";
		                	PreparedStatement pst=con.prepareStatement(sql);
		        			int i = pst.executeUpdate();
		        			if(i>0)
		        			{
		        				session.setAttribute("sesprofile", "Image added successfully");
		        				response.sendRedirect("index.jsp");
		        			}
		        			else
		        			{
		        				session.setAttribute("sesprofile", "Image not added");
		        				response.sendRedirect("index.jsp");
		        			}
		                }catch(Exception e){
		                	out.println(e);
		                }
					                          
					}
					
					session.setAttribute("message", "File Uploaded Success!!!");
					session.setAttribute("message1", " ");
					RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
					rd.forward(request, response);
                
                }
			}catch(Exception ex)
			{
				out.println(" "+ex.getMessage());
			}
	}


%>