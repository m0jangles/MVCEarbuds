<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Earbuds | Settings</title>
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
				<a class="navbar-brand" href="login.do">Earbuds</a>
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
	<div class="container-fluid text-center">
	<br><br><br>
		<div>
			<h3>Settings</h3>
		</div>
		
		<div class="container-fluid text-center col-md-offset-4">
			<form class="form-horizontal" action="updateProfile.do" method="POST">
				<div class="form-group">
					<label class="control-label col-sm-2" for="firstName">First
						Name:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="firstName"
							value="${UserInSession.profile.firstName}" required />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="lastName">Last
						Name:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="lastName"
							value="${UserInSession.profile.lastName}" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="image">Profile
						Picture URL:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="image"
							value="${UserInSession.profile.image}" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="locationCity">City:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="locationCity"
							value="${UserInSession.profile.location.city}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="locationState">State:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="locationState"
							value="${UserInSession.profile.location.state}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="locationCountry">Country:</label>
					<div class="col-md-4 form-group">
						<input type="text" class="form-control" name="locationCountry"
							value="${UserInSession.profile.location.country}">
					</div>
				</div>
				<div class="col-md-5 text-center">
					<input type="hidden" name="updateID"
						value="${UserInSession.profile.id}" />
					<button type="submit" class="btn btn-primary btn-lg btn-block">Update</button>
				</div>	
			</form>
			<form class="form-horizontal" action="deleteUser.do" method="POST">
				<div class="form-group">
					<div class="col-md-4 form-group">
						<input type="hidden" name="deleteUser" value="${UserInSession.id}" />
						<button type="submit" class="btn btn-primary btn-lg btn-block btn-danger">Delete
							Account</button>
					</div>
				</div>
			</form>
			
		</div>
		
	</div>
	

</body>
</html>