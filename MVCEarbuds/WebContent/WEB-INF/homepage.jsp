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
<title>Earbuds | Homepage</title>
<style>


/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}
/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}
/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}
/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

body {
	background-image:
		/* url("https://smartandsecurecomputing.org/nicholas/wp-content/uploads/2018/02/blurredbackground.jpg"); */
		/* url("https://i.pinimg.com/originals/87/b7/15/87b7156a0e8bad9ee8ee24e2102bdb59.jpg"); */ 
		url("images/red.jpg"); 
		/* url("https://i.pinimg.com/originals/e2/ed/c1/e2edc1f9814c175287e7b99bfae80ac6.jpg"); */
		
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center; 
}

a {
	color: white;
}

.friendName {
	margin-left: 20px;
}
.font {
	text-align: center;
	color: white;
}

.container1 {
	background: black;
}
/* .container2 {
	background: black;
	
} */
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Earbuds</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="profile.do">Profile</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.do"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
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
	<div class="container-fluid" >
		<div class="row">

			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<br> <br> <br>
				<div class="container1">
				<h2 class="font">- Welcome, ${UserInSession.username} -</h2></div>

				<img src="${UserInSession.profile.image}" width="200"> <br>
				<br>
				<div class="form-group">
					<form id="commentForm" action="createPost.do" method="POST">
						<input type="hidden" name="id"
							value="${UserInSession.profile.id }">
						<textarea rows="4" cols="50" name="message" form="commentForm"></textarea>
						<br>
						<button type="submit" class="btn btn-primary btn-lg">Post
							Your Message</button>
					</form>
				</div>
				<form action="postSong.do" method="POST">
					<fieldset style="display: inline;">
					<div class="container1">
						<legend class="font"> Share New Song </legend></div>
						<table>
							<tr>
								<td><label for="title" class="font">Song Title:</label></td>
								<td><input type="text" name="title"></td>
							</tr>
							<tr>
								<td><label for="artist" class="font">Artist:</label></td>
								<td><input type="text" name="artist"></td>
							</tr>
							<tr>
								<td><label for="album" class="font">Album:</label></td>
								<td><input type="text" name="album"></td>
							</tr>
							<tr>
								<td><label for="albumImage" class="font">Album Image Link:</label></td>
								<td><input type="text" name="albumImage"></td>
							</tr>
							<tr>
								<td><label for="url" class="font">Song Link:</label></td>
								<td><input type="text" name="url"></td>
							</tr>
							<tr>
								<td><select class="inlineFormCustomSelect" name="genre" class="font">
										<option selected>Genre</option>
										<c:forEach var="genre" items="${genres}">
											<option value="${genre.name}">${genre.name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td><label for="message" class="font">Message:</label></td>
								<td><input type="text" name="message"></td>
							</tr>
						</table>
						<input type="submit" value="Share" /> <input type="hidden"
							name="playlistId" value="${id}">
					</fieldset>
				</form>
			</div>

			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<br> <br> <br>
				<div class="container1">
				<h3 class="font">- Music Feed -</h3></div>
				<c:if test="${not empty posts }">
					<div style='overflow: scroll; width: 400px; height: 400px;'>
						<c:forEach var="post" items="${posts}">
							<div class="container2">
							<table>
								<tr>
									<td><font face="courier new" color="white" ><em>Date: ${post.postDate}</em></font></td>
								</tr>
								<tr>
									<td><font face="courier new" color="white" ><em><strong>${post.profile.user.username}</strong>
										posted: </em></font></strong></td>
									<td><font face="verdana" color="white" size="4">
											${post.message}</font></td>
								</tr>
								<c:if test="${post.song.id != 1}">
									<iframe width="200" height="150"
										src="https://www.youtube.com/embed/${post.song.url}"
										frameborder="0" allow="autoplay; encrypted-media"
										allowfullscreen> </iframe>
								</c:if>
							</table>
							</div>
							<form action="deletePost.do" method="POST">
								<input type="hidden" name="postId" value="${post.id }">
								<button type="submit" class="btn btn-primary btn-xs btn-danger"
									value="Delete Post">Delete Post</button>
							</form>
							<br>
						</c:forEach>
				</c:if>
			</div>
		</div>
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
			<br> <br> <br>
			<div class="container1">
			<h3 class="font">- Your Playlists -</h3></div>
			<div style='overflow: scroll; width: 400px; height: 400px;'>
				<c:choose>
					<c:when test="${not empty playlists }">
						<c:forEach var="playlist" items="${playlists }">
							<strong><font face="verdana" color="black" size="3">
									<a href="getSongs.do?id=${playlist.id }">${playlist.playlistName}</a>
							</font> </strong>
							<form action="removePlaylist.do" method="POST">
								<input type="hidden" name="playlistId" value="${playlist.id }">
								<input type="hidden" name="id" value="${UserInSession.profile.id }">
								<button type="submit" class="btn btn-primary btn-xs btn-danger"
									value="Delete Playlist">Delete Playlist</button>
							</form>
							<br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<br>
					</c:otherwise>
				</c:choose>
				<br> <br>
				<form action="newPlaylist.do" method="POST">
					<input type="hidden" name="playlistProfileId"
						value="${UserInSession.profile.id }"> <input type="text"
						name="name" placeholder="Name your playlist">
					<button type="submit" class="btn btn-primary" value="New Playlist">Create
						New Playlist</button>
				</form>
				<div class="container1">
				<h3 class="font"> Your Friends -</h3></div>
				<table>
					<c:forEach var="friend" items="${myFriends}">
						<tr>
							<td><a
								href="friendProfile.do?friendID=${friend.profile.user.id}">
									<img src="${friend.profile.image}" height="50" width="50" />
							</a>
							<td class="font"><a
								href="friendProfile.do?friendID=${friend.profile.user.id}">${friend.profile.firstName} ${friend.profile.lastName}</a></td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</div>
	</div>
	</div>
</body>
</html>