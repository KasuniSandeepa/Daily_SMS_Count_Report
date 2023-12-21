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
		//String[] months = {"January" , "February" ,"March" , "April" , "May" , "June" , "July" , "August" , "Sepetember" , "October" , "November" , "December"};
	String monthNumber = request.getParameter("month");

	SMSdb insertData = new SMSdb();
	ArrayList<Account> accounts = SMSdb.ViewDatabyMonthly(monthNumber);
	request.setAttribute("accounts", accounts);
	//System.out.println("got");

	application.setAttribute("accounts", accounts);

	//response.sendRedirect("/View.jsp");
	//response.sendRedirect(request.getContextPath() + "/View.jsp");
	response.sendRedirect(request.getContextPath() + "/View_1.jsp");
	//RequestDispatcher Dispatcher = request.getRequestDispatcher("/View.jsp");
	//Dispatcher.forward(request, response);

	//response.sendRedirect("/View.jsp");
	%>
	<script type="text/javascript">
		window.location.href = "http://localhost:8080/Daily_SMS_Report/ View_1.jsp"
	</script>

</body>
</html>