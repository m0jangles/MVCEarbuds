<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="personalStylesheet" href="Style.css">

<meta charset="UTF-8">
<title>Earbuds | Log In or Sign Up</title>
</head>
<style>
body {
	background-image:
		url("https://i.redd.it/3euvmc3uumxz.png");
		background-repeat: no-repeat;
    	background-attachment: fixed;
    	background-position: center; 
}
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
.font {
	text-align: center;
	color: white;
}

.container1 {
	background: black;
}
label, form {
	color: white;
	
}
</style>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="login.do">Earbuds</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
				</ul>
				<%--Login Form Bootstrap --%>
				<form:form class="navbar-form navbar-right" method="POST"
					action="login.do">
					<div class="form-group">
						<input type="text" class="form-control" name="username"
							placeholder="Username" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Password" required>
					</div>
					<button type="submit" class="btn btn-outline-dark btn-std">Sign
						In</button>
				</form:form>
				<%--End Login Form --%>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	<div class="container-fluid text-center">
	
		<h1 class="font">Welcome To Earbuds!</strong></font></h1>
		<div>
			<h3>Sign Up</h3>
		</div>
		<div class="container-fluid text-center col-md-offset-4">
			<form class="form-horizontal" action="signUp.do" method="POST"
				modelAttribute="userSignUp">
				<div class="form-group" >
					<label class="control-label col-sm-2" for="username">Username:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="username"
							placeholder="Username" required />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password">Password:</label>
					<div class="col-md-4 form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Password" required />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="email"
							placeholder="Email" required />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="firstName">First Name:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="firstName"
							placeholder="First Name">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="lastName">Last
							Name:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="lastName"
							placeholder="Last Name">
					</div>
				</div>
				<div class="col-md-5 text-center">
					<button type="submit" class="btn btn-default btn-lg">Sign
						Up!</button>
				</div>
			</form>
		</div>
	</div>

	<c:if test="${wasSignUpSuccessful}">
		<p>User sign up was successful!</p>
	</c:if>
</body>
</html>