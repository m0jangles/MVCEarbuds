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
				<c:forEach var="song" items="${songs }">
					<dl>
						<li>${song }</li>
					</dl>
				</c:forEach>
			</c:when>
			<c:when test="${not empty profiles }">
				<c:forEach var="profile" items="${profiles }">
					<dl>
						<li>${profile.image }</li>
						<li>${profile.firstName }${profile.lastName }</li>
					</dl>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<em>No Results Matching Your Search.</em>
			</c:otherwise>
		</c:choose>
		<a href="homepage.do">Home</a>
		<a href="profile.do">Profile</a>
		<a href="settings.do">Settings</a>
		<a href="logout.do">Logout</a>
	</div>

</body>
</html>