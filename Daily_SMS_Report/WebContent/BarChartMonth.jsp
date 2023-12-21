<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page import="Operations.SMSdb"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="modle.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Database.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Line Chart Month</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	
<style>
.l {
	float: left;
}

.u {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
	width: 100%;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 12px 14px;
	text-decoration: none;
	width: 100%;
}

li a:hover {
	background-color: #111;
}

#active {
	background-color: #FF4D4D;
	height: 43px;
}
</style>

</head>
<body>
<div style="background-color: #333">
		<h1 class="site-heading text-center text-white d-none d-lg-block">
			<!--<span class="site-heading-upper text-primary mb-3">A Free Bootstrap 4 Business Theme</span>-->
			<span class="site-heading-lower" style="color: #FF0000">mobi<i>O</i>s
				Private Limited
			</span>
		</h1>

		<nav style="position: relative" class="n"
			style="width:100% ;overflow:auto">
			<div class="container" class="width:100%">
				<a
					class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
					href="#">Start Bootstrap</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div id="navbarResponsive">
					<hr style="border: 2px solid white; width: 100%"></hr>
					<ul class="u">
						<li class="l"><a
							class="nav-link text-uppercase text-expanded" href="index.jsp">Home
						</a></li>
						<li class="l"><a
							class="nav-link text-uppercase text-expanded" id="active"
							href="MainMenu.jsp">View</a></li>
						</li>
				</div>
				</ul>

			</div>
	</div>
	</div>
	</nav>
	</div>
	
	<br><br>
	<div class="container">
		<form action="BarChartMonth.jsp" name="add" method="post">
		
			<div class="input-group">

				Select the Year<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp; <select
					id="ddlYears" name="year">
					
					
					</select> &nbsp;&nbsp;&nbsp;&nbsp; 
			Select the Month<span class="input-group-addon"><i
				class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp;<select
				name="month" id="monthNumber1">
				<option value="1">January</option>
				<option value="2">February</option>
				<option value="3">March</option>
				<option value="4">April</option>
				<option value="5">May</option>
				<option value="6">June</option>
				<option value="7">July</option>
				<option value="8">August</option>
				<option value="9">September</option>
				<option value="10">October</option>
				<option value="11">November</option>
				<option value="12">December</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Show Chart">
		</form>
</div>

<%
		//ArrayList<Account> accounts_1 = db.ViewDatabyDatePerMonthChart(monthNumber);
		
ArrayList<Account> _AccountDetails = new ArrayList<>();

		boolean isSuccess;
		Connection connection;
		Statement statement;
		ResultSet resultSet;
 
		

		String[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "Sepetember",
		"October", "November", "December" };

		String Month = null;
		Gson gsonObj = new Gson();
		Map<Object, Object> map = null;
		List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

		String year = request.getParameter("year");
		String monthNumber = request.getParameter("month");
		if(year==null){
			year="2021";
		}
		if(monthNumber==null){
			monthNumber = "3";
		}
		Month = months[Integer.parseInt(monthNumber) - 1];
		
		try {

			// Call to the database connection
		connection = DBConnection.GetConnection();


			statement = connection.createStatement();

			// Declare the sql statement for retrieve all employee details
		//	String _Sql = "select * from  totalcountmonthlychart where Month= ' " + monthNumber + " ' order by  SumMsgCount desc LIMIT 20";
			String _Sql = "select * from  totalcountmonthlychart where Month= ' " + monthNumber + " ' and YEAR = '" +year + "'order by  SumMsgCount desc LIMIT 20";
			// Execute the sql statement
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				// Succesfully excuted the sql statement
				System.out.println("in in");

				do {
					System.out.println("hhhhhhhhhhh");
					// int id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(1);
					// String Date = resultSet.getString(3);
				
					int _MsgCount = resultSet.getInt(2);
				

					Account account = new Account(_AccountName, _MsgCount);// Store the results in

					_AccountDetails.add(account);// Store details in the arraylist

				}while(resultSet.next()); // Get the employee details and row by row
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

//	SMSdb db = new SMSdb();
	//ArrayList<Account> accounts = db.ViewDatabyMonthlyChart(monthNumber);
//		//ArrayList<Account> accounts = db.ViewDatabyMonthlyChart(monthNumber, year);

		for (Account value :   _AccountDetails) {

			String accountName = value.getAccountName();
			int MsgCount = value.getMsgCount();
			System.out.println( accountName +",,,,,"+  MsgCount);

			map = new HashMap	<Object, Object>();map.put("label", accountName);map.put("y", MsgCount);list.add(map);

		}

		String dataPoints = gsonObj.toJson(list);
		String monthName = gsonObj.toJson(Month);
	%>
	
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	
	<script>
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light10",
	title: {
		text: 	"Bar Chart of top 20 clients in " + <%out.print(monthName);%>
	},
	axisX: {
		title: "Account Name"
	},
	axisY: {
		title: "Amount of Messages",
		includeZero: true
	},
	data: [{
		type: "bar",
		yValueFormatString: "#,##0 messages",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();

var ddlYears = document.getElementById("ddlYears");

//Determine the Current Year.
var currentYear = (new Date()).getFullYear();

//Loop and add the Year values to DropDownList.
for (var i = 2017; i <= currentYear; i++) {
	var option = document.createElement("OPTION");
	option.innerHTML = i;
	option.value = i;
	ddlYears.appendChild(option);
}
};
 



</script>

</body>
</html>