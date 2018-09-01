<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Earbuds | Log In or Sign Up</title>
</head>
<body>

	<h1>Earbuds</h1>

	<h2>Log In</h2>
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

	<h2>Sign Up</h2>
	<form:form action="signUp.do" method="POST" modelAttribute="userSignUp">
		<table>
			<tr>
				<td><form:label path="username1">Username:</form:label></td>
				<td><form:input path="username1" /></td>
				<td><form:errors path="username1" /></td>
			</tr>
			<tr>
				<td><form:label path="password1">Password:</form:label></td>
				<td><form:input path="password1" /></td>
				<td><form:errors path="password1" /></td>
			</tr>
			<tr>
				<td><form:label path="email">Email:</form:label></td>
				<td><form:input path="email" /></td>
				<td><form:errors path="email" /></td>
			</tr>
		</table>
		<input type="submit" value="Sign Up">
	</form:form>

	<form action="logout.do">
		<input type="submit" value="Log Out" />
	</form>

</body>
</html>