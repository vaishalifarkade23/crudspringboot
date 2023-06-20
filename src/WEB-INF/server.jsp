<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String name="";
String email="";
String pass="";
String address="";
//int gender=0;
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
						//out.println("uploaded successfully 1");                
					}
						if((item.getFieldName()).equalsIgnoreCase("fullname")){
							name=item.getString();
							//out.println("uploaded successfully 2");  
						}
						if((item.getFieldName()).equalsIgnoreCase("email")){
							email=item.getString();
							//out.println("uploaded successfully 3");  
						}
						if((item.getFieldName()).equalsIgnoreCase("password")){
							pass=item.getString();
							//out.println("uploaded successfully 4");  
						}
						 if((item.getFieldName()).equalsIgnoreCase("address")){
							address=item.getString();
							//out.println("uploaded successfully 5");  
						}
						 /*
						if((item.getFieldName()).equalsIgnoreCase("gender")){
							gender=Integer.parseInt(item.getString());
							//out.println("uploaded successfully 6");  
						} */
					}
                try{
                	Class.forName("com.mysql.jdbc.Driver");
                	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
                	String sql="insert into attachmentregister(FullName,EmailAddress,Password,Address,UploadCV)value('"+name+"','"+email+"','"+pass+"','"+address+"','"+fname+"')";
                	PreparedStatement pst=con.prepareStatement(sql);
                	int i=pst.executeUpdate();
                	if(i!=0){
                		session.setAttribute("resp", "Data uploaded successfully");
                        response.sendRedirect("attachmentRegister.jsp");
                	}
                }catch(Exception e){
                	out.println(e);
                }
                
			}catch(Exception ex)
			{
				out.println("Exception : "+ex);
			}
	}


%>
</body>
</html>