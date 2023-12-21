<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="Operations.*"%>
<%@ page import="modle.*"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

	<br>
	<br>
	<div class="container">
		<form action="Chart1.jsp" name="add" method="post">
			<div class="input-group">
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
			</select>&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Show Chart"
				onclick="ShowMonth()">
		</form>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="BarChartMonth.jsp"><input type="button" class="btn btn-warning"
							value="View Bar Chart - Top 20 Clients"></a>
							
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="LineChartByMonth.jsp"><input type="button" class="btn btn-warning"
							value="View Line Chart of All Clients"></a>
							
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<br>
							<a href="LineChartPerYear2.jsp"><input type="button" class="btn btn-warning"
						
							value="View Line Chart Per the  Year"></a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
							<a href="LineChartByYear1.jsp"><input type="button" class="btn btn-warning"
						
							value="View Line Chart By the  Year"></a>
</div>


		<%
			Gson gsonObj = new Gson();
		Map<Object, Object> map = null;
		List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
		String dataPoints = null;
		String dataPoints_1 = null;
		String Month = null;

		String xVal, yVal;
		String xVal1, yVal1;

		String monthNumber = request.getParameter("month");

		SMSdb db = new SMSdb();
		ArrayList<Account> accounts = db.ViewDatabyMonthlyChart(monthNumber);
		//ArrayList<Account> accounts_1 = db.ViewDatabyDatePerMonthChart(monthNumber);

		String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "Sepetember", "October",
				"November", "December"};
		//Month = months[Integer.parseInt(monthNumber)];

		for (Account value : accounts) {

			String accountName = value.getAccountName();
			int MsgCount = value.getMsgCount();

			xVal = accountName;
			yVal = String.valueOf(MsgCount);

			map = new HashMap<Object, Object>();
			map.put("label", xVal);
			map.put("y", Double.parseDouble(yVal));
			list.add(map);
			dataPoints = gsonObj.toJson(list);
			Month = gsonObj.toJson(months[Integer.parseInt(monthNumber) - 1]);
		}
		%>


		<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		<br>

	</div>
	<script type="text/javascript">
		window.onload = function() {
	<%if (dataPoints != null) {%>
		var chart = new CanvasJS.Chart("chartContainer", {
				animationEnabled : true,
				exportEnabled : true,
				title : {
					text : "Pie Chart for Month   " +
	<%out.print(Month);%>
		},
				data : [ {
					type : "pie",
					indexLabel : "{label} {x}%",//change type to bar, line, area, pie, etc
					dataPoints :
	<%out.print(dataPoints);%>
		} ]
			});
			chart.render();
	<%}%>
		}

		function showMonth() {

			var monthNumber = document.getElementById("monthNumber").value;

			document.write("_$ta" + monthNumber + "_$tag");
		}
	</script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<footer class="footer text-faded text-center py-5"
		style="background-color: #333">
		<div
			style="text-align: left; margin-top: -2.2%; padding-left: 0.5%; color: #FFF">
			<h3 class="m-0 small">mobiOs Private Limited</h3>
			<h3 class="m-0 small">12,Ridgeway Place,</h3>
			<h3 class="m-0 small">Colombo 04,</h3>
			<h3 class="m-0 small">Srilanka</h3>

		</div>

		<div class="container" style="margin-top: -2.5%; color: #FFF">
			<p class="m-0 small">&copy; mobiOs Private Limited All Rights
				Reserved</p>
		</div>

		<div
			style="text-align: right; margin-top: -3.5%; padding-right: 1%; color: #FFF">
			<h3 class="m-0 small">+94 114366998</h3>
		<h3 class="m-0 small">E: Info@mobios.lk</h3>
		</div>

	</footer>
</body>
</html>
