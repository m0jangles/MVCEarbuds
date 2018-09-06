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

<title>Earbuds | Search Results</title>
</head>
<body>

	<div align="right">
		<a class="btn btn-primary btn-std" href="homepage.do" role="button">
			Home </a> <a class="btn btn-primary btn-std" href="profile.do"
			role="button"> Profile </a> <a class="btn btn-primary btn-std"
			href="settings.do" role="button"> Settings </a> <a
			class="btn btn-primary btn-std" href="logout.do" role="button">
			Logout </a>
	</div>

	<div class="container">
		<c:choose>
			<c:when test="${not empty songs}">
				<table>
					<tr>
						<td colspan="5" align="center"><strong>Search
								Results</strong></td>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th>Song</th>
						<th>Artist</th>
						<th>Album</th>
						<th>Genre</th>
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
								<form action="addSongFromSearchPage.do" method="POST">
									<select class="inlineFormCustomSelect" name="playlist" required="true">
										<option selected disabled>Select Playlist</option>
										<c:forEach var="playlist" items="${playlists}">
											<option value="${playlist.id}">${playlist.playlistName}</option>
										</c:forEach>
									</select> 
									<input type="hidden" name="songId" value="${song.id}">
									<input type="hidden" name="searchSongInput" value="${searchSongInput}"> 
									<input type="submit" value="Add to Playlist">
									</form>
									<form action="postSong.do" method="POST">
										<input type="hidden" name="songId" value="${song.id }">
										<input type="hidden" name="id" value="${UserInSession.profile.id }">
										<input type="hidden" name="message" value="song">
										<input type="submit" value="Share to Feed">
									</form>
								
								
							</td>
							<td><c:if
									test="${wasAdditionSuccessful && songSuccessfulID == song.id}">
									Song successfully added to playlist!
								</c:if></td>
						</tr>
					</c:forEach>

				</table>
			</c:when>
			<c:when test="${not empty profiles }">
				<c:forEach var="profile" items="${profiles }">
					<dl>
						<c:if test="${not empty profile.image}">
							<li><img src="${profile.image }"
								alt="Photo of ${profile.firstName}" width="100"></li>
						</c:if>
						<li>${profile.firstName }${profile.lastName }</li>
					</dl>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<em>No Results Matching Your Search.</em>
			</c:otherwise>
		</c:choose>


	</div>

</body>
</html>