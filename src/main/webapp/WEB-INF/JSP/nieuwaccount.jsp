<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Maak een account aan</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
.ui-tooltip {
	display: inline-block;
	max-width: 500px;
}
</style>
<script>
	$(function() {
		var tooltips = $("[title]").tooltip({
			position : {
				my : "left top",
				at : "right+5 top-5"
			}
		});
	});
</script>
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>
	<br />

	<c:url value="/user/nieuwaccount" var="url" />

	<form:form action="${url}" method="post" modelAttribute="user">

		<form:label path="username">Username:</form:label>
		<div>
			<form:input path="username" autofocus="autofocus" />

			<form:errors path="username" cssClass="error" />
		</div>
		<br />
		<form:label path="mail.mail">Email:</form:label>
		<div>
			<form:input path="mail.mail" id="mail" name="mail"
				title="Je email adres zal nooit zichtbaar zijn voor anderen" />

			<form:errors path="mail.mail" cssClass="error" />
		</div>
		<br />
		<form:label path="password">Wachtwoord:</form:label>
		<div>
			<form:password path="password" />

			<form:errors path="password" cssClass="error" />
		</div>
		<br />
		<form:label path="confirmPassword">Bevestig wachtwoord:</form:label>
		<div>
			<form:password path="confirmPassword" />

			<form:errors path="confirmPassword" cssClass="error" />
		</div>
		<p />
		<input class="red" type="submit" value="Maak account" />
	</form:form>
</body>
</html>