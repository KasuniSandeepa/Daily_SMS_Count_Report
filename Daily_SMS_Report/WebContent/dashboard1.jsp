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
    <title>DashBoard - Textware Daily SMS Count</title>
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
<!-- Overview Main Chart -->
<% 
	Gson gsonObj = new Gson();
	ArrayList<Account> _AccountDetails = new ArrayList<>();

	boolean isSuccess;
	Connection connection;
	Statement statement;
	ResultSet resultSet;

	String[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "Sepetember", "October",
			"November", "December" };
	try {

		// Call to the database connection
	connection = DBConnection.GetConnection();


		statement = connection.createStatement();

		String _Sql = "SELECT Year(Date) , Month(Date) , sum(Msg_Count) FROM daily_sms_report.account group by MONTH(Date) , Year(Date) order by Year(Date) Asc";

		resultSet = statement.executeQuery(_Sql);

		if (resultSet.next()) {

			do {

				String _YearNumber = resultSet.getString(1);
				String _MonthNumber = resultSet.getString(2);
				int _MsgCount = resultSet.getInt(3);

				Account account = new Account(_YearNumber ,_MonthNumber, _MsgCount);

				_AccountDetails.add(account);

				} while (resultSet.next()); 
		}

	} catch (Exception e) {

		e.printStackTrace();
	}
	
	Map<String, List<Account>> mappedData = new HashMap<>();


	
	for(Account data : _AccountDetails) {
		
		if(mappedData.containsKey(data.getAccountName())) {
			
			mappedData.get(data.getAccountName()).add(data);
		}else {
			List<Account> tempList = new ArrayList<Account>();
			tempList.add(data);
			mappedData.put(data.getAccountName(), tempList);
		}
		
	}
	
	System.out.println("Dataaaaaaaa"+mappedData);
	Map<String, List<Account>> sortedMap = new TreeMap<String, List<Account>>(mappedData);
	
	Map<Object, Object> map = null;
	//List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
	List<List<Map<Object, Object>>> mapList = new ArrayList<List<Map<Object, Object>>>();
	
	 for (Map.Entry<String,List<Account>> entry : sortedMap.entrySet()){
       //  System.out.println("Key = " + entry.getKey() +
           //               ", Value = " + entry.getValue());
         List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

         for (int j = 0; j < months.length; j++) {
       for(int i = 0 ; i < entry.getValue().size() ; i++){
    	   String month = months[Integer.parseInt(entry.getValue().get(i).getDate())-1];
    	 //  System.out.println(months[Integer.parseInt(entry.getValue().get(i).getDate())-1] +" " + entry.getValue().get(i).getMsgCount());
       	
    	   int tempI = j + 1;
    	   int _month = Integer.parseInt(entry.getValue().get(i).getDate());
    	   
    	   System.out.println("Tempp "+tempI);
    	   System.out.println("Month "+_month);
    	   
    	   if (_month == tempI){
    	   map = new HashMap<Object, Object>();
		   map.put("label", month);
    	   map.put("y", entry.getValue().get(i).getMsgCount());
    	   
    	      	   list.add(map);
    	      
    	   }else {
				
				map = new HashMap<Object, Object>();
				map.put("label", months[j]);
				map.put("y", 0);
				list.add(map);
			}
    	   
    	    
       }
         }
         
         

 		List<Map<Object, Object>> newList = new ArrayList<Map<Object, Object>>();
 	
 	for(Map e : list){
 		
 		System.out.println("kkkkkkkkkkkk"+e);
 		if(!newList.contains(e)){
 			
 			
 			newList.add(e);
 			
 		}
 	}
 	
 	for(Map f : newList){
 		
 		System.out.println("jjjjjjjjjjjjjjjjjj"+f);
 	}
 	
 	Object label = new Object();
 	Object count = new Object();
 	Object obj = 0;
 	//Object january = "January";
 	Map<Object, Object> el = new HashMap<Object, Object>();
 	
 	List<Map<Object, Object>> removeList = new ArrayList<Map<Object, Object>>();
 	for(Map e : newList){
 		
 		//label = january;
 		
 		System.out.println(e.get("label"));
 		
 		System.out.println(e.values().toArray()[0]);
 		if(label.equals(e.get("label"))){
 			
 			if(count.equals(obj)){
 				 System.out.println("I am here now");
 		 		
 				removeList.add(el);
 			}
 			//do nothing
 			else if(e.get("y").equals("0"))
 			{
				 System.out.println("I am here now11111111111111111");

 			//newList.remove(e);
 			removeList.add(e);
 		}
 		}else{
 			//do nothing
 		}
 		
 		label = e.get("label");
 		count = e.values().toArray()[0];
 		System.out.println("counttt"+count);
 		 el = e;
 		 System.out.println("ELLL"+el);
 		
 		
 		
 	}
 	newList.removeAll(removeList);
    System.out.println("lllllllllll"+newList);
       
    
    Map<Object, Object> m1  = new HashMap<Object, Object>();
    Map<Object, Object> m2  = new HashMap<Object, Object>();
    
    m1= newList.get(0);
    m2= newList.get(1);
    
  	System.out.println("okkkk"+m1.get("label"));
    if(m1.get("label").equals(m2.get("label"))){
    	
    	System.out.println("okkkk111"+m1.values().toArray()[0]);
    	if(m1.values().toArray()[0].equals(obj)){
    		
    		newList.remove(0);
    	}else if(m2.values().toArray()[0].equals(obj)){
    		newList.remove(1);
    	}
    }
    	
    
       
     mapList.add(newList);
     
  }
	 System.out.println("I am heree");
	 for(List v : mapList){
		 
		 System.out.println("ggggggggggggggg"+v);
	 }
	
	 int length = mapList.size();
	 
	 List<Map<Object, Object>> list1 = new ArrayList<Map<Object, Object>>();
	 List<Map<Object, Object>> list2 = new ArrayList<Map<Object, Object>>();
	 List<Map<Object, Object>> list3 = new ArrayList<Map<Object, Object>>();
	 List<Map<Object, Object>> list4 = new ArrayList<Map<Object, Object>>();
	 List<Map<Object, Object>> list5 = new ArrayList<Map<Object, Object>>();
	 
	 //int length = mapList.size();
	 
	 	//List<List<Map<Object, Object>>> mapList = new ArrayList<List<Map<Object, Object>>>();
	 
	 ArrayList< List<Map<Object, Object>>> _mapYearList = new ArrayList< List<Map<Object, Object>>>();
	 
	/*  _mapYearList.add(list1);
	 _mapYearList.add(list2);
	 _mapYearList.add(list3);
	 _mapYearList.add(list4);
	 _mapYearList.add(list5); */
	 
	
	
	
	 
     list1 =  mapList.get(0);//2017
	 list2 =  mapList.get(1);//2018
	 list3 =  mapList.get(2);//2019
	 list4 =  mapList.get(3);//2020
    // list5 =  mapList.get(4);//2021
	 
	/*  for(int i = 0 ; i < 5 ; i++){
		 System.out.println( "bbbbbbbbbbbbbbbbb"+mapList.get(i));
	 }
	  */
	 String dataPoints = gsonObj.toJson( list1);
	String dataPoint1 = gsonObj.toJson( list2);
	String dataPoint2 = gsonObj.toJson( list3);
	String dataPoint3 = gsonObj.toJson( list4);
	String dataPoint4 = gsonObj.toJson( list5);
	// String dataPoint2 = gsonObj.toJson( mappedData.get("2018"));
	
	System.out.println("dddd"+ mapList);
	
	%>

	<%
	ArrayList<Account> _AccountDetails_1 = new ArrayList<>();
	
	Gson gsonObj_1 = new Gson();
	Map<Object, Object> map_1 = null;
	List<Map<Object, Object>> list_1 = new ArrayList<Map<Object, Object>>();
	
	try {

		
		connection = DBConnection.GetConnection();

		statement = connection.createStatement();

		
		String _Sql_1 = "SELECT Account_Name ,  sum(Msg_Count) FROM daily_sms_report.account group by Account_Name order by sum(Msg_Count) DESC limit 20";
		
		resultSet = statement.executeQuery(_Sql_1);

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

				_AccountDetails_1.add(account);// Store details in the arraylist

			}while(resultSet.next()); // Get the employee details and row by row
		}

	} catch (Exception e) {

		e.printStackTrace();
	}

	for (Account value :   _AccountDetails_1) {

		String accountName = value.getAccountName();
		int MsgCount = value.getMsgCount();
		System.out.println( accountName +",,,,,"+  MsgCount);

		map_1 = new HashMap	<Object, Object>();map_1.put("label", accountName);map_1.put("y", MsgCount);list_1.add(map_1);

	}

	String dataPoints_1 = gsonObj_1.toJson(list_1);

	
	
	
	%>
	<%
	
	ArrayList<Account> _AccountDetails_2 = new ArrayList<>();
	Gson gsonObj_2 = new Gson();
