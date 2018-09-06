<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Earbuds | Log In or Sign Up</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="login.do">Earbuds</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid text-center">
	<h1>Welcome</h1>
	<fieldset style="display: inline; box-shadow: 5px 5px 10px gray;">
		<legend> Log In </legend>
		<form:form action="login.do" method="POST" modelAttribute="user">
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
			</table>
			<input type="submit" value="Log In">
		</form:form>
	</fieldset>

	<fieldset style="display: inline; box-shadow: 5px 5px 10px gray;">
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
			<input type="submit" value="Sign Up">
		</form:form>
	</fieldset>

	<c:if test="${wasSignUpSuccessful}">
		<p>User sign up was successful!</p>
	</c:if>
</div>

</body>
</html>