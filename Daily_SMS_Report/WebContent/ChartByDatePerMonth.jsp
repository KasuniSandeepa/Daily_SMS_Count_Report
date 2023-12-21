<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
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
							class="nav-link text-uppercase text-expanded" 
							href="index.jsp">Home </a></li>
						<li class="l">
							<a
							class="nav-link text-uppercase text-expanded" id="active"
							href="MainMenu.jsp">View</a>
						</li>


						<div class="col-md-3.0 float-right">
							<!-- Search Bar for search by Mobile Number -->
							<form action="searchByMobile" method="get">

								<div class="input-group">
									<input type="search" name="insertMobile" class="form-control"
										placeholder="Search by Mobile" style="height: 43px"> <span
										class="input-group-prepend">
										<button type="submit" class="btn btn-primary"
											style="background-color: #FF4D4D; border: none;">Search</button>&nbsp;&nbsp;
									</span>

									<!-- Search Bar for search by NIC number -->
							</form>
							<form action="searchByNic" method="post">

								<div class="input-group">
									<input type="text" name="insertNic" class="form-control"
										placeholder="Search by NIC" style="height: 43px"> <span
										class="input-group-prepend">
										<!--<input type="button" class="btn btn-primary"
											style="background-color: #FF4D4D; border: none;" onClick="CheckNicforSearch(document.add.insertNic);" value="Confirm">-->
											<input type="submit" class="btn btn-primary" id="btnNicSearch"
											style="background-color: #FF4D4D; border: none;"  value="Search">&nbsp;&nbsp;
									</span>
							</form>


						</div>
					</ul>

				</div>
			</div>
	</div>
	</nav>
	</div>

<br> <br>
    <form action="Chart1.jsp"  name="add" method="post">
	 Select the Month<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp;<select name="month"
								 id="monthNumber1">
								<option value="1">January</option>
								<option value="2">February</option>
								<option value="3">March</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Show Chart" onclick="ShowMonth()">
	</form>
	
	

<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
String dataPoints_1 = null;
String Month = null;
 

	
	String xVal, yVal;
	String xVal1, yVal1;
	
	String monthNumber = request.getParameter("month");
	
	
	
	SMSdb db = new SMSdb();
	//Map<String , List> accounts = db.TotalMsgsPerDayAll(monthNumber);
	//ArrayList<Account> accounts_1 = db.ViewDatabyDatePerMonthChart(monthNumber);
	ArrayList<Account> accounts = db.ViewDatabyDatePerMonthChart(monthNumber);
	
	
	
    String[] months = {"January" , "February" ,"March" , "April" , "May" , "June" , "July" , "August" , "Sepetember" , "October" , "November" , "December"};
	//Month = months[Integer.parseInt(monthNumber)];
	
	for(Account value : accounts){
		
		String accountName = value.getDate();
		int MsgCount = value.getMsgCount();
		
		xVal = accountName;
		yVal = String.valueOf(MsgCount);
		
		map = new HashMap<Object,Object>(); 
		map.put("label", xVal); 
		map.put("y", Double.parseDouble(yVal)); 
		list.add(map);
		dataPoints = gsonObj.toJson(list);
		Month = gsonObj.toJson(months[Integer.parseInt(monthNumber)-1]);
	}
	
	
	
	
	%>


<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<br>
<div id="chartContainer1" style="height: 370px; width: 100%;"></div>

<script type="text/javascript">
window.onload = function(){ 
 
	
	
	
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Pie Chart for Month   " + <%out.print(Month);%>
	},
	data: [{
		type: "pie", 
		indexLabel: "{label} {x}%",//change type to bar, line, area, pie, etc
		dataPoints:<%out.print(dataPoints);%>
		
		
	}]
});
chart.render();
<% } %> 
}



function showMonth(){
	
	var monthNumber = document.getElementById("monthNumber").value;
	
	document.write("<h3>"+monthNumber+"</h3>");
}
</script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>                   