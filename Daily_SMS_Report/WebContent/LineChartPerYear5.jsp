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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-3.3.1.min.js">
	
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
	
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
	 
	 for(List v : mapList){
		 
		 System.out.println("ggggggggggggggg"+v);
	 }
	
	 
	 List<Map<Object, Object>> list1 = new ArrayList<Map<Object, Object>>();
	 List<Map<Object, Object>> list2 = new ArrayList<Map<Object, Object>>();
	 List<Map<Object, Object>> list3 = new ArrayList<Map<Object, Object>>();
	 List<Map<Object, Object>> list4 = new ArrayList<Map<Object, Object>>();
	 List<Map<Object, Object>> list5 = new ArrayList<Map<Object, Object>>();
	 
	 list1 =  mapList.get(0);
	 list2 =  mapList.get(1);
	 list3 =  mapList.get(2);
	 list4 =  mapList.get(3);
	 list5 =  mapList.get(4);
	 
	 for(int i = 0 ; i < 5 ; i++){
		 System.out.println( "bbbbbbbbbbbbbbbbb"+mapList.get(i));
	 }
	 
	 String dataPoints = gsonObj.toJson( list1);
	String dataPoint1 = gsonObj.toJson( list2);
	String dataPoint2 = gsonObj.toJson( list3);
	String dataPoint3 = gsonObj.toJson( list4);
	String dataPoint4 = gsonObj.toJson( list5);
	// String dataPoint2 = gsonObj.toJson( mappedData.get("2018"));
	
	System.out.println("dddd"+ mapList);
	
	%>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
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
	
	
	
};

	function drawMultipleLineChart(formatteddata){
		 var chart = new CanvasJS.Chart("chartContainer",
				    {
				      title:{
				      text: "Multi-Series Line Chart"  
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

</body>
</html>