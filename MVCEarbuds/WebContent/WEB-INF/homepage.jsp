<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet" />
<meta charset="UTF-8">
<title>Earbuds | Homepage</title>
</head>
<body>
	<div class="container">
		<h2>Welcome, ${UserInSession.username}</h2>
		<a class="btn btn-primary btn-std" href="profile.do" role="button">Profile</a>

		<a class="btn btn-primary btn-std" href="logout.do" role="button">Logout</a>

		<a class="btn btn-primary btn-std" href="settings.do" role="button">Settings</a>
		<br> <img src="${UserInSession.profile.image}" width="250">
		<br>

		<form action="newPlaylist.do" method="POST">
			<input type="hidden" name="playlistProfileId"
				value="${UserInSession.profile.id }"> <input type="text"
				name="name" placeholder="Name your playlist">
			<button type="submit" value="New Playlist">Create New
				Playlist</button>
		</form>
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
								<input type="text" name="title" placeholder="Title"> <input
									type="text" name="album" placeholder="Album"> <input
									type="text" name="albumImage" placeholder="Image URL">
								<input type="text" name="url" placeholder="YouTube URL">
								<input type="text" name="artist" placeholder="Artist">
								<button type="submit" value="Add Song">Add Song</button>
							</form>
							<form action="removePlaylist.do" method="POST">
								<input type="hidden" name="playlistId" value="${playlist.id }">
								<button type="submit" value="Delete Playlist">Delete
									this playlist</button>
							</form>
						</li>
					</c:forEach>
				</ul>
			</c:when>
			<c:otherwise>
				<br>
			You don't have any playlists!
		</c:otherwise>
		</c:choose>
		<form action="findUsers.do" method="GET">
			<input type="text" name="searchUserInput" placeholder="Find Friends">
			<button type="submit" value="Search">Search Users</button>
		</form>
		<form action="findSongs.do" method="GET">
			<input type="text" name="searchSongInput" placeholder="Search Music">
			<button type="submit" value="Search">Search Music</button>
		</form>
		<br>

	</div>
</body>
</html>