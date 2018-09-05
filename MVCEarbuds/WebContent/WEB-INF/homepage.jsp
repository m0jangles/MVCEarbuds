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
<title>Earbuds | Homepage</title>
</head>
<body>
	<div class="container">
		<h2>Welcome, ${UserInSession.username}</h2>
		<a class="btn btn-primary btn-std" href="profile.do" role="button">
			Profile </a> <a class="btn btn-primary btn-std" href="logout.do"
			role="button"> Logout </a> <a class="btn btn-primary btn-std"
			href="settings.do" role="button"> Settings </a> <br> <img
			src="${UserInSession.profile.image}" width="250"> <br>
		
		<br>
<h3>Your Playlists</h3>
		<c:choose>
			<c:when test="${not empty playlists }">
				<ul>
					<c:forEach var="playlist" items="${playlists }">
						<li>${playlist.playlistName }
							<form action="getSongs.do" method="GET">
								<input type="hidden" name="id" value="${playlist.id }">
								<button type="submit" value="View Songs">View Songs</button>
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
			</c:otherwise>
		</c:choose>
			<form action="newPlaylist.do" method="POST">
			<input type="hidden" name="playlistProfileId"
				value="${UserInSession.profile.id }"> <input type="text"
				name="name" placeholder="Name your playlist">
			<button type="submit" value="New Playlist">Create New
				Playlist</button>
		</form>
		<form id="commentForm" action="createPost.do" method="POST">
			<input type="hidden" name="id" value="${UserInSession.profile.id }">
		<textarea rows="4" cols="50" name="message" form="commentForm"></textarea>
			<button type="submit" value="POST IT!">POST IT!</button>
		</form>
		
		<c:if test="${not empty posts }">

			<c:forEach var="post" items="${posts}">

				<tr>
					<td>${post.profile.user.username}</td>
					<td>${post.postDate}</td>
					<td>${post.message}</td>

					<td>
				<%-- 	<c:set var = "userProfile" scope="session" value="${profile.id }"/>
					<c:set var = "userPost" scope="session" value="${UserInSession.profile.id}"/>
					
					<c:if test="${userProfile==userPost}"> --%>
						<form action="deletePost.do" method="POST">
							<input type="hidden" name="postId"
								value="${post.id }">
								
								 <input
								type="submit" value="Delete Post">
						</form>
					<%-- 	</c:if> --%>
					</td>
				</tr>

			</c:forEach>
		</c:if>

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