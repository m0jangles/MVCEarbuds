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

<a href="viewPlaylists.do">View Playlists</a>
<%-- <c:choose>
<c:when test="${not empty UserInSession.profile.playlists }">
<ul>
<c:forEach var="playlist" items="${UserInSession.profile.playlists }">
<li>${playlist }</li>

</ul>
</c:forEach>
</c:when>
<c:otherwise>
<p>You have no playlists</p>
</c:otherwise>
</c:choose>
 --%>



</body>
</html>