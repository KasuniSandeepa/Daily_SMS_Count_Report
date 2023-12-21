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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

    <script
  src="http://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script>
  
  <style>
  td
	{
		height:0.1px;
	}
  </style>
</head>
<body>
<% 
	 TreeMap<String,List<Data>> all = new TreeMap<>();
	SMSdb db = new SMSdb();
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	ArrayList<String> dates = new ArrayList();
	ArrayList<String> totalCounts = new ArrayList();
	String totalCountPermonth = "0";
	
	if(month==null){
		
		month = "1";
	}
	if(year==null){
		year = "2021";
	}
	
	System.out.println("Yearrrrrrrrrrrrrrrrrrrrr :"+year);
	 ArrayList<String> accountNames = new ArrayList();
		ArrayList<String> newAccountNames = new ArrayList();
	ArrayList<Account> accNames = new ArrayList();

	    if(month==null){
	    	accNames= SMSdb.ViewDatabyMonthly1("1", "2021");
	    	totalCountPermonth=db.TotalMsgsPerMonth("1");
	    	   
	    }else{
	    	
	    	accNames=SMSdb.ViewDatabyMonthly1(month , year);
	    	totalCountPermonth=db.TotalMsgsPerMonth(month);
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
    String today =  df1.format(dateobj);
    
    //Get the date of current date and month and year
    DateFormat df2 = new SimpleDateFormat("yyyy-MM");
    String today1 =  df2.format(dateobj);
    
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	System.out.println(df.format(cal.getTime()));
	String date = df.format(cal.getTime());
	
	SimpleDateFormat df3 = new SimpleDateFormat("yyyy-MM");
	System.out.println(df3.format(cal.getTime()));
	String date1 = df3.format(cal.getTime());
	
	System.out.println("Current Date : "+today);
	System.out.println("Current Date dddd : "+today1);
	System.out.println("Selected Date : "+date);
	
	if(date1.equals(today1)){
	for (int i = 0; i < Integer.parseInt(today); i++) {
   // ResultSet query = DBConnection.getDbCon().query("select * from acc where month(date)='3' and day(date)='"+i+"'");
    ArrayList<Account> accounts = db.ViewDatabyMonthDate1(month,  year, String.valueOf(i+1));
    List<String> names = new ArrayList<>();
    for(Account var : accounts){
    	names.add(var.getAccountName());
    }
    List<Data> a = new ArrayList<>();
    
    cal.set(Calendar.DAY_OF_MONTH, i + 1);
	dates.add(df.format(cal.getTime()));
	String MsgCount = db.TotalMsgsPerDay(df.format(cal.getTime()));
	totalCounts.add( MsgCount);
	
	for(String v : newAccountNames){
   
		
    	if(names.contains(v)){
    
    	for(Account x : accounts){
    	
    		if(x.getAccountName().equals(v)){
    	a.add(new Data(x.getAccountName() , String.valueOf(x.getMsgCount()) , df.format(cal.getTime())));
    		}
    	}
    	}
    	else{
    		
    		a.add(new Data(v , "0" , df.format(cal.getTime())));
    	}
    	
	}
    	
    	
   all.put(df.format(cal.getTime()),a);
	}}else{
		for (int i = 0; i < maxDay; i++) {
			   // ResultSet query = DBConnection.getDbCon().query("select * from acc where month(date)='3' and day(date)='"+i+"'");
			    ArrayList<Account> accounts = db.ViewDatabyMonthDate1(month,  year, String.valueOf(i+1));
			    List<String> names = new ArrayList<>();
			    for(Account var : accounts){
			    	names.add(var.getAccountName());
			    }
			    List<Data> a = new ArrayList<>();
			    
			    cal.set(Calendar.DAY_OF_MONTH, i + 1);
				dates.add(df.format(cal.getTime()));
				String MsgCount = db.TotalMsgsPerDay(df.format(cal.getTime()));
				totalCounts.add( MsgCount);
				
				for(String v : newAccountNames){
			   
					
			    	if(names.contains(v)){
			    
			    	for(Account x : accounts){
			    	
			    		if(x.getAccountName().equals(v)){
			    	a.add(new Data(x.getAccountName() , String.valueOf(x.getMsgCount()) , df.format(cal.getTime())));
			    		}
			    	}
			    	}
			    	else{
			    		
			    		a.add(new Data(v , "0" , df.format(cal.getTime())));
			    	}
			    	
				}
			    	
			    	
			   all.put(df.format(cal.getTime()),a);
	}
	}
	
	  Set<Map.Entry<String, List<Data>>> entries = all.entrySet();
	  
	  System.out.println("sssssssssssssss "+entries.size());
	  
	  for (Map.Entry<String, List<Data>> entry : entries) {

          //System.out.println("datesss"+entry.getKey());
	}
	
	  
	  for (Map.Entry<String, List<Data>> entry : entries) {
			
		 // System.out.println("Size"+entry.getValue().size());
          if(entry.getValue().size()==0){
              System.out.println("0");
          }else {
              for (Data datas : entry.getValue()) {
                 /// System.out.println(datas.toString());
              }
          }

           ;

       }
	  
	  
	  
	  
	  
	 
		System.out.println(newAccountNames);
	
		System.out.println("Size = "+ 	newAccountNames.size());
		application.setAttribute("newAccountNames", newAccountNames);
		application.setAttribute("dates", dates);
		application.setAttribute("totalCounts", totalCounts);
		application.setAttribute("totalCountPermonth", totalCountPermonth);
		
		//response.sendRedirect("test.jsp");
		//response.sendRedirect(request.getContextPath() + "test.jsp");
%>
	<div class="container">
		<div class="text-center"></div>
		
			<form action="test5.jsp"  name="add" method="post">
			<div class="input-group">
			
			Select the Year<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp; <select id="ddlYears" name="year"></select>
			&nbsp;&nbsp;&nbsp;&nbsp;
		 Select the Month<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> &nbsp;&nbsp;<select name="month"
								 id="bdistrict">
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
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="View"/>
					
							
							</form>
							
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="View2.jsp"><input type="button" class="btn btn-warning"
							value="View Data by Date"></a>
							
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="View3.jsp"><input type="button" class="btn btn-warning"
							value="View Total Message Count Per the Date"></a>
				</div>
							
						
	<br>
		<table class="table table-striped" id="myTable">
		
		
		 <thead>
					<tr>
						
						<th>Account Name</th>
						<%for(int i = 0; i<dates.size();i++){ %>
						<th><%=dates.get(i)%></th>
						<%} %>
						
						<th id="total">Total</th>
					</tr>
					 </thead>
					 <tbody>
					 
					 
					
					
				
						
					
				
						
					
					<%for(int i = 0; i<newAccountNames.size();i++){ %>
					<tr>
							<td><%=newAccountNames.get(i)%></td>
							
							   <%
							  int total = 0;
						
						   for (Map.Entry<String, List<Data>> entry : entries) {
								
						          if(entry.getValue().size()==0){
						              //System.out.println("0");%>
						              <td>0</td>
						                  
						              <% 
						          }else {
						              for (Data datas : entry.getValue()) {
						            	  for(int j = 0; j<dates.size();j++){
						                //  System.out.println(datas.toString());
						               
						                  if(newAccountNames.get(i).equals(datas.getName()) && datas.getDate().equals(dates.get(j))){
						                	  
						                	  %>
						                	  <td  style="text-align:right" class="contribution"><%=datas.getCount()%></td>
						                	  <% 
						                	  total = total + Integer.parseInt(datas.getCount());
						                  }
						                 
						               
						                 
						              }
						          }

						           ;
								}							
						       }
						   
						   
						   %>
						   
					
						<td headers="total"  class="contribution"><%=total%></td>
					
						</tr>
								<%} %>
								
							
							<tr style="background-color: #ff0000">
							<td >Total</td>
							<%
							for(int i =0 ; i < totalCounts.size();i++){
								
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
    $(document).ready( function () {
    $('#myTable').DataTable({
    	
    	"columns": [{
			"type": "number",
			"thousandSeparator": ","
		}]
    	
    });
} );
    
    
    window.onload = function () {
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
    
    $(document).ready( function() {
    	  $("td.contribution").each(function() { $(this).html(parseFloat($(this).text()).toLocaleString('en-US', {maximumFractionDigits:2})); })
    	})
    
   
    </script>
</body>
</html>>