<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Earbuds | Search Friends</title>
</head>
<body>

	<div align="right">
		<a class="btn btn-primary btn-std" href="homepage.do" role="button">
			Home </a> <a class="btn btn-primary btn-std" href="profile.do"
			role="button"> Profile </a> <a class="btn btn-primary btn-std"
			href="settings.do" role="button"> Settings </a> <a
			class="btn btn-primary btn-std" href="logout.do" role="button">
			Logout </a>

		<form action="findUsers.do" method="GET">
			<input type="text" name="searchUserInput" placeholder="Find Friends">
			<button type="submit" value="Search">Search Users</button>
		</form>
	</div>

	<div class="container" align="center">
		<c:choose>

			<c:when test="${not empty profiles}">
				<table>
					<tr>
						<td colspan="2"><strong>Search Results</strong></td>
					</tr>

					<c:forEach var="profile" items="${profiles}">
						<tr>

							<td><c:if test="${not empty profile.image}">
									<img src="${profile.image }"
										alt="Photo of ${profile.firstName}" width="150" height="150">
								</c:if>
								<p>${profile.firstName }${profile.lastName}</p></td>
							<td>
								<form action="addFriend.do">
									<input type="submit" value="Send Friend Request">
								</form>
							</td>
						</tr>
					</c:forEach>

				</table>
			</c:when>

			<c:otherwise>
				<em>No Results Matching Your Search.</em>
			</c:otherwise>

		</c:choose>
	</div>

</body>
</html>