Map<Object, Object> map_2 = null;
List<Map<Object, Object>> list_2 = new ArrayList<Map<Object, Object>>();
String dataPoints_2 = null;




String xVal, yVal;
String xVal1, yVal1;





try {


	connection = DBConnection.GetConnection();

	statement = connection.createStatement();

	
	String _Sql_2 = "SELECT  Month(Date) , sum(Msg_Count) FROM daily_sms_report.account where Year(Date) = year(curdate()) group by MONTH(Date) ;";
	
	resultSet = statement.executeQuery(_Sql_2);

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

			_AccountDetails_2.add(account);// Store details in the arraylist

		}while(resultSet.next()); // Get the employee details and row by row
	}

} catch (Exception e) {

	e.printStackTrace();
}



for (Account value : 	_AccountDetails_2) {

	String accountName = value.getAccountName();
	String month = months[Integer.parseInt(accountName )-1];
	int MsgCount = value.getMsgCount();

	xVal =  month;
	yVal = String.valueOf(MsgCount);

	map_2 = new HashMap<Object, Object>();
	map_2.put("label", xVal);
	map_2.put("y", Double.parseDouble(yVal));
	list_2.add(map_2);
	dataPoints_2 = gsonObj_2.toJson(list_2);

}
	
	
%>
	<script type="text/javascript">
	
	
	window.onload = function(){
			var formatteddata = [];
			dataPoints = <%out.print(dataPoints);%>
			console.log(dataPoints);
			for(var key in dataPoints){
				var singleObject = {
						name: '',
						data: []
					}
				singleObject.name = key.toUpperCase();
				for(var i = 0; i < dataPoints[key].length; i++){
					singleObject.data.push(parseInt(dataPoints[key][i].MsgCount));
				}
				console.log(singleObject);
				formatteddata.push(singleObject);
			}
			
			drawMultipleLineChart(formatteddata);
			
			
			var chart_1 = new CanvasJS.Chart("chartContainer_1", {
				theme: "light10",
				title: {
					text: 	""
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
					dataPoints : <%out.print(dataPoints_1);%>
				}]
			});
			chart_1.render();
			
			<%if (dataPoints_2 != null) {%>
			var chart_2 = new CanvasJS.Chart("chartContainer_2", {
					animationEnabled : true,
					exportEnabled : true,
					title : {
						text : "   " 

			},
					data : [ {
						type : "pie",
						indexLabel : "{label} {x}%",//change type to bar, line, area, pie, etc
						dataPoints :
		<%out.print(dataPoints_2);%>
			} ]
				});
				chart_2.render();
		<%}%>
	
	
	
};

	function drawMultipleLineChart(formatteddata){
		 var chart = new CanvasJS.Chart("chartContainer",
				    {
				      title:{
				      text: " "  
				      },
				      data: [
				      {        
				        type: "line",
				        name: "2017",
				        showInLegend: true,
				        dataPoints:
				        	<%out.print(dataPoints);%>
				      
				        
				      },
				        {        
				        type: "line",
				        name: "2018",
				        showInLegend: true,
				        yValueFormatString: "#,##0 messages",
						dataPoints : <%out.print(dataPoint1);%>
				       
				      },
				      {        
					        type: "line",
					        name: "2019",
					        showInLegend: true,
					        yValueFormatString: "#,##0 messages",
							dataPoints : <%out.print(dataPoint2);%>
					       
					      },
					      
					      {        
						        type: "line",
						        name: "2020",
						        showInLegend: true,
						        yValueFormatString: "#,##0 messages",
								dataPoints : <%out.print(dataPoint3);%>
						       
						      },
						      
						      {        
							        type: "line",
							        name: "2021",
							        showInLegend: true,
							        yValueFormatString: "#,##0 messages",
									dataPoints : <%out.print(dataPoint4);%>
							       
							      }
						      
				      
				      
				    ]				    
				      });

				    chart.render();
				  }
	</script>
	
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
                    <li class="nav-item active">
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
                    <a class="navbar-brand" href="#pablo"> Dashboard </a>
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
                        <div class="col-md-4">
                            <div class="card ">
                                <div class="card-header ">
                                    <h4 class="card-title">Monthly Statistics</h4>
                                    <p class="card-category">Monthly Performance for the current year - <script>document.write(new Date().getFullYear())</script></p>
                                </div>
                                <div class="card-body ">
                                    <!--  <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>-->
                                    <div id="chartContainer_2" style="height: 370px; width: 100%;"></div>
                              <!--  <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Open
                                        <i class="fa fa-circle text-danger"></i> Bounce
                                        <i class="fa fa-circle text-warning"></i> Unsubscribe
                                    </div>-->
                                    <hr>
                                  <!--  <div class="stats">
                                        <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                    </div> --> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card ">
                                <div class="card-header ">
                                    <h4 class="card-title">Year Behaviour</h4>
                                    <p class="card-category">All year perfomance</p>
                                </div>
                                <div class="card-body ">
                                    	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
                                </div>
                                <div class="card-footer ">
                                   <!-- <div class="legend">
                                        <i class="fa fa-circle text-info"></i> Open
                                        <i class="fa fa-circle text-danger"></i> Click
                                        <i class="fa fa-circle text-warning"></i> Click Second Time
                                    </div>-->
                                    <hr>
                               <!--       <div class="stats">
                                        <i class="fa fa-history"></i> Updated 3 minutes ago
                                    </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card ">
                                <div class="card-header ">
                                    <h4 class="card-title">Overall Perfomance of Clients</h4>
                                 <p class="card-category">Top 20 Clients</p>
                                </div>
                                <div class="card-body ">
                                    <!--<div id="chartActivity" class="ct-chart"></div>-->
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
                        <div class="col-md-6">
                            <div class="card  card-tasks">
                                <div class="card-header ">
                                    <h4 class="card-title">Select the Date</h4>
                                    <p class="card-category">Select the date to review total amount of messages</p>
                                </div>
                                <div class="card-body ">
                                    <form action="Controller/view_controller3.jsp" name="add"
			method="post">
			<div class="input-group">
			
				<br>  <span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp; <input
					type="date" name="date"> <input type="submit" value="View" />
			</div>

		</form>
		
			<%
			//String date = (String) request.getAttribute("date");
		//String MsgCount = (String) request.getAttribute("MsgCount");

		String date = (String) application.getAttribute("date");
		String MsgCount = (String) application.getAttribute("MsgCount");
		%>
		<br>

		<h5>
			Date :
			<%
			if (date == null) {
			out.println("Not selected");
		} else {
			out.println(date);
		}
		%>
		<br>
		<br>
		<div class="input-group">
			 Total Messages :
			
			<%
				if (MsgCount == null) {
				%>
				
				<p class="x"><% out.println("0");%></p>
				<% 
			} else {
				%>
				
				
				<center><h5 class="x"><b><%out.println(MsgCount);%></b></h5></center>
				
				<% 
			}
			%>
			</div>

		</h5>
		
		<script type="text/javascript">
		
		$(document).ready(
				function() {
					$("h5.x").each(
							function() {
								$(this).html(
										parseFloat($(this).text())
												.toLocaleString('en-US', {
													maximumFractionDigits : 2
												}));
							})
				})
		
		
		
		</script>
                                    
                                </div>
                                <div class="card-footer ">
                                    <hr>
                                  <!--   <div class="stats">
                                        <i class="now-ui-icons loader_refresh spin"></i> Updated 3 minutes ago
                                    </div>--> 
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
