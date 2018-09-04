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

	<c:forEach var="playlist" items="${playlists}">

		<table>
			<tr>
				<td colspan="5" align="center">${playlist.playlistName}</td>
			</tr>
			<tr>
				<td></td>
				<td>Song</td>
				<td>Artist</td>
				<td>Album</td>
				<td></td>
			</tr>

			<%-- <c:forEach var="song" items="${playlist.songs}"> --%>

				<tr>
					<td>test</td>
					<td>
						<form action="deleteSong.do" method="POST">
							<input type="submit" value="Delete">
						</form>
					</td>
				</tr>

		<%-- 	</c:forEach> --%>

		</table>

	</c:forEach>

</body>
</html>