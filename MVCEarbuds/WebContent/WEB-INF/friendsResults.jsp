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
<title>Earbuds | Search Friends</title>
</head>
<style>
.searchResults {
	text-align: center;
	color: white;
}

body {
	background-image: url("images/resultsbackground.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

.container1 {
	background: black;
}

.container {
	
}

.vid {
	position: relative;
	padding-bottom: 56.25%;
	padding-top: 30px;
	height: 0;
	overflow: hidden;
}

.vid iframe, .vid object, .vid embed {
	position: absolute;
	top: 50px;
	left: 100px;
	width: 70%;
	height: 70%;
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
				<a class="navbar-brand" href="homepage.do">Earbuds</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="homepage.do">Home</a></li>
					<li><a href="profile.do">Profile</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.do"><span
							class="glyphicon glyphicon-log-in"></span>Logout</a></li>
				</ul>
				<form:form class="navbar-form navbar-right" method="GET"
					action="findUsers.do">
					<div class="form-group">
						<input type="text" class="form-control" name="searchUserInput"
							placeholder="Find Users">
					</div>
					<button type="submit" class="btn btn-default">Find Users</button>
				</form:form>
				<form:form class="navbar-form navbar-right" method="GET"
					action="findSongs.do">
					<div class="form-group">
						<input type="text" class="form-control" name="searchSongInput"
							placeholder="Search Music">
					</div>
					<button type="submit" class="btn btn-default">Search Music</button>
				</form:form>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>

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
									<a href="friendProfile.do?friendID=${profile.user.id}">
										<img src="${profile.image }" alt="Photo of ${profile.firstName}" width="150" height="150">
									</a>
								</c:if>
								<p>${profile.firstName } ${profile.lastName}</p></td>
							<td>
								<form action="addFriend.do" method="POST">
									<button type="submit" class="btn btn-sm btn-default">Send Friend Request</button><input
										type="hidden" name="friendId" value="${profile.user.id}">
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