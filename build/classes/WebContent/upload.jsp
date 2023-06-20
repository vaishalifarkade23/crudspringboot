<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%
	String path = "E:\\upload"; 
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