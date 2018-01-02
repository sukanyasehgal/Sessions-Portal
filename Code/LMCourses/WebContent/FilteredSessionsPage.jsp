<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aricent Sessions</title>
<link href="css/Style.css" rel="stylesheet">
</head>
<body>
<head>
<title>Aricent Courses</title>
<script src="js/Validations.js">
	
</script>
<script src="js/LoginForm.js">
	
</script>
</head>
<body>
	<div style="width: 100%; padding: 0px; margin: 0px">
		<div
			style="background-color: #FFA500; width: 100%; height: 40px; padding: 0px 0px 10px 0px;">
			<h1 style="text-align: center; font-family: 'Raleway', sans-serif;">
				Aricent Sessions
				<button id="login" onclick="loginForm_show()">Admin Login</button>
			</h1>
		</div>

		<%@ include file="LoginForm.html"%>

		<div
			style="background-color: #aaa; height: 834px; width: 190px; float: left; padding: 0px 0px 0px 10px;">
			<div style="font-size: 20px;">
				<br>(Select to filter)
			</div>
			<form action="FilterSessionsServlet" name="FilterForm"
				onsubmit="return checkboxStatus()" method="post">
				<br> <input style="font-size: 20px;" type="checkbox"
					name="session" value="Regular"><b style="font-family: 'Raleway', sans-serif;">Regular</b><br> <br>
				<input style="font-size: 20px;" type="checkbox" name="session"
					value="Spotlight"><b style="font-family: 'Raleway', sans-serif;">Spotlight</b><br> <br> <input
					style="font-size: 20px;" type="checkbox" name="session"
					value="Pre-Conference"><b style="font-family: 'Raleway', sans-serif;">Pre-Conference</b><br> <br>
				<input style="cursor: pointer" type="submit" value="Filter"
					id="filter">
			</form>

		</div>

		<div
			style="background-color: #eee; height: 832px; width: 1035px; float: left; padding: 0px 0px 0px 10px; border: 1px ridge; border-color: #C0C0C0;">
			<br>
			<h3>
				<u style="font-family: 'Raleway', sans-serif;">Scheduled Sessions</u>
			</h3>
			<c:forEach items="${listOfSessions}" var="session">
				<div style="width: 190px; float: left">
					<br> <a
						href="SelectedSessionServlet?value=${session.getCode()}"><img
						src="images\<c:out value="${session.getImage()}"/>"
						title="${session.getImage()}" height="80px" width="150px"></a>
				</div>
			</c:forEach>
		</div>

		<div style="background-color: #FFA500; clear: both">
			<center>Copyright © 2016 Aricent Technologies</center>
		</div>
	</div>
</body>
</html>




