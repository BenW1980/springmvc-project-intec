<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jouw games</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />

<body>

	<c:choose>
		<c:when test="${not empty gameList }">
			<p />

			<h1>Jouw games</h1>

			<table>
				<thead>
					<tr>
						<th></th>
						<th>Item</th>
						<th>Platform</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><c:forEach var="game" items="${gameList}">
								<c:url value="/games/yourgames" var="URL">
									<c:param name="id" value="${game.gameId}" />
								</c:url>

								<form action="${URL}" method="post">
								
									<input type="image" value="submit"
										src="${pageContext.servletContext.contextPath}/images/trashcan.png"
										width="18" height="18" alt="delete"
										onClick="return confirm('Zeker dat je deze game wil verwijderen?')" />
										
								</form>
								<p />
							</c:forEach></td>

						<td><c:forEach var="game" items="${gameList}">${game.title}<br />
								<br />
							</c:forEach></td>
						<td><c:forEach var="game" items="${gameList}">${game.platform.platformName}<br />
								<br />
							</c:forEach></td>

					</tr>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<br />
			<b>Geen games gevonden.</b>
		</c:otherwise>
	</c:choose>

	<c:if test="${not empty param.error}">
		<div class="error">${param.error}</div>
	</c:if>

</body>
</html>