<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="nl">
<head>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
<title>Jouw conversaties</title>
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>



	<c:choose>
		<c:when test="${not empty yourThreads }">

			<h2>Alle gesprekken:</h2>


			<table>
				<thead>
					<tr>
						<th>Onderwerp</th>
						<th>Verstuurd op</th>
						<th>Met</th>
					</tr>
				</thead>
				<tbody>
					<tr>

						<td><c:forEach var="message" items="${yourThreads}">

								<c:url var="url" value="/messages/read">
									<c:param name="id" value="${message.id}" />
								</c:url>

								<a href="${url}">${message.subject}</a>
								<p />
							</c:forEach></td>

						<td><c:forEach var="message" items="${yourThreads}">${message.date}<p />
							</c:forEach></td>

						<td><c:forEach var="message" items="${yourThreads}">${message.sender}&nbsp;
						<img
									src="${pageContext.servletContext.contextPath}/images/arrow.png"
									align="top" alt="arrow" style="width: 12px; height: 12px">
								
									&nbsp;${message.receiver}<p />
							</c:forEach></td>


					</tr>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<h1>Geen berichten</h1>
		</c:otherwise>
	</c:choose>
</body>
</html>

