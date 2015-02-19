<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Games voor ${param.platformName}</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>


	<p />
	<c:choose>
		<c:when test="${not empty gameListPerPlatform }">
			<b>Beschikbaar voor de ${param.platformName}:</b>
			<table>
				<thead>
					<tr>
						<th>Titel</th>
						<th>User</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><c:forEach var="game" items="${gameListPerPlatform}">
								<c:url var="url" value="/games/user">
									<c:param name="username" value="${game.user.username}" />
								</c:url>
								<security:authorize access="isAuthenticated()">
									<a href="${url}">${game.title}</a>
								</security:authorize>
								<security:authorize access="isAnonymous()">${game.title}</security:authorize>
								<p />
							</c:forEach></td>
						<td><c:forEach var="game" items="${gameListPerPlatform}">
					${game.user.username}
					<p />
							</c:forEach></td>
					</tr>
				</tbody>
			</table>

		</c:when>
		<c:otherwise>
			<br />
			<b>Geen games beschikbaar voor de ${param.platformName}</b>
		</c:otherwise>
	</c:choose>
	<p />



</body>
</html>