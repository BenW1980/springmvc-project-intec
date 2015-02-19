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
<title>Database down</title>
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>

De database is momenteel down, probeer het later nog eens.

</body>
</html>