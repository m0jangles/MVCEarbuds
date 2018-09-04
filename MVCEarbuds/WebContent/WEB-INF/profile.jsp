<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet" />
<meta charset="UTF-8">
<title>Earbuds | Profile</title>
</head>
<body>
	<div class="container">
		<h2>Profile Page</h2>

		<a class="btn btn-primary btn-std" href="settings.do" type="button">Settings</a>
		<a class="btn btn-primary btn-std" href="logout.do" type="button">Logout</a>
		<a class="btn btn-primary btn-std" href="homepage.do" type="button">Home</a>
		<p>

			<form action="viewPlaylists.do" method="GET"><input type="hidden" name="id" value="${UserInSession.profile.id }">
			<button type="submit" value="View Playlists">Playlists</button>
		</p>
		
		</form>

		<p>Create Post</p>

		<img src="${UserInSession.profile.image}" width="300">

		<p>${UserInSession.profile.firstName}
			${UserInSession.profile.lastName}</p>

		<p>${UserInSession.profile.location.city},
			${UserInSession.profile.location.state}<br>
			${UserInSession.profile.location.country}
		</p>
	</div>

</body>
</html>