<%@page import="java.util.TreeMap"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML>
<html>
<head>  
<%
ArrayList<Account> _AccountDetails = new ArrayList<>();
ArrayList<Account> toRemoveAccounts = new ArrayList<>();

boolean isSuccess;
Connection connection;
Statement statement;
ResultSet resultSet;

String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "Sepetember", "October",
		"November", "December"};

Gson gsonObj = new Gson();
Map<Object, Object> map = null;
List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
List<Map<Object, Object>> list1 = new ArrayList<Map<Object, Object>>();
List<List<Map<Object, Object>>> mapList = new ArrayList<List<Map<Object, Object>>>();

try {

	// Call to the database connection
	connection = DBConnection.GetConnection();


	statement = connection.createStatement();

	
	String _Sql = "SELECT Year(Date) ,Month(Date) , sum(Msg_Count) FROM daily_sms_report.account  group by MONTH(Date) , Year(Date)";
	
	resultSet = statement.executeQuery(_Sql);

	if (resultSet.next()) {

		
		System.out.println("in in");

		do {
	System.out.println("hhhhhhhhhhh");
	
	String _YearNumber = resultSet.getString(1);
	String _MonthNumber = resultSet.getString(2);
	int _MsgCount = resultSet.getInt(3);

	Account account = new Account(_YearNumber  ,_MonthNumber, _MsgCount);// Store the results in

	_AccountDetails.add(account);

		} while (resultSet.next()); 
	}

} catch (Exception e) {

	e.printStackTrace();
}
ArrayList<String> yearList = new ArrayList();
for(Account value : _AccountDetails){
	yearList.add(value.getAccountName());
}

for(String value : yearList){
	System.out.println("Yearsss"+value);
}

Set<String> set = new LinkedHashSet<>();
Map yearMap = new HashMap<String , Account>();
set.addAll(yearList);
yearList.clear();
yearList.addAll(set);

for(String value : yearList){
	System.out.println("Yearsss111111111111"+value);
}

TreeMap<String, List<Account>> all = new TreeMap<>();

for(String value : yearList){
	ArrayList<Account> yearList1 = new ArrayList();
	for(Account e : _AccountDetails){
		if(value.equals(e.getAccountName())){
			
			yearList1.add(e);
			
		}
	}
	
	all.put(value , yearList1);
	
	
	
}


Set<Map.Entry<String, List<Account>>> entries = all.entrySet();

for (Map.Entry<String, List<Account>> entry : entries) {

	System.out.println("Year" + entry.getKey());
	
	for(Account data : entry.getValue()){
		 System.out.println(data.toString());
		
	}
	
	System.out.println();
	

}

for (Map.Entry<String, List<Account>> entry : entries) {

	System.out.println("Year" + entry.getKey());
	for (int i = 0; i < months.length; i++) {
	for(Account data : entry.getValue()){
		 System.out.println("Month" + data.getDate() + " Msg Count "+ data.getMsgCount());
		 int tempI = i + 1;
		 int month = Integer.parseInt(data.getDate());
		
		 if (month == tempI) {
				System.out.println("----msg Countss" + data.getMsgCount());
				map = new HashMap<Object, Object>();
				map.put("label", months[i]);
				map.put("y", data.getMsgCount());
				list.add(map);
				toRemoveAccounts.add(data);
				//_AccountDetails.remove(value);
				//iter.remove();
			} else {
				System.out.println("----msg else" + data.getMsgCount());
				map = new HashMap<Object, Object>();
				map.put("label", months[i]);
				map.put("y", 0);
				list.add(map);
			}
	}
	}
	
	mapList.add(list);
	System.out.println();
	

}




for(List e : mapList){
	
	System.out.println("list data " + e);
	System.out.println();
	
	
}







%>
  <script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      title:{
      text: "Multi-Series Line Chart"  
      },
      data: [
      {        
        type: "line",
        name: "Engine A",
        showInLegend: true,
        dataPoints:[
        { x: 10, y: 37 },
        { x: 20, y: 35},
        { x: 30, y: 100 },
        { x: 40, y: 35 },
        { x: 50, y: 35 },
        { x: 60, y: 38 },
        { x: 70, y: 50 },
        { x: 80, y: 34 },
        { x: 90, y: 44}
      
        ]
      },
        {        
        type: "line",
        dataPoints: [
        { x: 10, y: 31 },
        { x: 20, y: 35},
        { x: 30, y: 30 },
        { x: 40, y: 35 },
        { x: 50, y: 35 },
        { x: 60, y: 38 },
        { x: 70, y: 38 },
        { x: 80, y: 34 },
        { x: 90, y: 44}
      
        ]
      },
        {        
        type: "line",
        dataPoints: [
        { x: 10, y: 45 },
        { x: 20, y: 50},
        { x: 30, y: 40 },
        { x: 40, y: 45 },
        { x: 50, y: 45 },
        { x: 60, y: 48 },
        { x: 70, y: 43 },
        { x: 80, y: 41 },
        { x: 90, y: 28}
      
        ]
      },
        {        
        type: "line",
        dataPoints: [
        { x: 10, y: 71 },
        { x: 20, y: 55},
        { x: 30, y: 50 },
        { x: 40, y: 65 },
        { x: 50, y: 95 },
        { x: 60, y: 68 },
        { x: 70, y: 28 },
        { x: 80, y: 34 },
        { x: 90, y: 14}
      
        ]
      }
      ]
    });

    chart.render();
  }
  </script>
 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script></head>
<body>
  <div id="chartContainer" style="height: 300px; width: 100%;">
  </div>
</body>
</html>