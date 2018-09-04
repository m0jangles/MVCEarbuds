<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Earbuds | Homepage</title>
</head>
<body>

	<h2>Homepage</h2>

	<a href="profile.do">Profile</a>

	<a href="logout.do">Logout</a>
	<br>
	<form action="viewPlaylists.do" method="GET">
		<input type="hidden" name="id" value="${UserInSession.profile.id }">
		<button type="submit" value="View Playlists">View Playlists</button>
	</form>


	<c:choose>
		<c:when test="${not empty playlists }">
			<ul>
				<c:forEach var="playlist" items="${playlists }">
					<li>${playlist.playlistName }
						<form action="getSongs.do" method="GET">
							<input type="hidden" name="id" value="${playlist.id }">
							<button type="submit" value="View Songs">View Songs</button>
						</form>
						<form action="addSong.do" method="POST">
						<input type="hidden" name="playlistId" value="${playlist.id }">
						<input type="text" name="title" placeholder="Title">
						<input type="text" name="album" placeholder="Album">
						<input type="text" name="albumImage" placeholder="Image URL">
						<input type="text" name="url" placeholder="YouTube URL">
						<input type="text" name="artist" placeholder="Artist">
						<button type="submit" value="Add Song">Add Song</button>
						</form>
						<form action="removePlaylist.do" method="POST">
							<input type="hidden" name="playlistId" value="${playlist.id }">
							<button type="submit" value="Delete Playlist">Delete this playlist</button>
						</form>
					</li>
				</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<br>
			<form action="newPlaylist.do" method="POST">
				<input type="hidden" name="playlistProfileId" value="${UserInSession.profile.id }">
				<input type="text" name="name" placeholder="Name your playlist">
				<button type="submit" value="New Playlist">Create New
					Playlist</button>
			</form>
		</c:otherwise>
	</c:choose>

	<c:forEach var="song" items="${songs }">

		<img src="${song.albumImage }">

		<h3>
			<strong> Artist: </strong>
		</h3>
		<p>${song.artist }</p>
		<h4>
			<strong>Title: </strong>
		</h4>
		<p>${song.title }</p>
		<h4>
			<strong>Album: </strong>
		</h4>
		<p>${song.album}</p>

		<form action="${song.url }">
			<input type="submit" value="Watch Video" />
		</form>

		<iframe width="350" height="200"
			src="https://www.youtube.com/embed/FTQbiNvZqaY" frameborder="0"
			allow="autoplay; encrypted-media" allowfullscreen></iframe>

		<br>
		</ul>
	</c:forEach>







</body>
</html>