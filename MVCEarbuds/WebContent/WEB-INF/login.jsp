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
						<input type="text" class="form-control" name="password"
							placeholder="Password" required>
					</div>
					<button type="submit" class="btn btn-default">Sign In</button>
				</form:form>
				<%--End Login Form --%>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	<div class="container-fluid text-center">
		<h1>Welcome</h1>
		<%-- <fieldset style="display: inline; box-shadow: 5px 5px 10px gray;">
			<legend> Sign Up </legend>
			<form:form action="signUp.do" method="POST"
				modelAttribute="userSignUp">
				<table>
					<tr>
						<td><form:label path="username">Username:</form:label></td>
						<td><form:input path="username" /></td>
						<td><form:errors path="username" /></td>
					</tr>
					<tr>
						<td><form:label path="password">Password:</form:label></td>
						<td><form:input path="password" /></td>
						<td><form:errors path="password" /></td>
					</tr>
					<tr>
						<td><form:label path="email">Email:</form:label></td>
						<td><form:input path="email" /></td>
						<td><form:errors path="email" /></td>
					</tr>
					<tr>
						<td><label for="firstName">First Name:</label></td>
						<td><input type="text" name="firstName"></td>
					</tr>
					<tr>
						<td><label for="lastName">Last Name:</label></td>
						<td><input type="text" name="lastName"></td>
					</tr>
				</table>
				<button type="submit" class="btn btn-primary">Sign Up</button>
			</form:form>
		</fieldset> --%>
		<form action="signUp.do" method="POST" modelAttribute="userSignUp">
			<div class="form-row">
				<div class="col-md-4 mb-1">
					<label for="username">Username:</label> <input type="text"
						class="form-control" name="username" required />
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-1">
					<label for="password">Password:</label> <input type="text"
						class="form-control" name="password" required />
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-1">
					<label for="email">Email:</label> <input type="text"
						class="form-control" name="email" required />
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-1">
					<label for="firstName">First Name:</label> <input type="text"
						class="form-control" name="firstName">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-1">
					<label for="lastName">Last Name:</label> <input type="text"
						class="form-control" name="lastName">
				</div>
			</div>


			<button type="submit" class="btn btn-primary">Sign Up</button>
		</form>

		<c:if test="${wasSignUpSuccessful}">
			<p>User sign up was successful!</p>
		</c:if>
	</div>

	<c:if test="${wasSignUpSuccessful}">
		<p>User sign up was successful!</p>
	</c:if>
	</div>

</body>
</html>