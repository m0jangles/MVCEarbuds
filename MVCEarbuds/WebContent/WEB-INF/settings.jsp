<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
</head>
<body>
<h3>Settings</h3>

<form action="updateProfile.do" method="POST">
First Name:<br>
<input type="text" name="firstName" value="${profile.firstName }" />
Last Name:<br>
<input type="text" name="lastName" value="${profile.lastName } " /> 
Profile Pic:<br>
<input type="text" name="image" value="${profile.image } " /> 
Location:<br>
<input type="text" name="location" value="${profile.location } " /> 
  <input type="submit" value="Submit">
</form>



</body>
</html>