<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voeg een game toe</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
<script type='text/javascript' src='js/select.js'></script>
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>
	<p />

	<c:url value="/games/addgame" var="url" />
	<form:form action="${url}" method="post" modelAttribute="game">

		<form:label path="title">Titel:</form:label>
		<form:input path="title" id="tagsName" autofocus="autofocus" />
		<form:errors path="title" cssClass="error" />

		<form:select path="platform.platformName" itemValue="platformName"
			itemLabel="platformName">
			<form:option value="" label="--- Kies een platform---" />
			<form:options items="${platformList}" />
		</form:select>
		<form:errors path="platform.platformName" cssClass="error" />
		<p />
		
		Handleiding aanwezig:
		<form:checkbox path="manualPresent" />
		
		Verpakking aanwezig:
		<form:checkbox path="boxPresent" />
		<p />

		<input class="red" type="submit" value="Voeg toe" />
		<p />

	</form:form>
	<c:choose>
		<c:when test="${not empty gameList }">
		Jouw games
			<table>
				<thead>
					<tr>
						<th>Titel</th>
						<th>Platform</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><c:forEach var="game" items="${gameList}">${game.title}<br />
							</c:forEach></td>
						<td><c:forEach var="game" items="${gameList}">${game.platform.platformName}<br />
							</c:forEach></td>
					</tr>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<br />
			<b></b>
		</c:otherwise>
	</c:choose>
	<p />



	<c:url var="url" value="/"></c:url>
	<form action="${url}">
		<input class="red" type="submit" value="Klaar met toevoegen">
	</form>



</body>
</html>