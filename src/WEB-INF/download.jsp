    <%    
      String filename = "enterEmail.jsp";   
      String filepath = "C:/Users/123/workspace/AdminStudentForm/WebContent/";  
      // String filepath = "C:/Users/123/workspace/AdminStudentForm/WebContent/";;
      response.setContentType("APPLICATION/OCTET-STREAM");   
      response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
      
      java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
                
      int i;   
      while ((i=fileInputStream.read()) != -1) {  
        out.write(i);   
      }   
      fileInputStream.close();   
    %>   