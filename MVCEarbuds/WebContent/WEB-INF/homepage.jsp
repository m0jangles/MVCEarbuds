<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
<meta charset="UTF-8">
<title>Earbuds | Homepage</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <br>
                <h2>Welcome, ${UserInSession.username}</h2>
                <a class="btn btn-primary btn-std" href="profile.do" role="button">
                    Profile </a> <a class="btn btn-primary btn-std" href="logout.do"
                    role="button"> Logout </a> <a class="btn btn-primary btn-std"
                    href="settings.do" role="button"> Settings </a> <br> <img
                    src="${UserInSession.profile.image}" width="250"> <br> <br>
                <form id="commentForm" action="createPost.do" method="POST">
                    <input type="hidden" name="id" value="${UserInSession.profile.id }">
                    <textarea rows="4" cols="30" name="message" form="commentForm"></textarea>
                    <button type="submit" value="POST IT!">POST IT!</button>
                </form>
            </div>
            <br>
            <div class="col">
                <c:if test="${not empty posts }">
                    <h3>- Your Feed for All Things Music -</h3>
                    <div style='overflow: scroll; width: 400px; height: 400px;'>
                        <c:forEach var="post" items="${posts}">
                            
                                ${post.postDate}
                                ${post.profile.user.username}
                                ${post.message}
                                
                                    <form action="deletePost.do" method="POST">
                                <input type="hidden" name="postId" value="${post.id }">
                                <input type="submit" value="Delete Post">
                            </form>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            <div class="row">
                <div class="col">
                    <br>
                    <form action="findUsers.do" method="GET">
                        <input type="text" name="searchUserInput"
                            placeholder="Search Users">
                        <button type="submit" value="Search Users">Search Users</button>
                    </form>
                    <form action="findSongs.do" method="GET">
                        <input type="text" name="searchSongInput"
                            placeholder="Search Songs">
                        <button type="submit" value="Search Songs">Search Songs</button>
                    </form>
                    <h3>Your Playlists</h3>
                    <div style='overflow: scroll; width: 400px; height: 400px;'>
                        <c:choose>
                            <c:when test="${not empty playlists }">
                                <c:forEach var="playlist" items="${playlists }">
                                    <strong> <a href="getSongs.do?id=${playlist.id }">${playlist.playlistName}</a>
                                    </strong>
                                    <form action="getSongs.do" method="GET">
                                        <input type="hidden" name="id" value="${playlist.id }">
                                        <button type="submit" value="View Songs">View Songs</button>
                                    </form>
                                    <form action="removePlaylist.do" method="POST">
                                        <input type="hidden" name="playlistId" value="${playlist.id }">
                                        <button type="submit" value="Delete Playlist">Delete
                                            Playlist</button>
                                    </form>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <br>
                            </c:otherwise>
                        </c:choose>
                        <form action="newPlaylist.do" method="POST">
                            <input type="hidden" name="playlistProfileId"
                                value="${UserInSession.profile.id }"> <input type="text"
                                name="name" placeholder="Name your playlist">
                            <button type="submit" value="New Playlist">Create New
                                Playlist</button>
                        </form>
                        <h3>Your Friends</h3>
                        <table>
                            <c:forEach var="friend" items="${myFriends}">
                                <tr>
                                    <td><img src="${friend.profile.image}" height="50"
                                        width="50" /></td>
                                    <td>${friend.profile.firstName}${friend.profile.lastName}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>