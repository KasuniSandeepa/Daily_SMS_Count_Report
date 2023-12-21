<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modle.Account"%>

<%@ page import="Operations.SMSdb"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String accountName = request.getParameter("accountName");

	SMSdb viewData = new SMSdb();
	ArrayList<Account> accounts = viewData.ViewDatabyName(accountName);
	request.setAttribute("accounts", accounts);
	System.out.println("got");

	RequestDispatcher Dispatcher = request.getRequestDispatcher("/View.jsp");
	Dispatcher.forward(request, response);

	//response.sendRedirect("/View.jsp");
	%>
	<script type="text/javascript">
		window.location.href = "http://localhost:8080/Daily_SMS_Report/ View.jsp"
	</script>

</body>
</html>