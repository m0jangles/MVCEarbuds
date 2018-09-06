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
					<td>
						<form action="deleteSong.do" method="POST">
							<input type="hidden" name="playlistId" value="${id }"> <input
								type="hidden" name="songId" value="${song.id }"> <input
								type="submit" value="Remove Song">
						</form>
					</td>
				</tr>

			</c:forEach>

		</table>

		<br>
		<form action="displayAddSongForm.do" method="GET">
			<input type="submit" value="Add a Song to Playlist"> <input
				type="hidden" name="id" value="${id}">
		</form>
		<br>

		<c:if test="${addFormButtonClicked}">
			<fieldset style="display: inline; box-shadow: 5px 5px 10px gray;">
				<legend> Add Song </legend>

				<form action="addSong.do" method="POST">

					<table>
						<tr>
							<td><label for="title">Song Title:</label></td>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<td><label for="artist">Artist:</label></td>
							<td><input type="text" name="artist"></td>
						</tr>
						<tr>
							<td><label for="album">Album:</label></td>
							<td><input type="text" name="album"></td>
						</tr>
						<tr>
							<td><label for="albumImage">Album Image Link:</label></td>
							<td><input type="text" name="albumImage"></td>
						</tr>
						<tr>
							<td><label for="url">Song Link:</label></td>
							<td><input type="text" name="url"></td>
						</tr>
						<tr>
							<td><select class="inlineFormCustomSelect" name="genre">
									<option selected>Genre</option>
									<c:forEach var="genre" items="${genres}">
										<option value="${genre.name}">${genre.name}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table>

					<input type="submit" value="Add Song" /> <input type="hidden"
						name="playlistId" value="${id}">
				</form>

				<form action="getSongs.do">
					<input type="submit" value="Cancel" /> <input type="hidden"
						name="id" value="${id}">
				</form>

				<br>

				<form action="findSongs.do">
					<input type="text" name="searchSongInput"
						placeholder="Search Music">
					<button type="submit" value="Search">Search Music</button>
				</form>
			</fieldset>
		</c:if>
	</div>

</body>
</html>