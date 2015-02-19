<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ruil met ${param.username}!</title>
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
				})

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
	<p />



	<c:url var="url" value="/messages/send">
		<c:param name="username" value="${param.username}" />
	</c:url>

	<i><b>Ruil met elkaar of <a href="${url}">stuur een bericht</a>
			naar ${param.username}
	</b></i>



	<c:url value="/games/user" var="url" />
	<form:form action="${url}" method="post" modelAttribute="deal">

		<div id="container">
			<p />
			<div id="left-col">
				<c:choose>
					<c:when test="${not empty theirGameList }">
						<b>${param.username} biedt aan:</b>
						<form:errors path="receiverGame" cssClass="error" />
						<p />
						<table>
							<thead>
								<tr>
									<th>Titel</th>
									<th>Platform</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><form:radiobuttons items="${theirGameList}"
											path="receiverGame.gameId" itemValue="gameId" 
											itemLabel="title" delimiter="<br/>" /></td>

									<td><c:forEach var="game" items="${theirGameList}">${game.platform.platformName}<br />
										</c:forEach></td>

								</tr>
							</tbody>
						</table>

					</c:when>
					<c:otherwise>
						<br />
						<b>Geen games gevonden.</b>
					</c:otherwise>
				</c:choose>
				<p />
				<b>Bijkomende info(optioneel):</b>
				<p />
				<div id="left-colWindow">
					<form:textarea id="comment" maxlength="50" path="message"
						type="textarea" rows="8	" cols="35" />
					<br /> <input class="red" value="Maak een deal!" type="submit" />
				</div>
			</div>

			<div id="right-col">
				<c:choose>
					<c:when test="${not empty yourGameList }">
						<b>Jij biedt aan:</b>
						<form:errors path="senderGame" cssClass="error" />
						<p />
						<table cellpadding="10" cellspacing="10">
							<tr>
								<th>Titel</th>
								<th>Platform</th>
							</tr>
							<tr>
								<td><form:radiobuttons items="${yourGameList}"
										path="senderGame.gameId" itemValue="gameId" itemLabel="title"
										delimiter="<br/>" /></td>

								<td><c:forEach var="game" items="${yourGameList}">${game.platform.platformName}<br />
									</c:forEach></td>
							</tr>
						</table>

					</c:when>
					<c:otherwise>
						<br />
						<b>Jij hebt nog geen games. Voeg er eentje toe!</b>
					</c:otherwise>
				</c:choose>
			</div>
		</div>




	</form:form>
	<p />

	<c:choose>
		<c:when test="${not empty dealsByYou }">
			<p />
			<b>Deals die jij hebt verstuurd (nog niet beantwoord):</b>
			<p />
			<table>
				<tr>
					<th>Jouw aanbod</th>
					<th>In ruil voor</th>
					<th>Aan</th>
					<th>Opmerking</th>
					<th>Status</th>
					<th>Datum</th>
				</tr>
				<tr>

					<td><c:forEach var="deal" items="${dealsByYou}">${deal.senderGame}
							<p />
						</c:forEach></td>

					<td><c:forEach var="deal" items="${dealsByYou}">${deal.receiverGame}
							<p />
						</c:forEach></td>

					<td><c:forEach var="deal" items="${dealsByYou}">${deal.receiver}
							<p />
						</c:forEach></td>



					<td><c:forEach var="deal" items="${dealsByYou}">
							<i>${deal.message}</i>
							<p />
						</c:forEach></td>
					<td><c:forEach var="deal" items="${dealsByYou}">${deal.status}
							<p />
						</c:forEach></td>
					<td><c:forEach var="deal" items="${dealsByYou}">${deal.date}
															<p />
						</c:forEach></td>

				</tr>
			</table>
		</c:when>
		<c:otherwise>
		</c:otherwise>

	</c:choose>
</body>
</html>