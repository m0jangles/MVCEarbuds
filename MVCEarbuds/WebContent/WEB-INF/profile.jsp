<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Earbuds | Profile</title>
</head>
<body>
	<div class="container">
		<h2>Profile Page</h2>

		<a class="btn btn-primary btn-std" href="settings.do" type="button"> Settings </a>
		<a class="btn btn-primary btn-std" href="logout.do" type="button"> Logout </a>
		<a class="btn btn-primary btn-std" href="homepage.do" type="button"> Home </a>
		<p>

			<form action="viewPlaylists.do" method="GET"><input type="hidden" name="id" value="${UserInSession.profile.id }">
			<button type="submit" value="View Playlists">Playlists</button>
		</p>
		
		</form>

		<p>Create Post</p>

		<img src="${UserInSession.profile.image}" width="300">

		<p>${UserInSession.profile.firstName}
			${UserInSession.profile.lastName}</p>

		<p>${UserInSession.profile.location.city},
			${UserInSession.profile.location.state}<br>
			${UserInSession.profile.location.country}
		</p>
	</div>
	<div class="container">
	<c:forEach var="friend" items="${UserInSession.friends}">
	${friend.profile.firstName} ${friend.profile.lastName }
	</c:forEach>
	</div>
	
	

</body>
</html>