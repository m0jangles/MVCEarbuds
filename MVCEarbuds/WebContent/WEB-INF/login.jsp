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
.jumbotron {
	margin-top: 0px;
	position: relative;
	background: url("https://i.redd.it/3euvmc3uumxz.png") center
		no-repeat;
	min-height: 500px;
	background-size: 150%;
}
.jumbotron h1 {
	text-align: left;
	color: white;
	font-size: 2.7em;
	margin-top: 50px;
	margin-left: -20px;
}

.jumbotron-content {
	color: white;
	position: absolute;
	right: 0;
	top: 0;
	padding: 0px 15px;
	width: 25%;
	height: 100%;
	background-color: rgba(0, 0, 0, .75);
	border-radius: 5px;
}

.jumbotron-content h3 {
	margin-top: 5%;
	text-align: center;
	color: white;
	font-size: 1.75em;
}

.jumbotron .btn {
	padding: 5px 5%;
	margin: 5% 20%;
}
.jumbotron-content label {
  color: white;
  font-size: 1em;
}

@media ( min-width : 992px) {
	.jumbotron .btn {
		padding: 5px 10%;
	}
}

@media ( max-width : 991px) {
	.jumbotron-content {
		position: absolute;
		height: 100%;
	}
}

@media ( max-width : 768px) {
	.jumbotron {
		background-size: 100% 100%;
	}
	.jumbotron-content {
		top: 0;
		height: 100%;
		width: 37%;
	}
	.jumbotron .btn {
		font-size: 0.85em;
		padding: 8px 5%;
		max-width: 65px;
	}
}

body {
	background-color: lightblue;
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
					<button type="submit" class="btn btn-primary btn-std">Sign
						In</button>
				</form:form>
				<%--End Login Form --%>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	<div class="container-fluid">

		<div class="jumbotron">
		<h1>
			Welcome To Earbuds!
		</h1>

			<div class="jumbotron-content">
					<h3>Sign Up</h3>
				<form class="form-group" action="signUp.do" method="POST"
					modelAttribute="userSignUp">
					<div class="form-group">
						<label class="control-label" for="username" class="font">Username:</label>
						<input type="email" class="form-control" name="username"
							placeholder="Username" required />
					</div>
					<div class="form-group">
						<label class="control-label" for="password">Password:</label> <input
							type="password" class="form-control" name="password"
							placeholder="Password" required />
					</div>
					<div class="form-group">
						<label class="control-label" for="email">Email:</label> <input
							type="text" class="form-control" name="email" placeholder="Email"
							required />
					</div>
					<div class="form-group">
						<label class="control-label" for="firstName">First Name:</label> <input
							type="text" class="form-control" name="firstName"
							placeholder="First Name">
					</div>
					<div class="form-group">
						<label class="control-label" for="lastName">Last Name:</label> <input
							type="text" class="form-control" name="lastName"
							placeholder="Last Name">
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-std">Sign
							Up!</button>
					</div>
				</form>
			</div>
		</div>

		<c:if test="${wasSignUpSuccessful}">
			<p>User sign up was successful!</p>
		</c:if>
	</div>
</body>
</html>

