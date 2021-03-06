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

<title>Earbuds | Search Results</title>
</head>

<style>
.searchResults {
	text-align: center;
	color: white;
}

body {
	background-image: url("images/resultsbackground.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
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

	<c:choose>
		<c:when test="${not empty songs}">
			<div class="container1">

				<h3 class="searchResults">Music Search Results</h3>

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

							<form action="addSongFromSearchPage.do" method="POST">
								<p>
									<select class="form-control" name="playlist">
										<option selected disabled>Select Playlist</option>
										<c:forEach var="playlist" items="${playlists}">
											<option value="${playlist.id}">${playlist.playlistName}</option>
										</c:forEach>
									</select> <input type="hidden" name="songId" value="${song.id}">
									<input type="hidden" name="searchSongInput"
										value="${searchSongInput}">
									<button type="submit" class="btn btn-sm btn-default">Add
										to Playlist</button>
								</p>
							</form>

							<form action="postSong.do" method="POST">
								<p>
									<input type="hidden" name="songId" value="${song.id }">
									<input type="hidden" name="id"
										value="${UserInSession.profile.id }"> <input
										type="hidden" name="message" value="    ">
									<button type="submit" class="btn btn-sm btn-default">Share
										to Feed</button>
								</p>
							</form>

							<p>
								<c:if
									test="${wasAdditionSuccessful && songSuccessfulID == song.id}">
									<div class="alert alert-success" role="alert">Song
										successfully added to playlist!</div>
								</c:if>
							</p>



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

		</c:when>
		<c:otherwise>
			<em>No Results Matching Your Search.</em>
		</c:otherwise>
	</c:choose>

</body>
</html>