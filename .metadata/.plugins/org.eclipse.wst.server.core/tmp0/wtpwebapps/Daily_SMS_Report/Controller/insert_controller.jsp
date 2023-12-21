<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Operations.SMSdb"%>
    
      <%@ page  import="java.util.Iterator"%>
   
    <%@ page  import="java.util.HashMap"%>
      <%@ page  import="java.util.List"%>
      <%@ page  import="java.util.Map"%>
     <%@ page import="Operations.FileReader"%>
      <%@ page import="java.util.LinkedHashMap"%>
        <%@ page import="java.io.File" %>
         <%@ page import="java.io.FileInputStream" %>
     

     
     <%@ page  import="java.util.Set"%>
    <%@ page  import="java.io.PrintWriter"%>
      <%@ page   import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
      <%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>


     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String pathName = (String)request.getAttribute("path");
	 
	out.println("PathNameee : " +pathName);
    
	

	
	FileReader fileReader = new FileReader();
    LinkedHashMap<String,	Integer> hmap = FileReader.readData(pathName);
    
    Set<Map.Entry<String,Integer>> mySet = hmap.entrySet();
    String _date = request.getParameter("date");  
    
    for(Map.Entry<String,Integer> val : mySet){
    	
    	String accountName = val.getKey();
    	int msgCount = val.getValue();
    	
    	if(!(accountName.equals("Account Name") ||accountName.equals("SMS Count")) ){
    	
    	SMSdb insertData = new SMSdb();
    	insertData.InsertValue( accountName , msgCount ,  _date);
    	
    }
    }
%>

<script type="text/javascript">
window.location.href="http://localhost:8080/Daily_SMS_Report/index.jsp"
</script>

</body>
</html>