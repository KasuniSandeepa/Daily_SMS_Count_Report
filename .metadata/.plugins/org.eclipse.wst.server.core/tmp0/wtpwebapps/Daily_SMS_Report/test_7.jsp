<%@page import="java.sql.ResultSet"%>
<%@page import="Operations.SMSdb"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modle.Data"%>
<%@ page import="modle.Account"%>

<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="./assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin Dashboard by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="./assets/css/demo.css" rel="stylesheet" />
    <script type="text/javascript" src="jquery-3.3.1.min.js">
	
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

<style>
td {
	height: 0.1px;
}
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
#myTable tr{
	cursor: pointer;
}
</style>
</head>
<body>
	<%
		TreeMap<String, List<Data>> all = new TreeMap<>();
	SMSdb db = new SMSdb();
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	ArrayList<String> dates = new ArrayList();
	ArrayList<String> totalCounts = new ArrayList();
	String totalCountPermonth = "0";

	if (month == null) {

		month = "3";
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
	cal.set(Calendar.MONTH, (Integer.parseInt(month) - 1));
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

	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	System.out.println(df.format(cal.getTime()));
	String date = df.format(cal.getTime());

	SimpleDateFormat df3 = new SimpleDateFormat("yyyy-MM");
	System.out.println(df3.format(cal.getTime()));
	String date1 = df3.format(cal.getTime());

	System.out.println("Current Date : " + today);
	System.out.println("Current Date dddd : " + today1);
	System.out.println("Selected Date : " + date);

	if (date1.equals(today1)) {
		for (int i = 0; i < Integer.parseInt(today); i++) {
			// ResultSet query = DBConnection.getDbCon().query("select * from acc where month(date)='3' and day(date)='"+i+"'");
			ArrayList<Account> accounts = db.ViewDatabyMonthDate1(month, year, String.valueOf(i + 1));
			List<String> names = new ArrayList<>();
			for (Account var : accounts) {
		names.add(var.getAccountName());
			}
			List<Data> a = new ArrayList<>();

			cal.set(Calendar.DAY_OF_MONTH, i + 1);
			dates.add(df.format(cal.getTime()));
			String MsgCount = db.TotalMsgsPerDay(df.format(cal.getTime()));
			totalCounts.add(MsgCount);

			for (String v : newAccountNames) {

		if (names.contains(v)) {

			for (Account x : accounts) {

				if (x.getAccountName().equals(v)) {
					a.add(new Data(x.getAccountName(), String.valueOf(x.getMsgCount()), df.format(cal.getTime())));
				}
			}
		} else {

			a.add(new Data(v, "0", df.format(cal.getTime())));
		}

			}

			all.put(df.format(cal.getTime()), a);
		}
	} else {
		for (int i = 0; i < maxDay; i++) {
			// ResultSet query = DBConnection.getDbCon().query("select * from acc where month(date)='3' and day(date)='"+i+"'");
			ArrayList<Account> accounts = db.ViewDatabyMonthDate1(month, year, String.valueOf(i + 1));
			List<String> names = new ArrayList<>();
			for (Account var : accounts) {
		names.add(var.getAccountName());
			}
			List<Data> a = new ArrayList<>();

			cal.set(Calendar.DAY_OF_MONTH, i + 1);
			dates.add(df.format(cal.getTime()));
			String MsgCount = db.TotalMsgsPerDay(df.format(cal.getTime()));
			totalCounts.add(MsgCount);

			for (String v : newAccountNames) {

		if (names.contains(v)) {

			for (Account x : accounts) {

				if (x.getAccountName().equals(v)) {
					a.add(new Data(x.getAccountName(), String.valueOf(x.getMsgCount()), df.format(cal.getTime())));
				}
			}
		} else {

			a.add(new Data(v, "0", df.format(cal.getTime())));
		}

			}

			all.put(df.format(cal.getTime()), a);
		}
	}

	Set<Map.Entry<String, List<Data>>> entries = all.entrySet();

	System.out.println("sssssssssssssss " + entries.size());

	for (Map.Entry<String, List<Data>> entry : entries) {

		//System.out.println("datesss"+entry.getKey());
	}

	for (Map.Entry<String, List<Data>> entry : entries) {

		// System.out.println("Size"+entry.getValue().size());
		if (entry.getValue().size() == 0) {
			System.out.println("0");
		} else {
			for (Data datas : entry.getValue()) {
		/// System.out.println(datas.toString());
			}
		}

		;

	}

	System.out.println(newAccountNames);

	System.out.println("Size = " + newAccountNames.size());
	application.setAttribute("newAccountNames", newAccountNames);
	application.setAttribute("dates", dates);
	application.setAttribute("totalCounts", totalCounts);
	application.setAttribute("totalCountPermonth", totalCountPermonth);
	application.setAttribute("month",month);
	application.setAttribute("year",year);

	//response.sendRedirect("test.jsp");
	//response.sendRedirect(request.getContextPath() + "test.jsp");
	%>
	
	<div class="wrapper">
        <div class="sidebar" data-image="./assets/img/sidebar-5.jpg"  data-color="blue">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text">
                         Textware Daily SMS Count 
                    </a>
                </div>
                <ul class="nav">
                    <li>
                        <a class="nav-link" href="index.jsp">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                  <!-- <li>
                        <a class="nav-link" href="./index.jsp">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>User Profile</p>
                        </a>
                    </li> --> 
                    <li>
                        <a class="nav-link" href="MainTableMenu.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Table List</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="MainCharts.jsp">
                            <i class="nc-icon nc-paper-2"></i>
                            <p>View Charts</p>
                        </a>
                    </li>
                   <li>
                        <a class="nav-link" href="index2.jsp">
                            <i class="nc-icon nc-atom"></i>
                            <p>Upload</p>
                        </a>
                    </li>
                    <!--   <li>
                        <a class="nav-link" href="./maps.html">
                            <i class="nc-icon nc-pin-3"></i>
                            <p>Maps</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="./notifications.html">
                            <i class="nc-icon nc-bell-55"></i>
                            <p>Notifications</p>
                        </a>
                    </li>--> 
                   <!--  <li class="nav-item active active-pro">
                        <a class="nav-link active" href="upgrade.html">
                            <i class="nc-icon nc-alien-33"></i>
                            <p>Upgrade to PRO</p>
                        </a>
                    </li> -->
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo"> Table Report - Main Table</a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-palette"></i>
                                    <span class="d-lg-none">Dashboard</span>
                                </a>
                            </li>
                         <!--    <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-planet"></i>
                                    <span class="notification">5</span>
                                    <span class="d-lg-none">Notification</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Notification 1</a>
                                    <a class="dropdown-item" href="#">Notification 2</a>
                                    <a class="dropdown-item" href="#">Notification 3</a>
                                    <a class="dropdown-item" href="#">Notification 4</a>
                                    <a class="dropdown-item" href="#">Another notification</a>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nc-icon nc-zoom-split"></i>
                                    <span class="d-lg-block">&nbsp;Search</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Account</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="no-icon">Dropdown</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>-->
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
	<br>
	<div class="container">
		<div class="text-center"></div>

		<form action="test_7.jsp" name="add" method="post">
			<div class="input-group">

				Select the Year<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp; <select
					id="ddlYears" name="year"></select> &nbsp;&nbsp;&nbsp;&nbsp; Select
				the Month<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp;<select
					name="month" id="monthName">
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
				</select>&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="View" />
		</form>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="View2.jsp"><input type="button" class="btn btn-warning"
			value="View Data by Date"></a>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="View3.jsp"><input type="button" class="btn btn-warning"
			value="View Total Message Count Per the Date"></a>
	</div>
 <div id="" title="Basic dialog">

	<br>
	<table class="table table-striped" id="myTable">


		<thead>
			<tr>

				<th>Account Name</th>
				<%
					for (int i = 0; i < dates.size(); i++) {
				%>
				<th><%=dates.get(i)%></th>
				<%
					}
				%>

				<th id="total">Total</th>
			</tr>
		</thead>
		<tbody>


			<%
				for (int i = 0; i < newAccountNames.size(); i++) {
			%>
	
			<tr onclick="passData('<%=newAccountNames.get(i)%>','<%=application.getAttribute("month")%>','<%=application.getAttribute("year")%>');">
			<td name="name" onclick="passData('<%=newAccountNames.get(i)%>',<%=dates.get(1)%>);"><%=newAccountNames.get(i)%></td>
			

				<%
					int total = 0;

				for (Map.Entry<String, List<Data>> entry : entries) {

					if (entry.getValue().size() == 0) {
						//System.out.println("0");
				%>
				<td>0</td>

				<%
					} else {
					for (Data datas : entry.getValue()) {
						for (int j = 0; j < dates.size(); j++) {
					//  System.out.println(datas.toString());

					if (newAccountNames.get(i).equals(datas.getName()) && datas.getDate().equals(dates.get(j))) {
				%>
				<td style="text-align: right" class="contribution"><%=datas.getCount()%></td>
				<%
					total = total + Integer.parseInt(datas.getCount());
				}

				}
				}

				;
				}
				}
				%>


				<td headers="total" class="contribution"><%=total%></td>

			</tr>
			<%
				}
			%>


			<tr style="background-color: #ff0000">
				<td>Total</td>
				<%
					for (int i = 0; i < totalCounts.size(); i++) {
				%>
				<td class="contribution"><%=totalCounts.get(i)%></td>
				<%
					}
				%>

				<td class="contribution"><%=totalCountPermonth%></td>
			<tr>
		</tbody>
	</table>


	<br>
	<br>






	</div>
	</div>
	</div>

	</div>
	<script>
		$(document).ready(function() {
			$('#myTable').DataTable({

				"columns" : [ {
					"type" : "number",
					"thousandSeparator" : ","
				} ]

			});
		});

		window.onload = function() {
			//Reference the DropDownList.
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

		$(document).ready(
				function() {
					$("td.contribution").each(
							function() {
								$(this).html(
										parseFloat($(this).text())
												.toLocaleString('en-US', {
													maximumFractionDigits : 2
												}));
							})
				})
		
		
		
	function passData(name , month , year){
			console.log("kkkkk"+name);
			localStorage.setItem("name1",name);
			//var month = document.getElementById("monthName").value;
				console.log("Monthhhh"+month);
				console.log("Yearrrrr"+year);
				
		var array = [];
		array.push(name);
		array.push(month);
		array.push(year);
		
			//window.location("1.jsp?name11="+name);
			
		//window.location = "1.jsp?"+name;
			//location.assign("1.jsp?name11="+name);
			location.assign("2.jsp?name11="+array);
			
			
	}
	</script>
	<br><br><br><br><br>
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

