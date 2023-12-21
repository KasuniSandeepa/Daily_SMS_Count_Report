<%@page import="java.util.TreeMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.awt.Label"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="java.util.stream.Stream"%>
<%@page import="java.util.stream.Collectors"%>
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
<!-- 
=========================================================
 Light Bootstrap Dashboard - v2.0.1
=========================================================

 Product Page: https://www.creative-tim.com/product/light-bootstrap-dashboard
 Copyright 2019 Creative Tim (https://www.creative-tim.com)
 Licensed under MIT (https://github.com/creativetimofficial/light-bootstrap-dashboard/blob/master/LICENSE)

 Coded by Creative Tim

=========================================================

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  -->
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="./assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Chart Report | Textware Daily SMS Report</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="./assets/css/demo.css" rel="stylesheet" />
    <script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>

<body>

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
		String YEAR_1 = gsonObj.toJson(year);
	%>
	
	<%
	
	ArrayList<Account> _AccountDetails_1 = new ArrayList<>();
	
	Gson gsonObj_1 = new Gson();
	Map<Object, Object> map_1 = null;
	List<Map<Object, Object>> list_1 = new ArrayList<Map<Object, Object>>();

	String year_1 = request.getParameter("year");

	if (year_1 == null) {
		year_1 = "2021";
	}

	try {

		// Call to the database connection
		connection = DBConnection.GetConnection();

		statement = connection.createStatement();

		// Declare the sql statement for retrieve all employee details
		//	String _Sql = "select * from  totalcountmonthlychart where Month= ' " + monthNumber + " ' order by  SumMsgCount desc LIMIT 20";
		String _Sql_1 = "SELECT Month(Date) , sum(Msg_Count) FROM daily_sms_report.account where YEAR(Date) = '" + year_1
		+ "' group by MONTH(Date)";
		// Execute the sql statement
		resultSet = statement.executeQuery(_Sql_1);

		if (resultSet.next()) {

			// Succesfully excuted the sql statement
			System.out.println("in in");

			do {
		System.out.println("hhhhhhhhhhh");
		// int id = resultSet.getInt(1);
		String _MonthNumber = resultSet.getString(1);
		// String Date = resultSet.getString(3);

		int _MsgCount = resultSet.getInt(2);

		Account account = new Account(_MonthNumber, _MsgCount);// Store the results in

		_AccountDetails_1.add(account);// Store details in the arraylist

			} while (resultSet.next()); // Get the employee details and row by row
		}

	} catch (Exception e) {

		e.printStackTrace();
	}

	//	SMSdb db = new SMSdb();
	//ArrayList<Account> accounts = db.ViewDatabyMonthlyChart(monthNumber);
	//		//ArrayList<Account> accounts = db.ViewDatabyMonthlyChart(monthNumber, year);
	System.out.println("aaaa" + _AccountDetails_1);

	ArrayList<Account> _AccountDetails1 = new ArrayList<>();

	ArrayList<String> monthsAvailable = new ArrayList<>();

	for (Account value : _AccountDetails_1) {

		monthsAvailable.add(value.getAccountName());
	}
	
	Iterator<Account> iter = _AccountDetails_1.iterator();
	ArrayList<Account> toRemoveAccounts = new ArrayList<>();

	try{
	for (int i = 0; i < months.length; i++) {
		for(Account value : _AccountDetails_1) {
				
			
				int tempI = i + 1;
					int month = Integer.parseInt(value.getAccountName());
					
					System.out.println("monthhhh"+month);
					System.out.println("tempppppp"+tempI);
					
			
					if (month == tempI) {
						System.out.println("----msg Countss" + value.getMsgCount());
						map_1 = new HashMap<Object, Object>();
						map_1.put("label", months[i]);
						map_1.put("y", value.getMsgCount());
						list_1.add(map_1);
						toRemoveAccounts.add(value);
						//_AccountDetails.remove(value);
						//iter.remove();
					} else {
						System.out.println("----msg else" + value.getMsgCount());
						map_1 = new HashMap<Object, Object>();
						map_1.put("label", months[i]);
						map_1.put("y", 0);
						list_1.add(map_1);
					}
			
					System.out.println("----msg listt" + _AccountDetails_1.size());
				tempI =0;
			}
		
		_AccountDetails_1.removeAll(toRemoveAccounts);

		System.out.println("iiiiiiii"+i);

		if (_AccountDetails_1.size() == 0) {
			map_1 = new HashMap<Object	, Object>();
			map_1.put("label", months[i]);
			map_1.put("y", 0);
			list_1.add(map_1);
			
			}
	
	
			
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
		List<Map<Object, Object>> newList_1 = new ArrayList<Map<Object, Object>>();
	
	for(Map e : list_1){
		
		System.out.println("kkkkkkkkkkkk"+e);
		if(!newList_1.contains(e)){
			
			
			newList_1.add(e);
			
		}
	}
	
	Object label = new Object();
	List<Map<Object, Object>> removeList_1 = new ArrayList<Map<Object, Object>>();
	for(Map e : newList_1){
		
		//System.out.println(e.get("label"));
		//System.out.println(e.values());
		if(label.equals(e.get("label"))){
			//do nothing
		if(e.get("y").equals("0"));{
			//newList.remove(e);
			removeList_1.add(e);
		}
		}else{
			//do nothing
		}
		
		label = e.get("label");
		
		
	}
	newList_1.removeAll(removeList_1);
for(Map e : newList_1){
		
		System.out.println(e.get("label"));
		System.out.println(e.values());
		System.out.println();

		
		
		
	}
	String dataPoints_1 = gsonObj.toJson(newList_1);
	String monthName_1 = gsonObj.toJson(year);
	
	
	
	
	
	%>
	
		<script>
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light10",
	title: {
		text: 	 <%out.print(YEAR_1);%> +"   "+ <%out.print(monthName);%>
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
var ddlYears_1 = document.getElementById("ddlYears_1");

//Determine the Current Year.
var currentYear = (new Date()).getFullYear();

//Loop and add the Year values to DropDownList.
for (var i = 2017; i <= currentYear; i++) {
	var option = document.createElement("OPTION");
	option.innerHTML = i;
	option.value = i;
	ddlYears.appendChild(option);
}

//Loop and add the Year values to DropDownList.
for (var i = 2017; i <= currentYear; i++) {
	var option = document.createElement("OPTION");
	option.innerHTML = i;
	option.value = i;
	ddlYears_1.appendChild(option);
}


var chart_1 = new CanvasJS.Chart("chartContainer_1", {
	theme: "light10",
	title: {
		text: 	"Year " + <%out.print(monthName_1);%>
	},
	axisX: {
		title: "Month"
	},
	axisY: {
		title: "Amount of Messages",
		includeZero: true
	},
	data: [{
		type: "line",
		yValueFormatString: "#,##0 messages",
		dataPoints : <%out.print(dataPoints_1);%>
	}]
});
chart_1.render();

};
 



</script>

	
<!-- Overview Main Chart -->

	
    <div class="wrapper">
        <div class="sidebar" data-image="./assets/img/sidebar-5.jpg"  data-color="blue" >
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="#" class="simple-text">
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
                        <a class="nav-link" href="ViewSummaryByMonth.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Table List</p>
                            
                        </a>
                                            </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="MainCharts.jsp">
                            <i class="nc-icon nc-paper-2"></i>
                            <p>View Charts</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="upload.jsp">
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
                    <a class="navbar-brand" href="#pablo"> Chart Report </a>
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
                         <!--   <li class="dropdown nav-item">
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
                            </li> --> 
                          <!--  <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nc-icon nc-zoom-split"></i>
                                    <span class="d-lg-block">&nbsp;Search</span>
                                </a>
                            </li> --> 
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <!-- <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Account</span>
                                </a>
                            </li> -->
                         <!--   <li class="nav-item dropdown">
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
                            </li> --> 
                              <!--  <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>--> 
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        
                        <div class="col-lg-12" >
                            <div class="card " style=""width:100%">
                                <div class="card-header ">
                                    <h4 class="card-title">Monthly Behaviour</h4>
                                    <p class="card-category">Top 20 Clients</p>
                                </div>
                                <div class="card-body ">
                                
                                <form action="MainCharts.jsp" name="add" method="post">
		
			<div class="input-group">

				Select the Year<i
					class="glyphicon glyphicon-user"></i>&nbsp;&nbsp; <select
					id="ddlYears" name="year">
					
					
					</select> &nbsp;&nbsp;&nbsp;&nbsp; 
			Select the Month<i
				class="glyphicon glyphicon-user"></i> &nbsp;&nbsp;<select
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
			</select>&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Show Chart" style="background-color: #008CBA ; padding: 6px 14px; border-radius: 4px; color: white;">
		</form>
                                
                                
                                
                                  <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                                    	
                                    	
                                </div>
                                <div class="card-footer ">
                                   <!-- <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Open
                                        <i class="fa fa-circle text-danger"></i> Click
                                        <i class="fa fa-circle text-warning"></i> Click Second Time
                                    </div>-->
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-history"></i> Updated 3 minutes ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br>
                    <div class="row" style="width : 100%;">
                        <div class="col-lg-12" style="width : 100%;">
                            <div class="card ">
                                <div class="card-header ">
                                    <h4 class="card-title">Overall Perfomance per Year</h4>
                                 <p class="card-category">Shows the overview for the selected year</p>
                                </div>
                                <div class="card-body ">
                                    <!--<div id="chartActivity" class="ct-chart"></div>-->
                                    <form action="MainCharts.jsp" name="add" method="post">

			<div class="input-group">

				Select the Year<i
					class="glyphicon glyphicon-user"></i> &nbsp;&nbsp; <select
					id="ddlYears_1" name="year">


				</select> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Show Chart" style="background-color: #008CBA ; padding: 6px 14px; border-radius: 4px; color: white;">
		</form>
                                     	<div id="chartContainer_1" style="height: 370px; width: 100%;"></div>
                                     	
                                     	
                                </div>
                                <div class="card-footer ">
                                  <!--   <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Tesla Model S
                                        <i class="fa fa-circle text-danger"></i> BMW 5 Series
                                    </div> -->
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-check"></i> Data information certified
                                    </div>
                                </div>
                            </div>
                        </div>
                   
                    </div>
                
            </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <!--  <ul class="footer-menu">
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
        </div>
    </div>
    <!--   -->
    <!-- <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
            <i class="fa fa-cog fa-2x"> </i>
        </a>

        <ul class="dropdown-menu">
			<li class="header-title"> Sidebar Style</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Background Image</p>
                    <label class="switch">
                        <input type="checkbox" data-toggle="switch" checked="" data-on-color="primary" data-off-color="primary"><span class="toggle"></span>
                    </label>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger background-color">
                    <p>Filters</p>
                    <div class="pull-right">
                        <span class="badge filter badge-black" data-color="black"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-orange" data-color="orange"></span>
                        <span class="badge filter badge-red" data-color="red"></span>
                        <span class="badge filter badge-purple active" data-color="purple"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">Sidebar Images</li>

            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="./assets/img/sidebar-1.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="./assets/img/sidebar-3.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src=".//assets/img/sidebar-4.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="./assets/img/sidebar-5.jpg" alt="" />
                </a>
            </li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard" target="_blank" class="btn btn-info btn-block btn-fill">Download, it's free!</a>
                </div>
            </li>

            <li class="header-title pro-title text-center">Want more components?</li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard-pro" target="_blank" class="btn btn-warning btn-block btn-fill">Get The PRO Version!</a>
                </div>
            </li>

            <li class="header-title" id="sharrreTitle">Thank you for sharing!</li>

            <li class="button-container">
				<button id="twitter" class="btn btn-social btn-outline btn-twitter btn-round sharrre"><i class="fa fa-twitter"></i> · 256</button>
                <button id="facebook" class="btn btn-social btn-outline btn-facebook btn-round sharrre"><i class="fa fa-facebook-square"></i> · 426</button>
            </li>
        </ul>
    </div>
</div>
 -->
</body>
<!--   Core JS Files   -->
<script src="./assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="./assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="./assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="./assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="./assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="./assets/js/demo.js"></script>
<!-- <script type="text/javascript">
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        demo.showNotification();

    });
</script>  -->

</html>
