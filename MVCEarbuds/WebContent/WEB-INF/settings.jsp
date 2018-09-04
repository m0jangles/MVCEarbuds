<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Earbuds | Settings</title>
</head>
<body>

	<h3>Settings</h3>

	<p>
		<a href="homepage.do">Home</a> <a href="profile.do">Profile</a> <a
			href="logout.do">Logout</a>
	</p>

	<fieldset style="display: inline; box-shadow: 5px 5px 10px gray;">
		<legend> Update Profile </legend>
		<form action="updateProfile.do" method="POST">
			<table>
				<tr>
					<td><label for="firstName">First Name:</label></td>
					<td><input type="text" name="firstName"
						value="${UserInSession.profile.firstName}"></td>
				</tr>
				<tr>
					<td><label for="lastName">Last Name:</label></td>
					<td><input type="text" name="lastName"
						value="${UserInSession.profile.lastName}"></td>
				</tr>
				<tr>
					<td><label for="image">Profile Picture URL:</label></td>
					<td><input type="text" name="image"
						value="${UserInSession.profile.image}"></td>
				</tr>
				<tr>
					<td><label for="locationCity">City:</label></td>
					<td><input type="text" name="locationCity"
						value="${UserInSession.profile.location.city}"></td>
				</tr>
				<tr>
					<td><label for="locationState">State:</label></td>
					<td><input type="text" name="locationState"
						value="${UserInSession.profile.location.state}"></td>
				</tr>
				<tr>
					<td><label for="locationCountry">Country:</label></td>
					<td><input type="text" name="locationCountry"
						value="${UserInSession.profile.location.country}"></td>
				</tr>
			</table>
			<input type="submit" value="Update Profile" /> <input type="hidden"
				name="updateID" value="${UserInSession.profile.id}" />
		</form>
	</fieldset>

	<p>
		${UserInSession} <br> ${UserInSession.profile}
	</p>

</body>
</html>