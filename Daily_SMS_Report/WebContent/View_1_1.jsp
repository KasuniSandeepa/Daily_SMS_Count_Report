<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="Database.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Operations.SMSdb"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>

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
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin
	Dashboard by Creative Tim</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./assets/css/light-bootstrap-dashboard.css?v=2.0.0 "
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./assets/css/demo.css" rel="stylesheet" />
<script type="text/javascript" src="jquery-3.3.1.min.js">
	
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>

<style type="text/css">
.alert {
	padding: 20px;
	background-color: #f44336;
	color: white;
	opacity: 1;
	transition: opacity 0.6s;
	margin-bottom: 15px;
}

.alert.success {
	background-color: #4CAF50;
}

.closebtn {
	margin-left: 15px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}
</style>

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
	<div class="wrapper">
		<div class="sidebar" data-image="./assets/img/sidebar-5.jpg"
			data-color="blue">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="http://www.creative-tim.com" class="simple-text">
						Textware Daily SMS Count </a>
				</div>
				<ul class="nav">
					<li><a class="nav-link" href="index.jsp"> <i
							class="nc-icon nc-chart-pie-35"></i>
							<p>Dashboard</p>
					</a></li>
					<!-- <li>
                        <a class="nav-link" href="./index.jsp">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>User Profile</p>
                        </a>
                    </li> -->
					<li class="nav-item active"><a class="nav-link"
						href="MainTableMenu.jsp"> <i class="nc-icon nc-notes"></i>
							<p>Table List</p>
					</a></li>
					<li><a class="nav-link" href="MainCharts.jsp"> <i
							class="nc-icon nc-paper-2"></i>
							<p>View Charts</p>
					</a></li>
					<li><a class="nav-link" href=".jsp"> <i
							class="nc-icon nc-atom"></i>
							<p>Upload</p>
					</a></li>
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
					<a class="navbar-brand" href="#pablo"> Table Report - Per Month</a>
					<button href="" class="navbar-toggler navbar-toggler-right"
						type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">
						<ul class="nav navbar-nav mr-auto">
							<li class="nav-item"><a href="#" class="nav-link"
								data-toggle="dropdown"> <i class="nc-icon nc-palette"></i> <span
									class="d-lg-none">Dashboard</span>
							</a></li>
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
			<%
				String monthNumber = request.getParameter("month");
			String year = request.getParameter("year");

			//SMSdb insertData = new SMSdb();
			//ArrayList<Account> accounts = SMSdb.ViewDatabyMonthly(monthNumber);

			if (monthNumber == null) {
				monthNumber = "3";
			}

			if (year == null) {
				year = "2021";
			}

			ArrayList<Account> _AccountDetails = new ArrayList<>();

			System.out.println("Just Enteer to the ViewDataByMonthly function");

			boolean isSuccess;
			Connection connection;
			Statement statement;
			ResultSet resultSet;

			try {

				connection = DBConnection.GetConnection();

				statement = connection.createStatement();

				//select * from  totalcountmonthlychart where Month= ' " + monthNumber + " ' and YEAR = '" +year + "'order by  SumMsgCount desc LIMIT 20";
				String _Sql = "select * from account where MONTH(Date) = '" + monthNumber + " ' and YEAR(Date) = ' " + year + "'";
				// String _Sql = "select id , Account_Name , Date , sum(Msg_Count) as 'SUM' from
				// daily_sms_report.account where MONTH(Date) = '"+monthNumber+"' group by
				// Account_Name order by SUM DESC";
				resultSet = statement.executeQuery(_Sql);

				if (resultSet.next()) {

					System.out.println("in in");

					do {
				int _Id = resultSet.getInt(1);
				String _AccountName = resultSet.getString(2);
				String _Date = resultSet.getString(3);
				int _MsgCount = resultSet.getInt(4);

				System.out.println("View Data by Monthlyyyyyyyyyyy" + _AccountName);
				Account account = new Account(_Id, _AccountName, _Date, _MsgCount);

				_AccountDetails.add(account);

					} while (resultSet.next());
				}

			} catch (Exception e) {

				e.printStackTrace();
			}

			request.setAttribute("accounts", _AccountDetails);
			//System.out.println("got");

			application.setAttribute("accounts", _AccountDetails);

			//response.sendRedirect("/View.jsp");
			//response.sendRedirect(request.getContextPath() + "/View.jsp");
			//response.sendRedirect(request.getContextPath() + "/View_1_1.jsp");
			//RequestDispatcher Dispatcher = request.getRequestDispatcher("/View.jsp");
			//Dispatcher.forward(request, response);

			//response.sendRedirect("/View.jsp");
			%>
			<div class="container">
				<div class="text-center"></div>

				<form action="View_1_1.jsp" name="add" method="post">
					<div class="input-group">



						Select the Year<i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;
						<select id="ddlYears" name="year">


						</select> &nbsp;&nbsp;&nbsp;&nbsp; Select the Month<i
							class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;<select
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
						</select> &nbsp;&nbsp;&nbsp; <input type="submit" value="View" />
				</form>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


			</div>


			<br>
			<table class="table table-fluid" id="myTable">
				<thead>
					<tr>

						<th>Account Name</th>
						<th>Message Count</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="account" items="${accounts}">

						<c:set var="accountName" value="${account.getAccountName()}" />
						<c:set var="messageCount" value="${account.getMsgCount()}" />

						<c:set var="date" value="${account.getDate()}" />


						<tr>
							<td>${account.getAccountName()}</td>
							<td class="contribution">${account.getMsgCount()}</td>

							<td>${account.getDate()}</td>


						</tr>
					</c:forEach>

				</tbody>
			</table>


			<br> <br>






		</div>
	</div>
	</div>

	</div>
	<script>
		$(document).ready(function() {
			$('#myTable').DataTable({
				"order" : [ [ 1, "desc" ] ]
			});
		});

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

		window.onload = function() {

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

	<br>
	<br>


	<footer class="footer">
		<div class="container-fluid">
			<nav>
				<!--  \  <ul class="footer-menu">
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>-->
				<p class="copyright text-center">
					©
					<script>
						document.write(new Date().getFullYear())
					</script>
					mobiOs Private Limited All Rights Reserved
				</p>
			</nav>
		</div>
	</footer>
</body>
<!--   Core JS Files   -->

</html>