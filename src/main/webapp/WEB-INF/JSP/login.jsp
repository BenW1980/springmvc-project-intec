<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="nl">
<head>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
<title>Tijd om in te loggen</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>
	<form method='post' action='<c:url value="/j_spring_security_check"/>'>
		<label>Username:<br /> <input type="text" id="j_username"
			name="j_username" autofocus /></label>
		<p />
		<label>Wachtwoord: <br /> <input type="password"
			name="j_password" id="password" /></label>
		<div>
			<label><input type="checkbox" checked="checked" />Onthoud me</label>
		</div>
		<p />
		<input class="red" type="submit" value="Aanmelden" />
		<p />



	</form>

	<c:url var="url" value="/user/nieuwaccount/"></c:url>
	<form action="${url}">
		<input class="red" type="submit" value="Maak account">
	</form>
	<p />
	<c:if test="${param.error}">
		<div class="error">Verkeerde gebruikersnaam of paswoord.</div>
	</c:if>
</body>
</html>