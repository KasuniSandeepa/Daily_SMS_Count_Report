<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.io.*"%>
  <%@ page import="modle.*"%>
  <%@ page import="Operations.*"%>
  <%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html>
<!-- Not used -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

	SMSdb db = new SMSdb();
	Gson gson = new Gson();
	response.setContentType("application/json");
//	PrintWriter out = response.getWriter();
	out.println(gson.toJson(db.ViewDatabyMonthly("2")));
	


%>

</body>
</html>