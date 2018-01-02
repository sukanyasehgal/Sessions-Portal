<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	response.setHeader("Cache-Control",
			"no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0);
%>

<%@page import="daoFiles.SessionRegistrationsDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aricent Sessions</title>
</head>
<body>
<head>
<title>Aricent Courses</title>
<script src="js/Validations.js">
	
</script>
<script src="js/LoginForm.js">
	
</script>
<link href="css/Style.css" rel="stylesheet">
</head>
<body>
	<div style="width: 100%; padding: 0px; margin: 0px">
		<div
			style="background-color: #FFA500; width: 100%; height: 40px; padding: 0px 0px 10px 0px;">
			<h1 style="text-align: center; font-family: 'Raleway', sans-serif;">
				Aricent Sessions <a href="index.jsp"><button id="login">Logout</button></a>
			</h1>

		</div>
		<div
			style="text-align: center; font-family: 'Raleway', sans-serif; font-size: 18px;">
			Welcome ${currentSessionUser.getUsername()}</div>
		<div
			style="background-color: #aaa; height: 834px; width: 1237px; float: left; padding: 25px 0px 0px 10px;">

			<h2 style="text-align: center;">
				<u style="font-family: 'Raleway', sans-serif;">Session
					Registrations</u>
			</h2>
			<div style="padding: 21em 10em 7em 0em">

				<!-- Table goes in the document BODY -->
				<span style="float: center">
					<table class="gridtable" ;  width="1000";>
						<tr>
							<th style="text-align: center; font-weight: bold;"><b>Session
									Code</b></th>
							<th style="text-align: center; font-weight: bold;"><b>Employee
									ID</b></th>
							<th style="text-align: center; font-weight: bold;"><b>Employee
									Name</b></th>
							<th style="text-align: center; font-weight: bold;"><b>Employee
									Ph. No.</b></th>
							<th style="text-align: center; font-weight: bold;"><b>Email
									ID</b></th>
						</tr>


						<%
							SessionRegistrationsDAO sessionRegistrationsDAO = new SessionRegistrationsDAO();
							request.setAttribute("listOfSessionRegistrations",
									sessionRegistrationsDAO.displaySessionRegistrations());
						%>

						<c:forEach items="${listOfSessionRegistrations}" var="list">

							<tr>

								<td style="text-align: center"><c:out
										value="${list.getSessionCode()}" /></td>

								<td style="text-align: center"><c:out
										value="${list.getEmployeeId()}" /></td>

								<td style="text-align: center"><c:out
										value="${list.getEmployeeName()}" /></td>

								<td style="text-align: center"><c:out
										value="${list.getEmployeePhoneNumber()}" /></td>

								<td style="text-align: center"><c:out
										value="${list.getEmailId()}" /></td>

							</tr>
						</c:forEach>

					</table>
				</span>
			</div>
		</div>

		<div style="background-color: #FFA500; clear: both">
			<center>Copyright © 2016 Aricent Technologies</center>
		</div>
	</div>
</body>
</html>


