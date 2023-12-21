<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
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




<script type="text/javascript">

function getName(){
	
	var accountName = localStorage.getItem("name1");
	console.log("jjjjjjjjjj"+accountName);
	//window.location = "1.jsp?"+name;
	
	//document.getElementById("accountName").value = accountName;
	//location.assign("1.jsp?name11="+accountName);
	//window.stop();
	//window.location.reload(false);

}
</script>

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
	//String accountName = (String)inv.invokeFunction("getName()");;
	//String accountName = request.getParameter("name11");
	String[] array = request.getParameterValues("name11");
	String[] innerArray = array[0].split(",");
	System.out.println("llllll"+innerArray.length);
	String accountName = innerArray[0];
	String _Month = innerArray[1];
	String _Year = innerArray[2];
	String[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "Sepetember",
			"October", "November", "December" };

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

		SimpleDateFormat df = new SimpleDateFormat("MM/dd");
		System.out.println(df.format(cal.getTime()));
		String date = df.format(cal.getTime());
		
		SimpleDateFormat df6 = new SimpleDateFormat("M");
		System.out.println(df6.format(cal.getTime()));
		String _MonthNumber = df6.format(cal.getTime());
		String _MonthName = months[(Integer.parseInt(_MonthNumber)-1)];
		System.out.println("Monthhhhhhh"+_MonthName );


		SimpleDateFormat df3 = new SimpleDateFormat("yyyy-MM");
		System.out.println(df3.format(cal.getTime()));
		String date1 = df3.format(cal.getTime());

		System.out.println("Current Date : " + today);
		System.out.println("Current Date dddd : " + today1);
		System.out.println("Current Date dddd : " + today4);
		System.out.println("Selected Date : " + date);
		System.out.println("Selected Date1 : " + date1);
		
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		
		
			for (int i = 0; i < Integer.parseInt(today); i++){
				
				ArrayList<Account> accounts = db.ViewDatabyMonthDate1( _Month, _Year, String.valueOf(i + 1));
				System.out.println("I am here");
				cal.set(Calendar.DAY_OF_MONTH, i + 1);
				if(accounts.isEmpty()){
				
				map = new HashMap<Object,Object>(); map.put("label",df.format(cal.getTime())); map.put("y", 0); list.add(map);
				System.out.println(df.format(cal.getTime()) +"0");
				}else{
					for(Account value : accounts){
						if(value.getAccountName().equals(accountName)){
					map = new HashMap<Object,Object>(); map.put("label",df.format(cal.getTime())); map.put("y", value.getMsgCount()); list.add(map);
					System.out.println(df.format(cal.getTime()) +value.getMsgCount());
						}
						}
				}
				
			}
		
		
			
			String MonthName = months[(Integer.parseInt(_Month)-1)];

	String dataPoints = gsonObj.toJson(list);
	String name = gsonObj.toJson(accountName);
	String _MonthName1 = gsonObj.toJson(MonthName);
	String Year1 = gsonObj.toJson(_Year);

	%>
	
	<script type="text/javascript">
window.onload = function() { 
	
	getName();
//	var accountName = localStorage.getItem("name1");
var accountName = localStorage.getItem("name1");


//window.location.replace("1.jsp?name11="+accountName);
	
	//console.log(accountName);
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	title: {
		text: 	<%out.print(name); %> +" in "+<%out.print(_MonthName1); %> + " "+ <%out.print(Year1);%>
	},
	axisX: {
		title: "Date"
	},
	axisY: {
		title: "Amount of Messages",
		includeZero: true
	},
	data: [{
		type: "line",
		yValueFormatString: "#,##0 messages",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
	
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
                    <li class="nav-item active">
                        <a class="nav-link" href="test7_7.1.jsp">
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

	
	 <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-header ">
                                    <!--  <h4 class="card-title">Overall Perfomance of Clients</h4>-->
                                <!--  <p class="card-category">Top 20 Clients</p>-->
                                </div>
                                <div class="card-body ">
                                    <!--<div id="chartActivity" class="ct-chart"></div>-->
                                     	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
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

	
	
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<br><br><br><br><br>
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
</html>

