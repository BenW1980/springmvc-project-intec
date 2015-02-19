<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="nl">
<head>
<title>Jouw berichten</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/default.css" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
	
</script>
<script type="text/javascript">
	$(document).ready(
			function() {

				maxLength = $("textarea#comment").attr("maxlength");
				$("textarea#comment").after(
						"<div><span id='remainingLengthTempId'>" + maxLength
								+ "</span> tekens resterend</div>");

				$("textarea#comment").bind("keyup change", function() {
					checkMaxLength(this.id, maxLength);
				});

			});

	function checkMaxLength(textareaID, maxLength) {

		currentLengthInTextarea = $("#" + textareaID).val().length;
		$(remainingLengthTempId).text(
				parseInt(maxLength) - parseInt(currentLengthInTextarea));

		if (currentLengthInTextarea > (maxLength)) {

			$("textarea#comment").val(
					$("textarea#comment").val().slice(0, maxLength));
			$(remainingLengthTempId).text(0);

		}
	}
</script>

</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>
	<h2>Gesprek tussen ${originalMessage.sender} en
		${originalMessage.receiver}</h2>

	<h2>Onderwerp: ${originalMessage.subject}</h2>

	<c:choose>
		<c:when test="${not empty newMessagesInThread }">
			<h2>Nieuwe berichten:</h2>
			<table>
				<thead>
					<tr>
						<th>Bericht</th>
						<th>Verstuurd op</th>
						<th>Van</th>
					</tr>
				</thead>
				<tbody>
					<tr>

						<td><c:forEach var="message" items="${newMessagesInThread}">

								${message.content}
								<p />
							</c:forEach></td>

						<td><c:forEach var="message" items="${newMessagesInThread}">${message.date}<p />
							</c:forEach></td>

						<td><c:forEach var="message" items="${newMessagesInThread}">${message.sender}<p />
							</c:forEach></td>
					</tr>
				</tbody>
			</table>


		</c:when>

		<c:otherwise>
			<br />
			<b>Geen nieuwe berichten in dit gesprek</b>
		</c:otherwise>
	</c:choose>


	<c:url value="/messages/read" var="url" />

	<form:form action="${url}" method="post" modelAttribute="message">

		<br />
		<form:textarea id="comment" maxlength="140" path="content"
			type="textarea" rows="8" cols="29" />
		<form:errors path="content" cssClass="error"></form:errors>
		<p />

		<input class="red" value="Verstuur" type="submit" />

	</form:form>



	<c:choose>
		<c:when test="${not empty oldMessagesInThread }">
			<h2>Alle berichten:</h2>
			<table>
				<thead>
					<tr>
						<th>Bericht</th>
						<th>Verstuurd op</th>
						<th>Van</th>
					</tr>
				</thead>
				<tbody>
					<tr>

						<td><c:forEach var="message" items="${oldMessagesInThread}">

								${message.content}
								<p />
							</c:forEach></td>

						<td><c:forEach var="message" items="${oldMessagesInThread}">${message.date}<p />
							</c:forEach></td>

						<td><c:forEach var="message" items="${oldMessagesInThread}">${message.sender}<p />
							</c:forEach></td>
					</tr>
				</tbody>
			</table>


		</c:when>

		<c:otherwise>
			<br />
			<b>Geen berichten</b>
		</c:otherwise>
	</c:choose>





</body>
</html>

