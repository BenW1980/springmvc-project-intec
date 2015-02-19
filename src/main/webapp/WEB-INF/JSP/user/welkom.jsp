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
<title>Welkom op gameXchange</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>


</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>


	<div id="container">
		<p />
		<div id="left-col">
			<c:choose>
				<c:when test="${not empty gameList }">
					<table>
						<thead>
							<tr>
								<th>Titel</th>
								<th>Platform</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><c:forEach var="game" items="${gameList}">
										<c:url var="url" value="/games/user">
											<c:param name="username" value="${game.user.username}" />
										</c:url>

										<security:authorize access="isAuthenticated()">
											<a href="${url}">${game.title}</a>
										</security:authorize>

										<security:authorize access="isAnonymous()">${game.title}</security:authorize>
										<p />
									</c:forEach></td>
								<td><c:forEach var="game" items="${gameList}">${game.platform.platformName}<p />
									</c:forEach></td>
							</tr>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<br />
					<b>Database is leeg!</b>
				</c:otherwise>
			</c:choose>
		</div>

		<div id="right-col">
			<br />
			<div id="accordion">
				<h3>Wat is de bedoeling van deze site?</h3>
				<div>
					<p />
					Meer en meer zullen games worden gedownload en zullen er minder
					fysieke versies op de markt te vinden zijn. Aangezien digitale
					software niet kan worden geruild zullen velen op zoek gaan naar een
					snelle manier om hun oudere games om te ruilen. Vandaar deze site.
					<p />
					Het doel van <b>gameXchange</b> is om de ruil van tweedehands games
					tussen 2 partijen te vergemakkelijken. Deze site dient als
					tussenpersoon en biedt een eenvoudige interface aan om de ruil zo
					snel mogelijk af te handelen.
					<p />
					<b>gameXchange</b> kan daarom nuttig zijn voor de gamer en de
					verzamelaar.
					<p />
				</div>
				<h3>Hoe werkt het?</h3>
				<div>
					Heel eenvoudig!
					<ul>
						<li>Maak een account aan</li>
						<li>Voeg enkele games toe</li>
						<li>Begin te ruilen</li>
					</ul>
					Veel plezier!

				</div>
				<h3>Hoe is deze site gemaakt?</h3>
				<div>
					<b>gameXchange</b> is gemaakt met volgende technologieën:
					<ul>
						<li>JAVA EE</li>
						<li>Spring MVC</li>
						<li>Hibernate</li>
						<li>MySQL</li>
						<li>JavaScript/JQuery</li>
						<li>HTML/CSS</li>
					</ul>

					<c:url var="url" value="/code"></c:url>
					<a href="${url}">Klik hier om een extract van de broncode te
						bekijken.</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>