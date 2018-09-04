<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${not empty songs }">
				<c:forEach var="song" items="${songs}">
					<table>
						<tr>
							<c:if test="${song.albumImage}">
								<td><img src="${song.albumImage}" height="80" width="80"></td>
							</c:if>
							<td>${song.title}</td>
							<td>${song.artist}</td>
							<td>${song.album}</td>
							<td>${song.url }</td>
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
		<a href="homepage.do">Home</a> <a href="profile.do">Profile</a> <a
			href="settings.do">Settings</a> <a href="logout.do">Logout</a>
	</div>

</body>
</html>