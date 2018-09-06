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
	<div>
		<h2>Profile Page</h2>

		<a class="btn btn-primary btn-std" href="settings.do" type="button">
			Settings </a> <a class="btn btn-primary btn-std" href="logout.do"
			type="button"> Logout </a> <a class="btn btn-primary btn-std"
			href="homepage.do" type="button"> Home </a>

		<p>Create Post</p>

		<img src="${UserInSession.profile.image}" width="300">

		<p>${UserInSession.profile.firstName}
			${UserInSession.profile.lastName}</p>

		<p>${UserInSession.profile.location.city},
			${UserInSession.profile.location.state}<br>
			${UserInSession.profile.location.country}
		</p>
	</div>

<h3>Playlists</h3>
	<div style='overflow: scroll; width: 400px; height: 400px;'>
		<c:choose>
			<c:when test="${not empty playlists }">

				<c:forEach var="playlist"
					items="${playlists }">
					<tr>
						<td colspan="5" align="center"><strong> <a
								href="getSongs.do?id=${playlist.id }">${playlist.playlistName}</a>
						</strong></td>
					</tr>
					<form action="getSongs.do" method="GET">
						<input type="hidden" name="id"
							value="${playlist.id }">
						<button type="submit" value="View Songs">View Songs</button>
					</form>
				</c:forEach>

			</c:when>
			<c:otherwise>
				<br>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</body>
</html>