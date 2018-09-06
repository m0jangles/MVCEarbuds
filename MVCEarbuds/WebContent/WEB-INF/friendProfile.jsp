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
<title>Earbuds | Friend Profile</title>
</head>
<body>
	<div class="container">
		<h2>Profile Page</h2>

		<a class="btn btn-primary btn-std" href="settings.do" type="button">
			Settings </a> <a class="btn btn-primary btn-std" href="logout.do"
			type="button"> Logout </a> <a class="btn btn-primary btn-std"
			href="homepage.do" type="button"> Home </a>
		<p>
		<form action="viewPlaylists.do" method="GET">
			<input type="hidden" name="id" value="${otherUser.profile.id }">
			<button type="submit" value="View Playlists">Playlists</button>
			</p>

		</form>

		<p>Create Post</p>

		<img src="${otherUser.profile.image}" width="300">

		<p>${otherUser.profile.firstName}${otherUser.profile.lastName}</p>

		<p>${otherUser.profile.location.city},
			${otherUser.profile.location.state}<br>
			${otherUser.profile.location.country}
		</p>
	</div>

	<c:forEach var="playlist" items="${playlists }">
		<tr>
			<td colspan="5" align="center"><strong> <a
					href="getSongs.do?id=${otheruser.profile.playlist.id }">${otheruser.profileplaylist.playlistName}</a>
			</strong></td>
		</tr>

		<form action="getSongs.do" method="GET">
			<input type="hidden" name="id" value="${otheruser.profileplaylist.id }">
			<button type="submit" value="View Songs">View Songs</button>
		</form>
	</c:forEach>

</body>
</html>