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
							<li class="l"><a
							class="nav-link text-uppercase text-expanded" id="active"
							href="MainMenu.jsp">View</a></li>
						</li>
						</li>


						<div class="col-md-3.0 float-right">
						
							


						</div>
					</ul>

				</div>
			</div>
	</div>
	</nav>
	</div>

<br> <br>
<div class="container">
    <form action="ChartbyDate.jsp"  name="add" method="post">
	  Select the Date<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp;
								<input type="date" name="date" id="Date">
	<input type="submit" value="Show Chart" >
	</form>
	
	

<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
String Date = null;
 

	
	String xVal, yVal ,	zVal;
	
	String date = request.getParameter("date");
	
	SMSdb db = new SMSdb();
	ArrayList<Account> accounts = db.ViewDatabyDate(date);
	
	for(Account value : accounts){
		
		String accountName = value.getAccountName();
		int MsgCount = value.getMsgCount();
		//String Date = value.getDate();
		
		xVal = accountName;
		yVal = String.valueOf(MsgCount);
		zVal = Date;
		
		map = new HashMap<Object,Object>(); 
		map.put("label", xVal);
		map.put("y", Double.parseDouble(yVal)); 
		list.add(map);
		dataPoints = gsonObj.toJson(list);
		Date = gsonObj.toJson(date);
	}
	request.setAttribute("date", date);
	 //request.setAttribute("MonthNumber", monthNumber);
	//response.sendRedirect("Chart1.jsp");
//	response.sendRedirect("ChartbyDate.jsp");
	%>


<div id="chartContainer" style="height: 370px; width: 100%;"></div>
</div>

<script type="text/javascript">
window.onload = function(){ 
 
	
	//var date1 = document.getElementById("Date").value;
	//console.log("kkkkkkkkk"+date1);
	//
	
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Pie Chart for Date   " + <%out.print(Date);%>
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