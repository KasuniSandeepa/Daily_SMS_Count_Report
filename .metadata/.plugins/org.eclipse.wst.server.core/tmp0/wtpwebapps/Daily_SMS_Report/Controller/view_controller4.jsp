<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modle.Account"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="Operations.SMSdb"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String monthNumber = request.getParameter("month");

	//ArrayLis for dates according to the selected month
	ArrayList<String> dates = new ArrayList();
	ArrayList<String> accountNames = new ArrayList();
	ArrayList<String> newAccountNames = new ArrayList();

	SMSdb db = new SMSdb();
	ArrayList<Account> accounts = db.ViewDatabyMonthly(monthNumber);

	ArrayList<Integer> counts = new ArrayList();
	//ArrayList<String , Integer> countsAccount = new ArrayList();
	ArrayList<Account> accountsCount = new ArrayList();

	for (Account values : accounts) {

		accountNames.add(values.getAccountName());
		System.out.println("ggggg" + values);

	}

	for (String values : accountNames) {

		if (!newAccountNames.contains(values)) {
			newAccountNames.add(values);
		}

	}
	try {

		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, (Integer.parseInt(monthNumber) - 1));
		cal.set(Calendar.DAY_OF_MONTH, 1);
		int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(df.format(cal.getTime()));

		for (int i = 0; i < maxDay; i++) {

			cal.set(Calendar.DAY_OF_MONTH, i + 1);
			System.out.println(df.format(cal.getTime()));

			/*for(String values : newAccountNames){
		
			
			counts.add(db.ViewData(df.format(cal.getTime()), values));
			System.out.println(db.ViewData(df.format(cal.getTime()), values));
			
			}*/

			for (Account value : accounts) {

		if (value.getDate().equals(df.format(cal.getTime()))) {
			System.out.println("Equalll");
			Account account = new Account(value.getAccountName(), df.format(cal.getTime()), value.getMsgCount());
			accountsCount.add(account);
		} else {

			System.out.println("Not");
			Account account = new Account(value.getAccountName(), df.format(cal.getTime()), 0);

			accountsCount.add(account);

		}

			}

			dates.add(df.format(cal.getTime()));
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	ArrayList<Account> newAccountCount = accountsCount;
	//	newAccountCount.add(accountsCount.get(0));

	/*	try{
		for(Account value : accountsCount){
			
			for(Account var : newAccountCount){
		
		if(value.getAccountName().equals(var.getAccountName()) && value.getDate().equals(var.getDate())){
			
			System.out.println("Do nothing");
			newAccountCount.remove(var);
		}
		else{
			
		//	newAccountCount.add(value);
		}
			}
			
		/*	Iterator i = accountsCount.iterator();
			
			while(i.hasNext()){
		Account a1 = (Account)i.next();
		if(a1.getAccountName().equals(value.getAccountName()) && a1.getDate().equals(value.getDate())){
			accountsCount.remove(a1);
		}
			}*/

	//}
	//	}catch(Exception e){
	//	e.printStackTrace();

	System.out.println("new1" + accountsCount.toString());
	System.out.println(accountsCount.toString());

	System.out.println(newAccountCount.toString());

	for (Integer values : counts) {

		System.out.println("vvvvvvvvvvvvvvvvv" + values);
	}

	request.setAttribute("dates", dates);
	request.setAttribute("counts", counts);
	request.setAttribute("accountNames", newAccountNames);
	request.setAttribute("accountsCount", accountsCount);
	//request.setAttribute("newAccountCount", newAccountCount);

	//	request.setAttribute("newAccountsCount", newAccountsCount);
	//request.setAttribute("accountsCount1", accountsCount);

	//request.setAttribute("messages", messages);

	System.out.println("got");

	RequestDispatcher Dispatcher = request.getRequestDispatcher("/View4.jsp");
	Dispatcher.forward(request, response);

	//response.sendRedirect("/View.jsp");
	%>
	<script type="text/javascript">
		window.location.href = "http://localhost:8080/Daily_SMS_Report/ View.jsp"
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