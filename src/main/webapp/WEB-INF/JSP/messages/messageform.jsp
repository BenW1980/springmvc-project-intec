<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="nl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stuur een bericht</title>
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

	<h2>Stuur een bericht naar ${param.username}</h2>

	<form:form method="post" modelAttribute="message">

		<form:label id="subject" type="text" path="subject">Onderwerp</form:label>
		<form:input path="subject" autofocus="autofocus" />
		<form:errors path="subject" cssClass="error"></form:errors>
		<br />
				Bericht:<br />
		<form:textarea id="comment" maxlength="140" path="content"
			type="textarea" rows="8" cols="29" />
		<form:errors path="content" cssClass="error"></form:errors>
		<p />

		<input class="red" value="Verstuur" type="submit" />

	</form:form>
</body>
</html>
