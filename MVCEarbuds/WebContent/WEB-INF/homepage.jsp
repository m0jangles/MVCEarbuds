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

<form action="viewPlaylists.do" method="GET">
<input type="hidden" name="id" value="${UserInSession.profile.id }">
<button type="submit" value="View Playlists">View Playlists</button>
</form>


<c:choose>
<c:when test="${not empty playlists }">
<ul>
<c:forEach var="playlist" items="${playlists }">
<li>${playlist.playlistName }</li>
</ul>
</c:forEach>
</c:when>
<c:otherwise>

<form action="newPlaylist.do" method="GET">
<input type="hidden" name="id" value="${UserInSession.profile.id }">
<button type="submit" value="New Playlist">Create New Playlist</button>
</form>

</c:otherwise>
</c:choose>


 


</body>
</html>