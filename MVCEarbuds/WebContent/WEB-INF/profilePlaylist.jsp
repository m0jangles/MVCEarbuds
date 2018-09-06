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
<title>Earbuds | Playlists</title>
</head>
<body>
	<div class="container">
		<a class="btn btn-primary btn-std" href="homepage.do" role="button">
			Home </a> <a class="btn btn-primary btn-std" href="profile.do"
			role="button"> Profile </a> <a class="btn btn-primary btn-std"
			href="logout.do" role="button"> Logout </a> <a
			class="btn btn-primary btn-std" href="settings.do" role="button">
			Settings </a>

		<h2>Playlist Page (Temporary Name)</h2>

		<table>
			<tr>
				<td colspan="5" align="center"><strong>${playlistName}</strong></td>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>Song</th>
				<th>Artist</th>
				<th>Album</th>
				<th>Genre</th>
				<th></th>
			</tr>

			<c:forEach var="song" items="${songs}">

				<tr>
					<td><iframe width="200" height="150"
							src="https://www.youtube.com/embed/${song.url}" frameborder="0"
							allow="autoplay; encrypted-media" allowfullscreen> </iframe></td>
					<td><c:if test="${not empty song.albumImage }">
							<img src="${song.albumImage}" height="80" width="80">
						</c:if></td>
					<td>${song.title}</td>
					<td>${song.artist}</td>
					<td>${song.album}</td>
					<td>${song.genresAsString}</td>
				</tr>

			</c:forEach>

		</table>
		<br>
	</div>

</body>
</html>