<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main Menu</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="{{ URL::asset('/css/business-casual.min.css') }}"
	rel="stylesheet" type="text/css">
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
							class="nav-link text-uppercase text-expanded" href="index.jsp">Home
						</a></li>
						<li class="l"><a
							class="nav-link text-uppercase text-expanded" id="active"
							href="MainMenu.jsp">View</a></li>
						</li>
				</div>
				</ul>

			</div>
	</div>
	</div>
	</nav>
	</div>
	<br>
	<div class="container-lg pt-5">




		<div class="card-deck">
			<!--Charts-->


			<!--View Summary By Month for table-->
			<div class="card"
				style="height: 15rem; width: 15rem; background-color: #ffffcc">

				<div class="card-body">
					<h4 class="card-title" style="align: center;">
						<center>View Summary By Month</center>
					</h4>
					<br>
					<br>
					<center>
						<a href="View.jsp" class="btn btn-primary">Enter</a>
					</center>
				</div>
			</div>





			<!--View Summary By Date for table-->
			<div class="card"
				style="height: 15rem; width: 15rem; background-color: #ffffcc">

				<div class="card-body">
					<center>
						<h4 class="card-title">View Summary By Date</h4>
					</center>
					<br>
					<center>
						<a href="View2.jsp" class="btn btn-primary">Enter</a>
						<center>
				</div>
			</div>

			<!--View Summary Main Table-->
			<div class="card"
				style="height: 15rem; width: 15rem; background-color: #ffffcc">

				<div class="card-body">
					<h4 class="card-title" style="align: center;">
						<center>Main Table</center>
					</h4>
					<br>
					<center>
						<a href="test7.jsp" class="btn btn-primary">Enter</a>
					</center>
				</div>
			</div>


		</div>
		<br>

	</div>
	</div>
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