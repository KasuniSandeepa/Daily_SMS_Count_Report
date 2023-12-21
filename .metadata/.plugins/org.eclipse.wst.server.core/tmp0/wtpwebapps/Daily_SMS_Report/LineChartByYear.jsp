<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>

<%
		//ArrayList<Account> accounts_1 = db.ViewDatabyDatePerMonthChart(monthNumber);
		
ArrayList<Account> _AccountDetails = new ArrayList<>();
ArrayList<Account> _AccountDetails1 = new ArrayList<>();

		boolean isSuccess;
		Connection connection;
		Statement statement;
		ResultSet resultSet;
 
		

		String[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "Sepetember",
		"October", "November", "December" };

		Gson gsonObj = new Gson();
		Map<Object, Object> map = null;
		List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
		
		Map<Object, Object> map1 = null;
		List<Map<Object, Object>> list1 = new ArrayList<Map<Object, Object>>();


		String year = request.getParameter("year");
		
		if(year==null){
			year="2021";
		}
		
		
		try {

			// Call to the database connection
			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			// Declare the sql statement for retrieve all employee details
		//	String _Sql = "select * from  totalcountmonthlychart where Month= ' " + monthNumber + " ' order by  SumMsgCount desc LIMIT 20";
			String _Sql = "SELECT Month(Date) , sum(Msg_Count) FROM daily_sms_report.account where YEAR(Date) = '" + year+ "' group by MONTH(Date)";
			// Execute the sql statement
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				// Succesfully excuted the sql statement
				System.out.println("in in");

				do {
					System.out.println("hhhhhhhhhhh");
					// int id = resultSet.getInt(1);
					String _MonthNumber = resultSet.getString(1);
					// String Date = resultSet.getString(3);
				
					int _MsgCount = resultSet.getInt(2);
				

					Account account = new Account( _MonthNumber, _MsgCount);// Store the results in
					
					

					_AccountDetails.add(account);// Store details in the arraylist

				}while(resultSet.next()); // Get the employee details and row by row
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		
		try {

			// Call to the database connection
		connection = DBConnection.GetConnection();


			statement = connection.createStatement();

			// Declare the sql statement for retrieve all employee details
		//	String _Sql = "select * from  totalcountmonthlychart where Month= ' " + monthNumber + " ' order by  SumMsgCount desc LIMIT 20";
			String _Sql = "SELECT Month(Date) , sum(Msg_Count) FROM daily_sms_report.account where YEAR(Date) = '2018' group by MONTH(Date)";
			// Execute the sql statement
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				// Succesfully excuted the sql statement
				System.out.println("in in");

				do {
					System.out.println("hhhhhhhhhhh");
					// int id = resultSet.getInt(1);
					String _MonthNumber = resultSet.getString(1);
					// String Date = resultSet.getString(3);
				
					int _MsgCount = resultSet.getInt(2);
				

					Account account = new Account( _MonthNumber, _MsgCount);// Store the results in
					
					

					_AccountDetails1.add(account);// Store details in the arraylist

				}while(resultSet.next()); // Get the employee details and row by row
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		
		
		
		
		
		for (Account value :   _AccountDetails1) {

			String _monthNumber = value.getAccountName();
			int MsgCount = value.getMsgCount();
			
			int m = Integer.parseInt(_monthNumber);
			
			
				
			String month = months[m-1];
			
			map1 = new HashMap	<Object, Object>();map1.put("label",   month);map1.put("y", MsgCount);list1.add(map1);
			

			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
			for (Account value :   _AccountDetails) {

				String _monthNumber = value.getAccountName();
				int MsgCount = value.getMsgCount();
				
				int m = Integer.parseInt(_monthNumber);
				
				
					
				String month = months[m-1];
				
				map = new HashMap	<Object, Object>();map.put("label",   month);map.put("y", MsgCount);list.add(map);
				

				
				
			}


//System.out.println("kkkkkkkkqqq"+newList1);

//System.out.println("kkkkkkkk"+newList.toArray()[1]);

		String dataPoints = gsonObj.toJson(list);
		String monthName = gsonObj.toJson(year);
		
		String dataPoints1 = gsonObj.toJson(list1);
		//String monthName = gsonObj.toJson(year);

%>











<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Year Analysis"
	},
	axisX:{
		valueFormatString: "MMM",
		crosshair: {
			enabled: true,
			snapToDataPoint: true
		}
	},
	axisY: {
		title: "Amount of Messages",
		includeZero: true,
		crosshair: {
			enabled: true
		}
	},
	toolTip:{
		shared:true
	},  
	legend:{
		cursor:"pointer",
		verticalAlign: "bottom",
		horizontalAlign: "left",
		dockInsidePlotArea: true,
		itemclick: toogleDataSeries
	},
	data: [{
		type: "line",
		showInLegend: true,
		name: "2021",
		markerType: "square",
		xValueFormatString: "DD MMM, YYYY",
		color: "#F08080",
		dataPoints: <%out.print(dataPoints);%>
		
	},{
		type: "line",
		showInLegend: true,
		name: "2018",
		markerType: "square",
		xValueFormatString: "DD MMM, YYYY",
		color: "#F08080",
		dataPoints1: <%out.print(dataPoints1);%>
	}
]
});
chart.render();

function toogleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else{
		e.dataSeries.visible = true;
	}
	chart.render();
}

}
</script>


<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>