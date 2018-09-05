<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Earbuds | Log In or Sign Up</title>
</head>
<body>

	<h1>Earbuds</h1>

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

</body>
</html>