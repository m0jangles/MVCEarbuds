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
							<td><iframe width="200" height="150"
									src="https://www.youtube.com/embed/${song.url}" frameborder="0"
									allow="autoplay; encrypted-media" allowfullscreen> </iframe></td>
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
		<a class="btn btn-primary btn-std" href="homepage.do" role="button">
			Home </a> <a class="btn btn-primary btn-std" href="profile.do"
			role="button"> Profile </a> <a class="btn btn-primary btn-std"
			href="settings.do" role="button"> Settings </a> <a
			class="btn btn-primary btn-std" href="logout.do" role="button">
			Logout </a>
	</div>

</body>
</html>