<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Earbuds | Playlists</title>
</head>
<body>

	<h2>Playlist Page (Temporary Name)</h2>


	<table>
		<tr>
			<td colspan="5" align="center"><strong>${playlistName}</strong></td>
		</tr>
		<tr>
			<td></td>
			<td>Song</td>
			<td>Artist</td>
			<td>Album</td>
			<td></td>
		</tr>

		<c:forEach var="song" items="${songs}">

			<tr>
				<td><img src="${song.albumImage}" height="80" width="80"></td>
				<td>${song.title}</td>
				<td>${song.artist}</td>
				<td>${song.album}</td>
				<td>
					<form action="deleteSong.do" method="POST">
						<input type="submit" value="Remove Song">
					</form>
				</td>
			</tr>

		</c:forEach>

	</table>

	<br>
	<form action="addSong.do" method="POST">
		<input type="submit" value="Add Song to Playlist">
	</form>
	<br>
	<!-- some boolean check here to see if add song button was clicked -->

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
					<td><label for="genre">Genre:</label></td>
					<td><input type="text" name="genre"></td>
				</tr>
			</table>

			<input type="submit" value="Add Song" />
		</form>

		<form action="viewPlaylists.do">
			<input type="submit" value="Cancel" />
		</form>

		<br>

		<form action="searchExisting.do">
			<input type="submit" value="Search for Existing Song">
		</form>

	</fieldset>

</body>
</html>