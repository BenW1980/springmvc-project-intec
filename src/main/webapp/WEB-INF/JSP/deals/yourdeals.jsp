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

<title>Jouw deals</title>
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>

	<c:url value="/yourdeals" var="url" />
	<form:form action="${url}" method="post" modelAttribute="deal">

		<h2>Jouw deals</h2>

		<c:choose>
			<c:when test="${not empty allDeals}">

				<c:choose>
					<c:when test="${not empty confirmedDeals}">
		
		<h2>Succesvolle deals:</h2>
						<form:errors path="dealid" cssClass="error" />
						<p />
						<table>
							<thead>
								<tr>
									<th></th>
									<th>Jouw aanbod</th>
									<th>In ruil voor</th>
									<th>Aan</th>
									<th>Opmerking</th>
									<th>Status</th>
									<th>Datum</th>
								</tr>
							</thead>
							<tbody>
								<tr>

									<td><form:radiobuttons items="${confirmedDeals}"
											path="dealid" itemValue="dealid" itemLabel="dealFinal"
											delimiter="<p/>" />
										<p /></td>

									<td><c:forEach var="deal" items="${confirmedDeals}">${deal.senderGame}
							<p />
										</c:forEach></td>

									<td><c:forEach var="deal" items="${confirmedDeals}">${deal.receiverGame}
							<p />
										</c:forEach></td>

									<td><c:forEach var="deal" items="${confirmedDeals}">${deal.receiver}
							<p />
										</c:forEach></td>


									<td><c:forEach var="deal" items="${confirmedDeals}">
											<i>${deal.message}</i>
											<p />

										</c:forEach></td>

									<td><c:forEach var="deal" items="${confirmedDeals}">${deal.status }&nbsp;
										<img
												src="${pageContext.servletContext.contextPath}/images/check2.jpg"
												align="top" alt="check" style="width: 12px; height: 12px">
											<p />

											<p />
										</c:forEach></td>
									<td><c:forEach var="deal" items="${confirmedDeals}">${deal.date}
															<p />
										</c:forEach></td>
								</tr>
							</tbody>
						</table>
						<p />
						<input class="red" value="Markeer als voltooid" name="action"
							type="submit" />
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${not empty newDeals }">
						<p />
		<h2>Nieuwe deals:</h2>
						<form:errors path="dealid" cssClass="error" />

						<p />
						<table>
							<tr>
								<th>Aanbod van user</th>
								<th>In ruil voor</th>
								<th>Van</th>
								<th>Opmerking</th>
								<th>Status</th>
								<th>Datum</th>
							</tr>
							<tr>

								<td><form:radiobuttons items="${newDeals}" path="dealid"
										itemValue="dealid" itemLabel="senderGame" delimiter="<p/>" />
									<p /></td>

								<td><c:forEach var="deal" items="${newDeals}">${deal.receiverGame}
							<p />
									</c:forEach></td>

								<td><c:forEach var="deal" items="${newDeals}">

										<c:url var="url" value="/games/user">
											<c:param name="username" value="${deal.sender.username}" />
										</c:url>

										<a href="${url}">${deal.sender}</a>
										<p />
									</c:forEach></td>

								<td><c:forEach var="deal" items="${newDeals}">
										<i>${deal.message}</i>
										<p />
									</c:forEach></td>
								<td><c:forEach var="deal" items="${newDeals}">${deal.status}
							<p />
									</c:forEach></td>
								<td><c:forEach var="deal" items="${newDeals}">${deal.date}
															<p />
									</c:forEach></td>
							</tr>
						</table>
						<p />
						<input class="red" value="Accepteer aanbod" name="action"
							type="submit" />
						<input class="red" value="Weiger aanbod" name="action"
							type="submit" />
					</c:when>
					<c:otherwise>
						<br />
						<b></b>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${not empty madeDeals}">
						<p />
		
		<h2>Deals die jij hebt gemaakt en nog niet zijn bevestigd:</h2><p />

						<table>
							<thead>
								<tr>
									<th>Jouw aanbod</th>
									<th>In ruil voor</th>
									<th>Aan</th>
									<th>Opmerking</th>
									<th>Status</th>
									<th>Datum</th>
								</tr>
							</thead>
							<tbody>
								<tr>

									<td><c:forEach var="deal" items="${madeDeals}">${deal.senderGame}
							<p />
										</c:forEach></td>

									<td><c:forEach var="deal" items="${madeDeals}">${deal.receiverGame}
							<p />
										</c:forEach></td>

									<td><c:forEach var="deal" items="${madeDeals}">${deal.receiver}
							<p />
										</c:forEach></td>



									<td><c:forEach var="deal" items="${madeDeals}">
											<i>${deal.message}</i>
											<p />

										</c:forEach></td>

									<td><c:forEach var="deal" items="${madeDeals}">${deal.status}
							<p />
										</c:forEach></td>
									<td><c:forEach var="deal" items="${madeDeals}">${deal.date}
															<p />
										</c:forEach></td>
								</tr>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<p />
			</c:when>
			<c:otherwise>
			Je hebt momenteel geen actieve deals
			</c:otherwise>
		</c:choose>
		<p />
		<c:choose>
			<c:when test="${not empty doneDealsNotYetConfirmed }">
		
		<h2>Succesvolle deals, onderweg naar de aanbieder voor een laatste bevestiging!:</h2>

			<table>
					<tr>
						<th>Aanbod</th>
						<th>In ruil voor</th>
						<th>Wie</th>
						<th>Opmerking</th>
						<th>Resultaat</th>
						<th>Datum</th>
					</tr>
					<tr>

						<td><c:forEach var="deal" items="${doneDealsNotYetConfirmed}">${deal.senderGame}
							<p />
							</c:forEach></td>

						<td><c:forEach var="deal" items="${doneDealsNotYetConfirmed}">${deal.receiverGame}
							<p />
							</c:forEach></td>

						<td><c:forEach var="deal" items="${doneDealsNotYetConfirmed}">${deal.sender}&nbsp;
						<img
									src="${pageContext.servletContext.contextPath}/images/arrow.png"
									align="top" alt="arrow" style="width: 12px; height: 12px">
									&nbsp;${deal.receiver}
							<p />
							</c:forEach></td>

						<td><c:forEach var="deal" items="${doneDealsNotYetConfirmed}">
								<i>${deal.message}</i>
								<p />

							</c:forEach></td>

						<td><c:forEach var="deal" items="${doneDealsNotYetConfirmed}">${deal.status}
							<p />
							</c:forEach></td>
						<td><c:forEach var="deal" items="${doneDealsNotYetConfirmed}">${deal.date}
															<p />
							</c:forEach></td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		<p />

		<c:choose>
			<c:when test="${not empty doneDeals }">
		
		<h2>Voltooide deals:</h2>
		
		<c:url var="url" value="/messages/send">
					<c:param name="username" value="${param.username}" />
				</c:url>

				<table>
					<tr>
						<th>Aanbod</th>
						<th>In ruil voor</th>
						<th>Wie</th>
						<th>Opmerking</th>
						<th>Resultaat</th>
						<th>Datum</th>
					</tr>
					<tr>

						<td><c:forEach var="deal" items="${doneDeals}">

								
						
						${deal.senderGame}
							<p />
							</c:forEach></td>

						<td><c:forEach var="deal" items="${doneDeals}">${deal.receiverGame}
							<p />
							</c:forEach></td>

						<td><c:forEach var="deal" items="${doneDeals}">
								<c:url var="url" value="/games/user">
									<c:param name="username" value="${deal.sender.username}" />
								</c:url>
								<c:url var="url2" value="/games/user">
									<c:param name="username" value="${deal.receiver.username}" />
								</c:url>
								<a href="${url}">${deal.sender.username}</a>&nbsp;
						
						<img
									src="${pageContext.servletContext.contextPath}/images/arrow.png"
									align="top" alt="arrow" style="width: 12px; height: 12px">
						
						&nbsp;<a href="${url2}">${deal.receiver.username}</a>
								<p />
							</c:forEach></td>

						<td><c:forEach var="deal" items="${doneDeals}">
								<i>${deal.message}</i>
								<p />

							</c:forEach></td>

						<td><c:forEach var="deal" items="${doneDeals}">
								<c:choose>
									<c:when test="${deal.status eq 'Aangenomen'}">${deal.status}&nbsp;
										<img
											src="${pageContext.servletContext.contextPath}/images/check2.jpg"
											align="top" alt="check" style="width: 12px; height: 12px">
										<p />
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${deal.status eq 'Geweigerd'}">${deal.status}</c:when>
								</c:choose>
								<p />

							</c:forEach></td>
						<td><c:forEach var="deal" items="${doneDeals}">${deal.date}
															<p />
							</c:forEach></td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</form:form>
</body>
</html>

