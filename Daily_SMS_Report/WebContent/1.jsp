<%@page import="javax.script.Invocable"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="javax.script.ScriptEngine"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Operations.SMSdb"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="modle.Data"%>
<%@ page import="modle.Account"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Database.DBConnection"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript">
	function getName() {

		var accountName = localStorage.getItem("name1");
		console.log("jjjjjjjjjj" + accountName);
		//window.location = "1.jsp?"+name;

		//document.getElementById("accountName").value = accountName;
		//location.assign("1.jsp?name11="+accountName);
		//window.stop();
		//window.location.reload(false);

	}
</script>
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

<!--<input type= text id="accountName" name= "name11">-->


<%
	//String accountName = (String)inv.invokeFunction("getName()");;
String accountName = request.getParameter("name11");
//String[] array = request.getParameter("name11");
String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "Sepetember", "October",
		"November", "December"};

//String accountName = "<script>document.writeln(accountName )</script>";
TreeMap<String, List<Data>> all = new TreeMap<>();
SMSdb db = new SMSdb();
String month = request.getParameter("month");
String year = request.getParameter("year");
ArrayList<String> dates = new ArrayList();
ArrayList<String> totalCounts = new ArrayList();
String totalCountPermonth = "0";

if (month == null) {

	month = "1";
}
if (year == null) {
	year = "2021";
}

ArrayList<String> accountNames = new ArrayList();
ArrayList<String> newAccountNames = new ArrayList();
ArrayList<Account> accNames = new ArrayList();

if (month == null) {
	accNames = SMSdb.ViewDatabyMonthly("1");
	totalCountPermonth = db.TotalMsgsPerMonth("1");

} else {

	accNames = SMSdb.ViewDatabyMonthly(month);
	totalCountPermonth = db.TotalMsgsPerMonth(month);
}

for (Account values : accNames) {

	accountNames.add(values.getAccountName());
	//System.out.println("rrrrr"+values.getAccountName());

}

for (String values : accountNames) {

	if (!newAccountNames.contains(values)) {
		newAccountNames.add(values);
	}

}

Calendar cal = Calendar.getInstance();
cal.set(Calendar.MONTH, (2));
cal.set(Calendar.YEAR, Integer.parseInt(year));
cal.set(Calendar.DAY_OF_MONTH, 1);
int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
Date dateobj = new Date();

//Get the date of current date
DateFormat df1 = new SimpleDateFormat("dd");
String today = df1.format(dateobj);

//Get the date of current date and month and year
DateFormat df2 = new SimpleDateFormat("yyyy-MM");
String today1 = df2.format(dateobj);

DateFormat df4 = new SimpleDateFormat("yyyy-MM-dd");
String today4 = df2.format(dateobj);

SimpleDateFormat df = new SimpleDateFormat("dd");
System.out.println(df.format(cal.getTime()));
String date = df.format(cal.getTime());

SimpleDateFormat df6 = new SimpleDateFormat("M");
System.out.println(df6.format(cal.getTime()));
String _MonthNumber = df6.format(cal.getTime());
String _MonthName = months[(Integer.parseInt(_MonthNumber) - 1)];
System.out.println("Monthhhhhhh" + _MonthName);

SimpleDateFormat df3 = new SimpleDateFormat("yyyy-MM");
System.out.println(df3.format(cal.getTime()));
String date1 = df3.format(cal.getTime());

System.out.println("Current Date : " + today);
System.out.println("Current Date dddd : " + today1);
System.out.println("Current Date dddd : " + today4);
System.out.println("Selected Date : " + date);
System.out.println("Selected Date1 : " + date1);

Gson gsonObj = new Gson();
Map<Object, Object> map = null;
List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

for (int i = 0; i < Integer.parseInt(today); i++) {

	ArrayList<Account> accounts = db.ViewDatabyMonthDate1("3", year, String.valueOf(i + 1));
	System.out.println("I am here");
	cal.set(Calendar.DAY_OF_MONTH, i + 1);
	if (accounts.isEmpty()) {

		map = new HashMap<Object, Object>();
		map.put("label", df.format(cal.getTime()));
		map.put("y", 0);
		list.add(map);
		System.out.println(df.format(cal.getTime()) + "0");
	} else {
		for (Account value : accounts) {
	if (value.getAccountName().equals(accountName)) {
		map = new HashMap<Object, Object>();
		map.put("label", df.format(cal.getTime()));
		map.put("y", value.getMsgCount());
		list.add(map);
		System.out.println(df.format(cal.getTime()) + value.getMsgCount());
	}
		}
	}

}

String dataPoints = gsonObj.toJson(list);
String name = gsonObj.toJson(accountName);
%>
<script type="text/javascript">
	window.onload = function() {

		getName();
		//	var accountName = localStorage.getItem("name1");
		var accountName = localStorage.getItem("name1");

		//window.location.replace("1.jsp?name11="+accountName);

		//console.log(accountName);

		var chart = new CanvasJS.Chart("chartContainer", {
			theme : "light2",
			title : {
				text :
<%out.print(name);%>
	},
			axisX : {
				title : "Date"
			},
			axisY : {
				title : "Amount of Messages",
				includeZero : true
			},
			data : [ {
				type : "line",
				yValueFormatString : "#,##0 messages",
				dataPoints :
<%out.print(dataPoints);%>
	} ]
		});
		chart.render();

	}
</script>
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
						<li class="l">
						<li class="l"><a
							class="nav-link text-uppercase text-expanded" id="active"
							href="View.jsp">View</a></li>
						</li>
						</li>


						<div class="col-md-3.0 float-right"></div>
					</ul>

				</div>
			</div>
	</div>
	</nav>
	</div>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<br>
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
