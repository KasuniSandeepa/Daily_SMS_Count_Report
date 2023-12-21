<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modle.Account"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="Operations.SMSdb"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String date = request.getParameter("date");
	
	if(date==null){
		
		date = "2021-03-02";
	}

	SMSdb db = new SMSdb();
	ArrayList<Account> accounts = db.ViewDatabyDate(date);
	request.setAttribute("accounts", accounts);
	//	request.setAttribute("date", date);

	System.out.println("got");
	application.setAttribute("accounts", accounts);
	application.setAttribute("date", date);

	//	RequestDispatcher Dispatcher = request.getRequestDispatcher("/View2.jsp");
	//	Dispatcher.forward(request, response);
	response.sendRedirect(request.getContextPath() + "/View_2.jsp");

	//response.sendRedirect("/View.jsp");
	%>
	<script type="text/javascript">
		window.location.href = "http://localhost:8080/Daily_SMS_Report/ View_2.jsp"
	</script>

	<script src="text/javascript">
		function getDaysInMonthUTC(month) {
			console.log('Month : ' + month);
			var date = new Date(Date.UTC(2021, month, 1));
			var days = [];
			while (date.getUTCMonth() === month) {
				days.push(new Date(date));
				date.setUTCDate(date.getUTCDate() + 1);
			}
			return days;
		}
	</script>


</body>
</html>