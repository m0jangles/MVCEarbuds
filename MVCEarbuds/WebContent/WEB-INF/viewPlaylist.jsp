<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="personalStylesheet" href="Style.css">
<meta charset="UTF-8">
<title>Earbuds | Playlists</title>
</head>
<style>
.playlistTitle {
	text-align: center;
	color: white;
}

.container1 {
	background: black;
}

.container {
	
}

.vid {
	position: relative;
	padding-bottom: 56.25%;
	padding-top: 30px;
	height: 0;
	overflow: hidden;
}

.vid iframe, .vid object, .vid embed {
	position: absolute;
	top: 50px;
	left: 100px;
	width: 70%;
	height: 70%;
}

body {
	background-image: url("images/backgroundUserPlaylist.jpeg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

.col-md-4 {
	background-color: #6b6666;
	opacity: 0.95;
}

fieldset {
	background-color: whitesmoke;
}
</style>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="homepage.do">Earbuds</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="homepage.do">Home</a></li>
					<li><a href="profile.do">Profile</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.do"><span
							class="glyphicon glyphicon-log-in"></span>Logout</a></li>
				</ul>
					<form:form class="navbar-form navbar-right" method="GET"
					action="findUsers.do">
					<div class="form-group">
						<input type="text" class="form-control" name="searchUserInput"
							placeholder="Find Users">
					</div>
					<button type="submit" class="btn btn-default">Find Users</button>
				</form:form>
				<form:form class="navbar-form navbar-right" method="GET"
					action="findSongs.do">
					<div class="form-group">
						<input type="text" class="form-control" name="searchSongInput"
							placeholder="Search Music">
					</div>
					<button type="submit" class="btn btn-default">Search Music</button>
				</form:form>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container1">

		<h3 class="playlistTitle">${playlistName}</h3>

	</div>

	<c:forEach var="song" items="${songs}">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h4>${song.title}</h4>

					<p>
						<strong>Artist:</strong> ${song.artist }
					</p>

					<img src="${song.albumImage}" class="img-responsive center-block"
						alt=albumart">

					<p>
						<strong>Album:</strong> ${song.album}
					</p>

					<p>
						<strong>Genre:</strong> ${song.genresAsString}
					</p>

					<form action="deleteSong.do" method="POST">
						<p>
							<input type="hidden" name="playlistId" value="${id }"> <input
								type="hidden" name="songId" value="${song.id }"> <input
								type="submit" value="Remove Song">
						</p>
					</form>



				</div>
				<!--.col -->

				<div class="col-md-8">
					<div class="vid">
						<iframe width="200" height="150"
							src="https://www.youtube.com/embed/${song.url}" frameborder="0"
							allow="autoplay; encrypted-media" allowfullscreen> </iframe>
					</div>
					<!--./vid -->

				</div>
				<!--.col -->

			</div>
			<!--./row -->

		</div>
		<!--./container -->
	</c:forEach>

	<form action="displayAddSongForm.do" method="GET">
		<input type="submit" value="Add a Song to Playlist"> <input
			type="hidden" name="id" value="${id}">
	</form>

	<br>

	<c:if test="${addFormButtonClicked}">
		<fieldset style="display: inline; box-shadow: 5px 5px 10px gray;">
			<legend> Add Song </legend>

			<form action="addSong.do" method="POST">

				<table>
					<tr>
						<td><label for="title">Song Title:</label></td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<td><label for="artist">Artist:</label></td>
						<td><input type="text" name="artist"></td>
					</tr>
					<tr>
						<td><label for="album">Album:</label></td>
						<td><input type="text" name="album"></td>
					</tr>
					<tr>
						<td><label for="albumImage">Album Image Link:</label></td>
						<td><input type="text" name="albumImage"></td>
					</tr>
					<tr>
						<td><label for="url">Song Link:</label></td>
						<td><input type="text" name="url"></td>
					</tr>
					<tr>
						<td><select class="inlineFormCustomSelect" name="genre">
								<option selected>Genre</option>
								<c:forEach var="genre" items="${genres}">
									<option value="${genre.name}">${genre.name}</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>

				<input type="submit" value="Add Song" /> <input type="hidden"
					name="playlistId" value="${id}">
			</form>

			<form action="getSongs.do">
				<input type="submit" value="Cancel" /> <input type="hidden"
					name="id" value="${id}">
			</form>

			<br>

			<form action="findSongs.do">
				<input type="text" name="searchSongInput" placeholder="Search Music">
				<button type="submit" value="Search">Search Music</button>
			</form>
		</fieldset>
	</c:if>

</body>
</html>