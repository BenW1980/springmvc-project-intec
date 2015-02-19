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
<title>Menu</title>

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
<link rel="shortcut icon"
	href="${pageContext.servletContext.contextPath}/images/favicon.ico"
	type="image/x-icon" />
</head>
<body>
	<div id="headerbg">
		<ul class="zonderbolletjes">

			<security:authorize access="isAnonymous()">
				<c:url var="url" value="/"></c:url>
				<li><a class="metro" href="${url}">Home</a></li>
			</security:authorize>


			<security:authorize access="isAuthenticated()">
				<c:url var="url" value="/"></c:url>
				<li><a class="metro" href="${url}">Home</a></li>
			</security:authorize>

			<security:authorize access="isAuthenticated()">
				<c:url var="url" value="/games/yourgames"></c:url>
				<li><a class="metro" href="${url}"> Jouw games</a></li>
			</security:authorize>

			<security:authorize access="isAuthenticated()">
				<c:url var="url" value="/games/addgame"></c:url>
				<li><a class="metro" href="${url}">Voeg een game toe</a></li>
			</security:authorize>

			<security:authorize access="isAuthenticated()">
				<c:url var="url" value="/messages/inbox"></c:url>
				<li><a class="metro" href="${url}">Jouw
						berichten(${messageCount})</a></li>
			</security:authorize>

			<security:authorize access="isAuthenticated()">
				<c:url var="url" value="/yourdeals"></c:url>
				<li><a class="metro" href="${url}">Jouw deals(${dealCount})</a></li>
			</security:authorize>

			<security:authorize access="isAnonymous()">
				<li><a class="metro" href="<c:url value='/login'/>">Aanmelden</a></li>
			</security:authorize>

			<security:authorize access="isAnonymous()">
				<c:url var="url" value="/user/nieuwaccount"></c:url>
				<li><a class="metro" href="${url}">Nieuwe account</a></li>
			</security:authorize>

			<security:authorize access="isAuthenticated()">
				<li><a class="metro"
					href="<c:url value='/j_spring_security_logout'/>">Afmelden als
						${currentUser}</a></li>
			</security:authorize>

		</ul>
		<p />
		<hr />
		<p />
		<ul class="zonderbolletjes">
			<c:forEach var="platforms" items="${platformsMenu}">
				<c:url var="url" value="/games/platform">
					<c:param name="platformName" value="${platforms.platformName}" />
				</c:url>
				<li><a class="metro" href="${url}">${platforms}</a></li>
			</c:forEach>
		</ul>
	</div>
	<center>
		<img src="${pageContext.servletContext.contextPath}/images/title3.png"
			align="middle" alt="title" style="width: 1300px; height: 120px">
	</center>
	<p />



</body>
</html>