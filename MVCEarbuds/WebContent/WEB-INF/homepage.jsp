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
<input type="hidden" name="profile" value="${UserInSession.profile }">
					<button type="submit"
						class="btn btn-primary btn-lg btn-block btn-success"
						value="View Playlists">View Playlists</button>
				</form>
<%-- <a href="viewPlaylists.do?profile=${UserInSession.profile }">View Playlists</a> --%>


<c:if test="${not empty playlists }">
<ul>
<c:forEach var="playlist" items="${playlists }">
<li>${playlist.name }</li>

</ul>
</c:forEach>
</c:if>


 


</body>
</html>