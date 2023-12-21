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

	SMSdb db = new SMSdb();
	String MsgCount = db.TotalMsgsPerDay(date);

	System.out.println("msggggg" + MsgCount);

	//request.setAttribute("MsgCount", MsgCount);
	//request.setAttribute("date", date);

	System.out.println("got");
	application.setAttribute("MsgCount", MsgCount);
	application.setAttribute("date", date);

	//RequestDispatcher Dispatcher = request.getRequestDispatcher("/View3.jsp");
	//Dispatcher.forward(request, response);

	response.sendRedirect(request.getContextPath() + "/index.jsp");
//	response.sendRedirect(request.getContextPath() + "/dashboard1.jsp");
	%>
	<script type="text/javascript">
		window.location.href = "http://localhost:8080/Daily_SMS_Report/ index.jsp"
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