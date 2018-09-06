<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    .row.content {height: 450px}
    
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
      .row.content {height:auto;} 
    }
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