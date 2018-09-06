<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="Style.css">
<meta charset="UTF-8">
<title>Earbuds | Profile</title>
</head>
 <style>
  
  </style>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="homepage.do">Earbuds</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      <li class="active"><a href="homepage.do">Home</a></li>
        <li><a href="profile.do">Profile</a></li>
        <li><a href="settings.do">Settings</a></li>
        <li><a href="logout.do">Logout</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	<div>
		<h2>Profile Page</h2>
		<p>Create Post</p>

		<img src="${UserInSession.profile.image}" width="300">

		<p>${UserInSession.profile.firstName}
			${UserInSession.profile.lastName}</p>

		<p>${UserInSession.profile.location.city},
			${UserInSession.profile.location.state}<br>
			${UserInSession.profile.location.country}
		</p>
	</div>

<h3>Playlists</h3>
	<div style='overflow: scroll; width: 400px; height: 400px;'>
		<c:choose>
			<c:when test="${not empty playlists }">

				<c:forEach var="playlist"
					items="${playlists }">
					<tr>
						<td colspan="5" align="center"><strong> <a
								href="getSongs.do?id=${playlist.id }">${playlist.playlistName}</a>
						</strong></td>
					</tr>
					<form action="getSongs.do" method="GET">
						<input type="hidden" name="id"
							value="${playlist.id }">
						<button type="submit" value="View Songs">View Songs</button>
					</form>
				</c:forEach>

			</c:when>
			<c:otherwise>
				<br>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</body>
</html>