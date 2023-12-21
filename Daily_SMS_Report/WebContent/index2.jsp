<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="jquery-3.3.1.min.js">
	
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<meta charset="ISO-8859-1">
<title>Insert title here1</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #4CAF50;}

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
</head>
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
							class="nav-link text-uppercase text-expanded" id="active"
							href="index.jsp">Home </a></li>
						<li class="l">
						<li class="l"><a
							class="nav-link text-uppercase text-expanded" href="MainMenu.jsp">View</a></li>
						</li>
						</li>


						<div class="col-md-3.0 float-right"></div>
					</ul>

				</div>
			</div>
	</div>
	</nav>
	</div>
	<br>

	<div class="container">
		<div class="text-center"></div>

		<h2>Upload Data File</h2>

		<div class="alert success" id="x" style="display: none;">
			<span class="closebtn">&times;</span> <strong>Success!</strong>
			Successfully Uploaded
		</div>



		<div class="col-md-3"></div>


		<div class="row">
			<div class="col-md-12">


				<div class="col-md-2 float-right">


					<a href="View.jsp"><input type="button" class="btn btn-warning"
						value="View Data"></a> <br>

				</div>

				<br> <br>

				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> Select The Date &nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <input id="datetxt"
						type="date" class="form-control" name="date" required>
				</div>
				<br> <input type="file" name="file" id="file1"> </br> <br>
				<input type="button" value="Upload" name="upload" id="upload"
					onclick="Success(document.getElementById('file1').value);" />
				<!-- <input type="submit" value="Upload" name="upload" id="upload"  />-->


				<%
					String file_name = (String) request.getParameter("file");
				if (file_name != null) {
					out.println(file_name + " File uploaded successfuly");

				}
				%>
				<br> <br>






			</div>
		</div>
	</div>

	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#upload").click(function() {

				var fd = new FormData();
				var files = $('#file1')[0].files;

				fd.append('fileAny', $('#file1')[0].files[0]);
				fd.append('date', $('#datetxt').val());
				fd.append('userId', '1');

				// Check file selected or not
				if (files.length > 0) {
					//fd.append('file1',files[0]);

					$.ajax({
						url : './FileAnyUploader',
						type : "POST",
						enctype : 'multipart/form-data',
						data : fd,
						processData : false,
						contentType : false,
						cache : false,
						timeout : 600000,
						success : function(data) {

							console.log(data)

						},
						error : function(e) {

							console.log(e)
						}
					});
				} else {
					alert("Please select a file.");
				}
			});
		});
	</script>
	<script type="text/javascript">
		function Success(fileName) {

			if (fileName != null) {
				document.getElementById('x').style.display = "block";
			}

		}
		
		var close = document.getElementsByClassName("closebtn");
		var i;

		for (i = 0; i < close.length; i++) {
		  close[i].onclick = function(){
		    var div = this.parentElement;
		    div.style.opacity = "0";
		    setTimeout(function(){ div.style.display = "none"; }, 600);
		    
		  }
		}

	</script>
	<br>
	<br>
	<br>
	<br>
	<br>

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