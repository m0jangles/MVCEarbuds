<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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



<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>




<meta charset="UTF-8">
<title>Earbuds | Profile</title>
</head>



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
	background-color: #EAEAEA;
	background-image: url("images/record-1404325_1920.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

.user-details {
	position: relative;
	padding: 0;
}

.user-details .user-image {
	position: relative;
	z-index: 1;
	width: 100%;
	text-align: center;
}

.user-image img {
	clear: both;
	margin: auto;
	position: relative;
	top: 100px;
}

.user-details .user-info-block {
	width: 100%;
	position: absolute;
	top: 370px;
	background: rgb(255, 255, 255);
	z-index: 0;
	padding-top: 35px;
}

.user-info-block .user-heading {
	width: 100%;
	text-align: center;
	margin: 10px 0 0;
}

.user-info-block .navigation {
	float: left;
	width: 100%;
	margin: 0;
	padding: 0;
	list-style: none;
	border-bottom: 1px solid #428BCA;
	border-top: 1px solid #428BCA;
}

.navigation li {
	float: left;
	margin: 0;
	padding: 0;
}

.navigation li a {
	padding: 20px 30px;
	float: left;
}

.navigation li.active a {
	background: #428BCA;
	color: #fff;
}

.user-info-block .user-body {
	float: left;
	padding: 5%;
	width: 90%;
}

.user-body .tab-content>div {
	float: left;
	width: 100%;
}

.user-body .tab-content h4 {
	width: 100%;
	margin: 10px 0;
	color: #333;
}

.playlistSeparator {
	margin-top: 15px;
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
					<li><a href="settings.do">Settings</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.do"><span
							class="glyphicon glyphicon-log-in"></span>Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-4 user-details">
				<div class="user-image">
					<img src="${UserInSession.profile.image}"
						title="Karan Singh Sisodia" class="img-rounded" height="300"
						width="300">
				</div>
				<div class="user-info-block">
					<div class="user-heading">
						<h3>${UserInSession.profile.firstName}
							${UserInSession.profile.lastName}</h3>
						<span class="help-block">${UserInSession.profile.location.city},
							${UserInSession.profile.location.state}</span> <span class="help-block">${UserInSession.profile.location.country}</span>
					</div>
					<ul class="navigation">
						<li class="active"><a data-toggle="tab" href="#information">
								<span class="glyphicon glyphicon-th-list"></span>
						</a></li>
						<li><a data-toggle="tab" href="#settings"> <span
								class="glyphicon glyphicon-cog"></span>
						</a></li>
						<li><a data-toggle="tab" href="#email"> <span
								class="glyphicon glyphicon-envelope"></span>
						</a></li>
						<li><a data-toggle="tab" href="#events"> <span
								class="glyphicon glyphicon-calendar"></span>
						</a></li>
					</ul>
					<div class="user-body">
						<div class="tab-content">
							<h4>Playlists</h4>
							<div id="information" class="tab-pane active">

								<c:choose>
									<c:when test="${not empty playlists }">

										<c:forEach var="playlist" items="${playlists }">

											<div class="playlistSeparator">
												<strong> <a href="getSongs.do?id=${playlist.id }">${playlist.playlistName}</a>
												</strong>

												<form action="getSongs.do" method="GET">
													<input type="hidden" name="id" value="${playlist.id }">
													<br>
													<button type="submit" value="View Songs">View
														Songs</button>
												</form>
											</div>

										</c:forEach>

									</c:when>
									<c:otherwise>
										<br>
									</c:otherwise>
								</c:choose>

							</div>
							<div id="settings" class="tab-pane">
								<h4>Settings</h4>
							</div>
							<div id="email" class="tab-pane">
								<h4>Send Message</h4>
							</div>
							<div id="events" class="tab-pane">
								<h4>Events</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>