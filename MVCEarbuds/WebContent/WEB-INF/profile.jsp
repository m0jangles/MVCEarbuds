<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Earbuds | Profile</title>
</head>
<body>

	<h2>Profile Page</h2>

	<a href="settings.do">Settings</a>
	<a href="logout.do">Logout</a>
	<a href="homepage.do">Home</a>

	<p>Playlists</p>

	<p>Create Post</p>

	<img src="${UserInSession.profile.image}" height="200" width="200">

	<p>${UserInSession.profile.firstName}
		${UserInSession.profile.lastName}</p>

	<p>${UserInSession.profile.location.city},
		${UserInSession.profile.location.state}<br>
		${UserInSession.profile.location.country}
	</p>

</body>
</html>