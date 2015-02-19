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
<title>Probleem</title>
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>

	Er is blijkbaar iets misgelopen. Mogelijk is er een probleem met de
	server.
	<p />
	Probeer het later opnieuw.

</body>
</html>