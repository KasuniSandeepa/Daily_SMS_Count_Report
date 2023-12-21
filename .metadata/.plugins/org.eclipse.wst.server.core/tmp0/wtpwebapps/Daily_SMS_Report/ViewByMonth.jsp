
<%@page import="Operations.SMSdb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="modle.Account"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Insert title here1</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
<%
    String month = request.getParameter("month");

	ArrayList<Account> accounts;
	ArrayList<String> dates = new ArrayList();
	ArrayList<Account> accountsCount = new ArrayList();
	ArrayList<String> accountNames = new ArrayList();
	ArrayList<String> newAccountNames = new ArrayList();


    if(month==null){
    	accounts= SMSdb.ViewDatabyMonthly("1");
    	   
    }else{
    	
    	accounts=SMSdb.ViewDatabyMonthly(month);
    }
    
    for (Account values : accounts) {

		accountNames.add(values.getAccountName());
		System.out.println("ggggg"+values);

	}

	for (String values : accountNames) {

		if (!newAccountNames.contains(values)) {
			newAccountNames.add(values);
		}

	}
    
    Calendar cal = Calendar.getInstance();
	cal.set(Calendar.MONTH, (Integer.parseInt(month) - 1));
	cal.set(Calendar.DAY_OF_MONTH, 1);
	int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	System.out.println(df.format(cal.getTime()));
	
	for (int i = 0; i < maxDay; i++) {
		
		cal.set(Calendar.DAY_OF_MONTH, i + 1);
		System.out.println(df.format(cal.getTime()));
		
		for(Account value : accounts){
			
			if(value.getDate().equals(df.format(cal.getTime()))){
				System.out.println("Equalll");
			Account account = new Account(value.getAccountName() ,df.format(cal.getTime()), value.getMsgCount());	
				accountsCount.add(account);
			}
			else{
				
				System.out.println("Not");
				Account account = new Account(value.getAccountName() ,df.format(cal.getTime()) , 0);
			
						accountsCount.add(account);
					
			}
			
		}
		
		dates.add(df.format(cal.getTime()));
	}


    
   
    application.setAttribute("dates", dates);
	;
	application.setAttribute("accountNames", newAccountNames);
	application.setAttribute("accountsCount", accountsCount);
    

   

%> 
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
	<br>

	<div class="container">
		<div class="text-center"></div>
		
			<form action="ViewByMonth.jsp"  name="add" method="post">
			<div class="input-group">
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
		<table class="table table-fluid" id="myTable">
		
		
		 <thead>
					<tr>
						
						<th>Account Name</th>
						<c:forEach var="dates" items="${dates}">
						<th>"${dates}"</th>
						</c:forEach>
						
					</tr>
					 </thead>
					 <tbody>
					 
					 	<%
						
					 				%>
					
					
					<c:forEach var="accountNames" items="${accountNames}">
				
						<tr>
					
							<td>${accountNames}</td>
						
						   
							<c:forEach var="accountsCount" items="${accountsCount}">
							 <c:forEach var="dates" items="${dates}">
						    <c:if test="${accountsCount.getAccountName() == accountNames && accountsCount.getDate()==dates}">
						  
								<td>${accountsCount.getMsgCount()}</td>
							</c:if>
								<td>No</td>
							</c:forEach>
							</c:forEach>
									
									
						</tr>
								
							
								
							</c:forEach>
					
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
    $('#myTable').DataTable();
} );
    </script>

<br><br><br><br>

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