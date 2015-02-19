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
<title>Broncode</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<jsp:include page="/WEB-INF/JSP/menu.jsp" />
<body>
	<p />
	<p />
	Deze site werd opgesteld via het MVC-patroon
	<b>(Model - View - Controller)</b>. Hier beneden ziet u een extract van
	de broncode. Het programma is geschreven met de
	<b>Eclipse IDE</b>.
	<p />
	De volledige broncode van het project kan na verzoek worden
	vrijgegeven.
	<p />
	<p />

	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">DAO class</a></li>
			<li><a href="#tabs-2">Entity class + Hibernate mappings</a></li>
			<li><a href="#tabs-3">Controller</a></li>
			<li><a href="#tabs-4">View (JSP)</a></li>
			<li><a href="#tabs-5">Database design</a></li>
		</ul>
		<div id="tabs-1">
			<div
				style='background: #FFFFFF; font-family: Courier New, Courier; font-size: 10pt; COLOR: #000000; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;'>
				<font color='#3f7f5f'>//&nbsp;Verschillende&nbsp;imports&nbsp;(hier&nbsp;niet&nbsp;getoond)
				</font><br /> <font color='#646464'>@Repository</font> <br /> <strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>class</font></strong>&nbsp;DealDaoImpl&nbsp;<strong><font
					color='#7f0055'>implements</font></strong>&nbsp;DealDao&nbsp;{ <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@PersistenceContext</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;EntityManager&nbsp;entityManager;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Override</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;addDeal(Deal&nbsp;deal)&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;entityManager.persist(deal);
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Override</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;Deal&nbsp;getDeal(Long&nbsp;id)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;entityManager.find(Deal.<strong><font
					color='#7f0055'>class</font></strong>,&nbsp;id); <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Override</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;List
				&lt;Deal&gt;&nbsp;listNewDealsForUser(User&nbsp;user)&nbsp;{ <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TypedQuery&lt;Deal&gt;&nbsp;query&nbsp;=&nbsp;entityManager.createNamedQuery(
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"findAllNewDealsForUser"</font>,&nbsp;Deal.<strong><font
					color='#7f0055'>class</font></strong>); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query.setParameter(<font
					color='#2a00ff'>"user"</font>,&nbsp;user); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;query.getResultList(); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Override</font> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;List&lt;Deal&gt;&nbsp;listAllDealsForUser(User&nbsp;user)&nbsp;{
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TypedQuery&lt;Deal&gt;
				&nbsp;query&nbsp;=&nbsp;entityManager.createNamedQuery( <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"findAllDealsForUser"</font>,&nbsp;Deal.<strong><font
					color='#7f0055'>class</font></strong>); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query.setParameter(<font
					color='#2a00ff'>"user"</font>,&nbsp;user); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;query.getResultList(); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Override</font> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;List&lt;Deal&gt;&nbsp;listMadeDeals(User&nbsp;user)&nbsp;{
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TypedQuery&lt;Deal&gt;&nbsp;query&nbsp;=&nbsp;entityManager.createNamedQuery(
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"findMadeDeals"</font>,&nbsp;Deal.<strong><font
					color='#7f0055'>class</font></strong>); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query.setParameter(<font
					color='#2a00ff'>"user"</font>,&nbsp;user); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;query.getResultList(); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Override</font> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;List&lt;Deal&gt;&nbsp;listConfirmedDealsForUser(User&nbsp;user)&nbsp;{
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TypedQuery&lt;Deal&gt;&nbsp;query&nbsp;=&nbsp;entityManager.createNamedQuery(
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"findAllConfirmedDealsForUser "</font>,&nbsp;Deal.<strong><font
					color='#7f0055'>class</font></strong>); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query.setParameter(<font
					color='#2a00ff'>"user"</font>,&nbsp;user); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;query.getResultList(); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br /> &nbsp;&nbsp;&nbsp;&nbsp; <br />
				&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Override</font> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><font color='#7f0055'>public</font></strong>&nbsp;List&lt;Deal&gt;&nbsp;listAllDoneDealsNotYetConfirmed(User&nbsp;user)&nbsp;{
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TypedQuery&lt;Deal&gt;&nbsp;query&nbsp;=&nbsp;entityManager.createNamedQuery(
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"findAllDoneDealsNotYetConfirmed"</font>,&nbsp;Deal.<strong><font
					color='#7f0055'>class</font></strong>); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query.setParameter(<font
					color='#2a00ff'>"user"</font>,&nbsp;user); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;query.getResultList(); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br /> &nbsp;&nbsp;&nbsp;&nbsp; <br />
				&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Override</font> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><font color='#7f0055'>public</font></strong>&nbsp;List&lt;Deal&gt;&nbsp;findAllSenderGamesInDeals(Long&nbsp;id)&nbsp;{
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TypedQuery&lt;Deal&gt;&nbsp;query&nbsp;=&nbsp;entityManager.createNamedQuery(
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"findAllSenderGamesInDeals"</font>,&nbsp;Deal.<strong><font
					color='#7f0055'>class</font></strong>); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query.setParameter(<font
					color='#2a00ff'>"id"</font>,&nbsp;id); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;query.getResultList(); <br /> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Override</font> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;List&lt;Deal&gt;&nbsp;findAllReceiverGamesInDeals(Long&nbsp;id)&nbsp;{
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TypedQuery&lt;Deal&gt;&nbsp;query&nbsp;=&nbsp;entityManager.createNamedQuery(
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"findAllReceiverGamesInDeals"</font>,&nbsp;Deal.<strong><font
					color='#7f0055'>class</font></strong>); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query.setParameter(<font
					color='#2a00ff'>"id"</font>,&nbsp;id); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;query.getResultList(); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Override</font> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;removeDeal(Long&nbsp;id)&nbsp;{ <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deal&nbsp;deal&nbsp;=&nbsp;entityManager.find(Deal.<strong><font
					color='#7f0055'>class</font></strong>,&nbsp;id); <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(deal&nbsp;!=&nbsp;<strong><font
					color='#7f0055'>null</font></strong>)&nbsp;{ <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;entityManager.remove(deal);
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;entityManager.flush();
				<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Override</font> <br /> &nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;update(Deal&nbsp;deal)&nbsp;{ <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>try</font></strong>&nbsp;{ <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;entityManager.merge(deal);
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;entityManager.flush();
				<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<strong><font
					color='#7f0055'>catch</font></strong>&nbsp;(RuntimeException&nbsp;e)&nbsp;{
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;entityManager.clear();
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>throw</font></strong>&nbsp;e; <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;} <br />
			</div>
		</div>
		<div id="tabs-2">
			<div
				style='background: #FFFFFF; font-family: Courier New, Courier; font-size: 10pt; COLOR: #000000; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;'>
				<font color='#3f7f5f'>//&nbsp;Verschillende&nbsp;imports&nbsp;(hier&nbsp;niet&nbsp;getoond)
				</font><br /> <font color='#646464'>@NamedQueries</font>({ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NamedQuery</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"findAllSenderGamesInDeals"</font>,&nbsp;query&nbsp;=&nbsp;<font
					color='#2a00ff'>"select&nbsp;d&nbsp;from&nbsp;Deal&nbsp;d&nbsp;where&nbsp;d.senderGame.gameId&nbsp;=&nbsp;:id"</font>),
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NamedQuery</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"findAllReceiverGamesInDeals"</font>,&nbsp;query&nbsp;=&nbsp;<font
					color='#2a00ff'>"select&nbsp;d&nbsp;from&nbsp;Deal&nbsp;d&nbsp;where&nbsp;d.receiverGame.gameId&nbsp;=&nbsp;:id"</font>),
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NamedQuery</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"findAllDealsForUser"</font>,&nbsp;query&nbsp;=&nbsp;<font
					color='#2a00ff'>"select&nbsp;d&nbsp;from&nbsp;Deal&nbsp;d&nbsp;where&nbsp;d.sender&nbsp;=&nbsp;:user&nbsp;or&nbsp;d.receiver&nbsp;=&nbsp;:user"</font>),
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NamedQuery</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"findAllNewDealsForUser"</font>,&nbsp;query&nbsp;=&nbsp;<font
					color='#2a00ff'>"select&nbsp;d&nbsp;from&nbsp;Deal&nbsp;d&nbsp;where&nbsp;d.receiver&nbsp;=&nbsp;:user&nbsp;and&nbsp;d.unread&nbsp;=&nbsp;1&nbsp;and&nbsp;d.status&nbsp;like&nbsp;'Te&nbsp;behandelen'"</font>),
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NamedQuery</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"findMadeDeals"</font>,&nbsp;query&nbsp;=&nbsp;<font
					color='#2a00ff'>"select&nbsp;d&nbsp;from&nbsp;Deal&nbsp;d&nbsp;where&nbsp;d.sender&nbsp;=&nbsp;:user&nbsp;and&nbsp;d.unread&nbsp;=&nbsp;1&nbsp;and&nbsp;d.status&nbsp;like&nbsp;'Te&nbsp;behandelen'"</font>),
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NamedQuery</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"findAllConfirmedDealsForUser"</font>,&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query&nbsp;=&nbsp;<font
					color='#2a00ff'>"select&nbsp;d&nbsp;from&nbsp;Deal&nbsp;d&nbsp;where&nbsp;d.sender&nbsp;=&nbsp;:user&nbsp;and&nbsp;&nbsp;d.status&nbsp;like&nbsp;'Aangenomen'&nbsp;and&nbsp;d.confirmedDealViewed&nbsp;=&nbsp;0"</font>),
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NamedQuery</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"findAllDoneDealsNotYetConfirmed"</font>,&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;query&nbsp;=&nbsp;<font
					color='#2a00ff'>"select&nbsp;d&nbsp;from&nbsp;Deal&nbsp;d&nbsp;where&nbsp;&nbsp;d.receiver&nbsp;=&nbsp;:user&nbsp;and&nbsp;d.confirmedDealViewed&nbsp;=&nbsp;0&nbsp;and&nbsp;d.actionTaken&nbsp;=&nbsp;1&nbsp;order&nbsp;by&nbsp;d.dealid&nbsp;desc"</font>)&nbsp;})
				<br /> <font color='#646464'>@Entity</font> <br /> <font
					color='#646464'>@Table</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"deals"</font>) <br /> <strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>class</font></strong>&nbsp;Deal&nbsp;<strong><font
					color='#7f0055'>implements</font></strong>&nbsp;Serializable&nbsp;{ <br />
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;<strong><font
					color='#7f0055'>static</font></strong>&nbsp;<strong><font
					color='#7f0055'>final</font></strong>&nbsp;<strong><font
					color='#7f0055'>long</font></strong>&nbsp;serialVersionUID&nbsp;=&nbsp;1854288732562962565L;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Id</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@GeneratedValue</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;Long&nbsp;dealid; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@ManyToOne</font>(fetch&nbsp;=&nbsp;FetchType.LAZY)
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@JoinColumn</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"receiver"</font>) <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Valid</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;User&nbsp;receiver; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@ManyToOne</font>(fetch&nbsp;=&nbsp;FetchType.LAZY)
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@JoinColumn</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"sender"</font>) <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Valid</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;User&nbsp;sender; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@ManyToOne</font>(fetch&nbsp;=&nbsp;FetchType.LAZY)
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@JoinColumn</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"receiver_game"</font>) <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NotNull</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;Game&nbsp;receiverGame; <br />
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@ManyToOne</font>(fetch&nbsp;=&nbsp;FetchType.LAZY)
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@JoinColumn</font>(name&nbsp;=&nbsp;<font
					color='#2a00ff'>"sender_game"</font>) <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@NotNull</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;Game&nbsp;senderGame; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;String&nbsp;message; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;unread; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;String&nbsp;status; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;String&nbsp;date; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;actionTaken; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;confirmedDealViewed; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Transient</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;String&nbsp;dealFinal; <br />
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Transient</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;List&lt;Game&gt;&nbsp;theirGameList;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Transient</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;List&lt;Game&gt;&nbsp;yourGameList;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;Deal()&nbsp;{ <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;Deal(User&nbsp;receiver,&nbsp;User&nbsp;sender,&nbsp;Game&nbsp;receiverGame,&nbsp;Game&nbsp;senderGame,
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;subject,&nbsp;String&nbsp;message,&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;unread,&nbsp;String&nbsp;status,
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;date,&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;actionTaken,&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;confirmedDealViewed)&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.receiver&nbsp;=&nbsp;receiver; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.sender&nbsp;=&nbsp;sender; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.receiverGame&nbsp;=&nbsp;receiverGame;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.senderGame&nbsp;=&nbsp;senderGame; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.message&nbsp;=&nbsp;message; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.unread&nbsp;=&nbsp;unread; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.status&nbsp;=&nbsp;status; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.date&nbsp;=&nbsp;date; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.actionTaken&nbsp;=&nbsp;actionTaken; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.confirmedDealViewed&nbsp;=&nbsp;confirmedDealViewed;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;Long&nbsp;getDealid()&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;dealid; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setDealid(Long&nbsp;dealid)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.dealid&nbsp;=&nbsp;dealid; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;User&nbsp;getReceiver()&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;receiver; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setReceiver(User&nbsp;receiver)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.receiver&nbsp;=&nbsp;receiver; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;User&nbsp;getSender()&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;sender; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setSender(User&nbsp;sender)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.sender&nbsp;=&nbsp;sender; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;List&lt;Game&gt;&nbsp;getTheirGameList()&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;theirGameList; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setTheirGameList(List&lt;Game&gt;&nbsp;theirGameList)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.theirGameList&nbsp;=&nbsp;theirGameList;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;List&lt;Game&gt;&nbsp;getYourGameList()&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;yourGameList; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setYourGameList(List&lt;Game&gt;&nbsp;yourGameList)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.yourGameList&nbsp;=&nbsp;yourGameList;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;Game&nbsp;getReceiverGame()&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;receiverGame; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setReceiverGame(Game&nbsp;receiverGame)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.receiverGame&nbsp;=&nbsp;receiverGame;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;Game&nbsp;getSenderGame()&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;senderGame; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setSenderGame(Game&nbsp;senderGame)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.senderGame&nbsp;=&nbsp;senderGame; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;String&nbsp;getMessage()&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;message; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setMessage(String&nbsp;message)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.message&nbsp;=&nbsp;message; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;String&nbsp;getStatus()&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;status; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setStatus(String&nbsp;status)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.status&nbsp;=&nbsp;status; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;isUnread()&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;unread; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setUnread(<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;unread)&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.unread&nbsp;=&nbsp;unread; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;String&nbsp;getDate()&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;date; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setDate(String&nbsp;date)&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.date&nbsp;=&nbsp;date; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;isActionTaken()&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;actionTaken; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setActionTaken(<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;actionTaken)&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.actionTaken&nbsp;=&nbsp;actionTaken; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;isConfirmedDealViewed()&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;confirmedDealViewed; <br />&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setConfirmedDealViewed(<strong><font
					color='#7f0055'>boolean</font></strong>&nbsp;confirmedDealViewed)&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.confirmedDealViewed&nbsp;=&nbsp;confirmedDealViewed;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;String&nbsp;getDealFinal()&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"Voltooi"</font>;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>void</font></strong>&nbsp;setDealFinal(String&nbsp;dealFinal)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>this</font></strong>.dealFinal&nbsp;=&nbsp;dealFinal;
			</div>
		</div>
		<div id="tabs-3">
			<div
				style='background: #FFFFFF; font-family: Courier New, Courier; font-size: 10pt; COLOR: #000000; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;'>
				<font color='#3f7f5f'>//&nbsp;Verschillende&nbsp;imports&nbsp;(hier&nbsp;niet&nbsp;getoond)
				</font><br /> <font color='#646464'>@Controller</font> <br /> <strong><font
					color='#7f0055'>public</font></strong>&nbsp;<strong><font
					color='#7f0055'>class</font></strong>&nbsp;DealController&nbsp;{ <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Autowired</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;GameService&nbsp;gameService; <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Autowired</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;PlatformService&nbsp;platformService;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Autowired</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;DealService&nbsp;dealService; <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Autowired</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;GameDumpService&nbsp;gameDumpService;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Autowired</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;UserService&nbsp;userService; <br />&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@Autowired</font> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;CompletedDealService&nbsp;completedDealService;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@Autowired</font>
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;HomeController&nbsp;hc; <br />
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;User&nbsp;receiver; <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>private</font></strong>&nbsp;SimpleDateFormat&nbsp;df&nbsp;=&nbsp;<strong><font
					color='#7f0055'>new</font></strong>&nbsp;SimpleDateFormat(<font
					color='#2a00ff'>"dd/MM/yyyy&nbsp;HH:mm"</font>); <br />&nbsp;&nbsp;&nbsp;&nbsp;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#3f7f5f'>//&nbsp;Maakt&nbsp;het&nbsp;formulier&nbsp;aan&nbsp;en&nbsp;presenteert&nbsp;dit&nbsp;aan&nbsp;de&nbsp;user
				</font><br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@RequestMapping</font>(value&nbsp;=&nbsp;<font
					color='#2a00ff'>"/games/user"</font>,&nbsp;method&nbsp;=&nbsp;RequestMethod.GET,&nbsp;params&nbsp;=&nbsp;<font
					color='#2a00ff'>"username"</font>) <br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;String&nbsp;newDealForm(Principal&nbsp;principal,
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@RequestParam</font>&nbsp;String&nbsp;username,&nbsp;Model&nbsp;model)&nbsp;{
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(!model.containsAttribute(<font
					color='#2a00ff'>"deal"</font>))&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"deal"</font>,&nbsp;<strong><font
					color='#7f0055'>new</font></strong>&nbsp;Deal()); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(username.equals(principal.getName()))&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"redirect:/games/yourgames"</font>;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;receiver&nbsp;=&nbsp;userService.getUser(username);
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User&nbsp;sender&nbsp;=&nbsp;userService.getUser(principal.getName());
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"dealsByYou"</font>,&nbsp;dealService.listMadeDeals(sender));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"theirGameList"</font>,&nbsp;gameService.listGame(username));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"yourGameList"</font>, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gameService.listGame(principal.getName()));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hc.initialiseSession(principal,&nbsp;model);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"user/gamesperuser"</font>;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;} <br />&nbsp;&nbsp;&nbsp;&nbsp;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#3f7f5f'>//&nbsp;Submit&nbsp;het&nbsp;formulier&nbsp;(indien&nbsp;de&nbsp;validatie&nbsp;ok&nbsp;is)
				</font><br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@RequestMapping</font>(value&nbsp;=&nbsp;<font
					color='#2a00ff'>"/games/user"</font>,&nbsp;method&nbsp;=&nbsp;RequestMethod.POST)
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;String&nbsp;newDealSubmit(<font
					color='#646464'>@ModelAttribute</font>(<font color='#2a00ff'>"deal"</font>)&nbsp;<font
					color='#646464'>@Valid</font>&nbsp;Deal&nbsp;deal, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BindingResult&nbsp;result,&nbsp;Principal&nbsp;principal,&nbsp;Model&nbsp;model,
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RedirectAttributes&nbsp;redirectAttributes)&nbsp;{
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(result.hasErrors())&nbsp;{ <br />
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redirectAttributes
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addFlashAttribute(
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"org.springframework.validation.BindingResult.deal"</font>,
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redirectAttributes.addFlashAttribute(<font
					color='#2a00ff'>"deal"</font>,&nbsp;deal); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"redirect:/games/user?username="</font>&nbsp;+&nbsp;receiver.getUsername();
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User&nbsp;sender&nbsp;=&nbsp;userService.getUser(principal.getName());
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"theirGameList"</font>, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gameService.listGame(receiver.getUsername()));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"yourGameList"</font>, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gameService.listGame(principal.getName()));
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setReceiver(receiver);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setSender(sender);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setUnread(<strong><font
					color='#7f0055'>true</font></strong>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setActionTaken(<strong><font
					color='#7f0055'>false</font></strong>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setConfirmedDealViewed(<strong><font
					color='#7f0055'>false</font></strong>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setStatus(<font
					color='#2a00ff'>"Te&nbsp;behandelen"</font>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setDate(df.format(<strong><font
					color='#7f0055'>new</font></strong>&nbsp;Date())); <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(deal.getMessage().trim().length()&nbsp;==&nbsp;0)&nbsp;{
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setMessage(<font
					color='#2a00ff'>"-"</font>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dealService.addDeal(deal);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hc.initialiseSession(principal,&nbsp;model);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"redirect:/games/user?username="</font>&nbsp;+&nbsp;receiver.getUsername();
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;} <br />&nbsp;&nbsp;&nbsp;&nbsp;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#3f7f5f'>//&nbsp;Toont&nbsp;de&nbsp;huidige&nbsp;en&nbsp;afgehandelde&nbsp;deals&nbsp;aan&nbsp;de&nbsp;user
				</font><br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@RequestMapping</font>(value&nbsp;=&nbsp;<font
					color='#2a00ff'>"/yourdeals"</font>,&nbsp;method&nbsp;=&nbsp;RequestMethod.GET)
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;String&nbsp;yourDeals(Principal&nbsp;principal,&nbsp;Model&nbsp;model)&nbsp;{
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(!model.containsAttribute(<font
					color='#2a00ff'>"deal"</font>))&nbsp;{ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"deal"</font>,&nbsp;<strong><font
					color='#7f0055'>new</font></strong>&nbsp;Deal()); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User&nbsp;user&nbsp;=&nbsp;userService.getUser(principal.getName());
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hc.initCountSession(principal,&nbsp;model);
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"allDeals"</font>,&nbsp;dealService.listAllDealsForUser(user));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"newDeals"</font>,&nbsp;dealService.listNewDealsForUser(user));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"doneDeals"</font>, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;completedDealService.listDoneDealsForUser(user));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"madeDeals"</font>,&nbsp;dealService.listMadeDeals(user));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"confirmedDeals"</font>, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dealService.listConfirmedDealsForUser(user));
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"doneDealsNotYetConfirmed"</font>, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dealService.listAllDoneDealsNotYetConfirmed(user));
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"deals/yourdeals"</font>;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;} <br />&nbsp;&nbsp;&nbsp;&nbsp;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#3f7f5f'>//&nbsp;User&nbsp;moet&nbsp;beslissen&nbsp;of&nbsp;hij&nbsp;een&nbsp;aanbod&nbsp;wil&nbsp;accepteren&nbsp;of&nbsp;weigeren
				</font><br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<font color='#646464'>@RequestMapping</font>(value&nbsp;=&nbsp;<font
					color='#2a00ff'>"/yourdeals"</font>,&nbsp;method&nbsp;=&nbsp;RequestMethod.POST)
				<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>public</font></strong>&nbsp;String&nbsp;acceptDeal(<font
					color='#646464'>@ModelAttribute</font>(<font color='#2a00ff'>"deal"</font>)&nbsp;Deal&nbsp;deal,&nbsp;Model&nbsp;model,
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@RequestParam</font>(required&nbsp;=&nbsp;<strong><font
					color='#7f0055'>false</font></strong>,&nbsp;value&nbsp;=&nbsp;<font
					color='#2a00ff'>"action"</font>)&nbsp;String&nbsp;action, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#646464'>@RequestParam</font>(required&nbsp;=&nbsp;<strong><font
					color='#7f0055'>false</font></strong>,&nbsp;value&nbsp;=&nbsp;<font
					color='#2a00ff'>"dealid"</font>)&nbsp;Long&nbsp;dealid, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BindingResult&nbsp;result,&nbsp;RedirectAttributes&nbsp;redirectAttributes,
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Principal&nbsp;principal)&nbsp;{
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User&nbsp;sender&nbsp;=&nbsp;userService.getUser(principal.getName());
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"newDeals"</font>, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dealService.listNewDealsForUser(receiver));
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<font
					color='#2a00ff'>"confirmedDeals"</font>, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dealService.listConfirmedDealsForUser(sender));
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(dealid&nbsp;!=&nbsp;<strong><font
					color='#7f0055'>null</font></strong>&nbsp; &amp;&amp;&nbsp;action.equals(<font
					color='#2a00ff'>"Markeer&nbsp;als&nbsp;voltooid"</font>))&nbsp;{ <br />
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal&nbsp;=&nbsp;dealService.getDeal(dealid);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setConfirmedDealViewed(<strong><font
					color='#7f0055'>true</font></strong>); <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;completedDealService.addCompletedDeal(<strong><font
					color='#7f0055'>new</font></strong>&nbsp;CompletedDeal(deal)); <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dealService.removeDeal(dealid);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hc.initialiseSession(principal,&nbsp;model);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"redirect:/yourdeals"</font>;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(dealid&nbsp;!=&nbsp;<strong><font
					color='#7f0055'>null</font></strong>&nbsp; &amp;&amp; &nbsp;action.equals(<font
					color='#2a00ff'>"Accepteer&nbsp;aanbod"</font>))&nbsp;{ <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal&nbsp;=&nbsp;dealService.getDeal(dealid);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setUnread(<strong><font
					color='#7f0055'>false</font></strong>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setStatus(<font
					color='#2a00ff'>"Aangenomen"</font>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setActionTaken(<strong><font
					color='#7f0055'>true</font></strong>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setConfirmedDealViewed(<strong><font
					color='#7f0055'>false</font></strong>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dealService.update(deal);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"redirect:/yourdeals"</font>;
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>if</font></strong>&nbsp;(dealid&nbsp;!=&nbsp;<strong><font
					color='#7f0055'>null</font></strong>&nbsp; &amp;&amp; &nbsp;action.equals(<font
					color='#2a00ff'>"Weiger&nbsp;aanbod"</font>))&nbsp;{ <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal&nbsp;=&nbsp;dealService.getDeal(dealid);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setUnread(<strong><font
					color='#7f0055'>false</font></strong>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setStatus(<font
					color='#2a00ff'>"Geweigerd"</font>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setActionTaken(<strong><font
					color='#7f0055'>true</font></strong>); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deal.setConfirmedDealViewed(<strong><font
					color='#7f0055'>true</font></strong>); <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;completedDealService.addCompletedDeal(<strong><font
					color='#7f0055'>new</font></strong>&nbsp;CompletedDeal(deal)); <br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dealService.removeDeal(dealid);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hc.initialiseSession(principal,&nbsp;model);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"redirect:/yourdeals"</font>;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result.rejectValue(<font
					color='#2a00ff'>"dealid"</font>,&nbsp;<font color='#2a00ff'>"dealid.notnull"</font>);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redirectAttributes.addFlashAttribute(
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color='#2a00ff'>"org.springframework.validation.BindingResult.deal"</font>,&nbsp;result);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redirectAttributes.addFlashAttribute(<font
					color='#2a00ff'>"deal"</font>,&nbsp;deal); <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hc.initialiseSession(principal,&nbsp;model);
				<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font
					color='#7f0055'>return</font></strong>&nbsp;<font color='#2a00ff'>"redirect:/yourdeals"</font>;
				<br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;}
			</div>
		</div>
		<div id="tabs-4">
			<div>

				&lt;c:url value="/yourdeals" var="url" /&gt;<br /> &lt;form:form
				action="${url}" method="post" modelAttribute="deal"&gt;<br /> <br />
				&lt;h2&gt;Jouw deals&lt;/h2&gt;<br /> <br /> &lt;c:choose&gt;<br />
				&lt;c:when test="${not empty allDeals}"&gt;<br /> <br />
				&lt;c:choose&gt;<br /> &lt;c:when test="${not empty confirmedDeals}"&gt;<br />
				<br /> Succesvolle deals:<br /> &lt;form:errors path="dealid"
				cssClass="error" /&gt;<br /> &lt;p /&gt;<br /> &lt;table&gt;<br />
				&lt;thead&gt;<br /> &lt;tr&gt;<br /> &lt;th&gt;&lt;/th&gt;<br />
				&lt;th&gt;Jouw aanbod&lt;/th&gt;<br /> &lt;th&gt;In ruil
				voor&lt;/th&gt;<br /> &lt;th&gt;Aan&lt;/th&gt;<br />
				&lt;th&gt;Opmerking&lt;/th&gt;<br /> &lt;th&gt;Status&lt;/th&gt;<br />
				&lt;th&gt;Datum&lt;/th&gt;<br /> &lt;/tr&gt;<br /> &lt;/thead&gt;<br />
				&lt;tbody&gt;<br /> &lt;tr&gt;<br /> <br />
				&lt;td&gt;&lt;form:radiobuttons items="${confirmedDeals}"<br />
				path="dealid" itemValue="dealid" itemLabel="dealFinal"<br />
				delimiter="&lt;p/&gt;" /&gt;<br /> &lt;p /&gt;&lt;/td&gt;<br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal"
				items="${confirmedDeals}"&gt;${deal.senderGame}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${confirmedDeals}"&gt;${deal.receiverGame}<br />
				&lt;p /&gt;<br /> &lt;/c:forEach&gt;&lt;/td&gt;<br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal"
				items="${confirmedDeals}"&gt;${deal.receiver}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal" items="${confirmedDeals}"&gt;<br />
				&lt;i&gt;${deal.message}&lt;/i&gt;<br /> &lt;p /&gt;<br /> <br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${confirmedDeals}"&gt;${deal.status }&amp;nbsp;<br />
				&lt;img<br />
				src="${pageContext.servletContext.contextPath}/images/check2.jpg"<br />
				align="top" alt="check" style="width: 12px; height: 12px"&gt;<br />
				&lt;p /&gt;<br /> <br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${confirmedDeals}"&gt;${deal.date}<br /> &lt;p
				/&gt;<br /> &lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;/tr&gt;<br />
				&lt;/tbody&gt;<br /> &lt;/table&gt;<br /> &lt;p /&gt;<br />
				&lt;input class="red" value="Markeer als voltooid" name="action"<br />
				type="submit" /&gt;<br /> &lt;/c:when&gt;<br />
				&lt;c:otherwise&gt;<br /> &lt;/c:otherwise&gt;<br />
				&lt;/c:choose&gt;<br /> <br /> &lt;c:choose&gt;<br /> &lt;c:when
				test="${not empty newDeals }"&gt;<br /> &lt;p /&gt;<br /> Nieuwe
				deals:<br /> &lt;form:errors path="dealid" cssClass="error" /&gt;<br />
				&lt;p /&gt;<br /> &lt;table&gt;<br /> &lt;tr&gt;<br />
				&lt;th&gt;Aanbod van user&lt;/th&gt;<br /> &lt;th&gt;In ruil
				voor&lt;/th&gt;<br /> &lt;th&gt;User&lt;/th&gt;<br />
				&lt;th&gt;Opmerking&lt;/th&gt;<br /> &lt;th&gt;Status&lt;/th&gt;<br />
				&lt;th&gt;Datum&lt;/th&gt;<br /> &lt;/tr&gt;<br /> &lt;tr&gt;<br />
				<br /> &lt;td&gt;&lt;form:radiobuttons items="${newDeals}"
				path="dealid"<br /> itemValue="dealid" itemLabel="senderGame"
				delimiter="&lt;p/&gt;" /&gt;<br /> &lt;p /&gt;&lt;/td&gt;<br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal"
				items="${newDeals}"&gt;${deal.receiverGame}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${newDeals}"&gt;${deal.sender}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${newDeals}"&gt;<br />
				&lt;i&gt;${deal.message}&lt;/i&gt;<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${newDeals}"&gt;${deal.status}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${newDeals}"&gt;${deal.date}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;/tr&gt;<br />
				&lt;/table&gt;<br /> &lt;p /&gt;<br /> &lt;input class="red"
				value="Accepteer aanbod" name="action"<br /> type="submit" /&gt;<br />
				&lt;input class="red" value="Weiger aanbod" name="action"<br />
				type="submit" /&gt;<br /> &lt;/c:when&gt;<br />
				&lt;c:otherwise&gt;<br /> &lt;br /&gt;<br /> &lt;b&gt;&lt;/b&gt;<br />
				&lt;/c:otherwise&gt;<br /> &lt;/c:choose&gt;<br /> <br />
				&lt;c:choose&gt;<br /> &lt;c:when test="${not empty madeDeals}"&gt;<br />
				&lt;p /&gt;<br /> <br /> Deals die jij hebt gemaakt en nog niet
				zijn bevestigd:&lt;p /&gt;<br /> <br /> &lt;table&gt;<br />
				&lt;thead&gt;<br /> &lt;tr&gt;<br /> &lt;th&gt;Jouw
				aanbod&lt;/th&gt;<br /> &lt;th&gt;In ruil voor&lt;/th&gt;<br />
				&lt;th&gt;Aan&lt;/th&gt;<br /> &lt;th&gt;Opmerking&lt;/th&gt;<br />
				&lt;th&gt;Status&lt;/th&gt;<br /> &lt;th&gt;Datum&lt;/th&gt;<br />
				&lt;/tr&gt;<br /> &lt;/thead&gt;<br /> &lt;tbody&gt;<br />
				&lt;tr&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach var="deal"
				items="${madeDeals}"&gt;${deal.senderGame}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${madeDeals}"&gt;${deal.receiverGame}<br /> &lt;p
				/&gt;<br /> &lt;/c:forEach&gt;&lt;/td&gt;<br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal"
				items="${madeDeals}"&gt;${deal.receiver}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> <br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal" items="${madeDeals}"&gt;<br />
				&lt;i&gt;${deal.message}&lt;/i&gt;<br /> &lt;p /&gt;<br /> <br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${madeDeals}"&gt;${deal.status}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${madeDeals}"&gt;${deal.date}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;/tr&gt;<br />
				&lt;/tbody&gt;<br /> &lt;/table&gt;<br /> &lt;/c:when&gt;<br />
				&lt;c:otherwise&gt;<br /> &lt;/c:otherwise&gt;<br />
				&lt;/c:choose&gt;<br /> &lt;p /&gt;<br /> &lt;/c:when&gt;<br />
				&lt;c:otherwise&gt;<br /> Je hebt momenteel geen actieve deals<br />
				&lt;/c:otherwise&gt;<br /> &lt;/c:choose&gt;<br /> &lt;p /&gt;<br />
				&lt;c:choose&gt;<br /> &lt;c:when test="${not empty doneDealsNotYetConfirmed }"&gt;<br />
				<br /> Succesvolle deals, onderweg naar de aanbieder voor een
				laatste bevestiging!:<br /> <br /> &lt;table&gt;<br /> &lt;tr&gt;<br />
				&lt;th&gt;Aanbod&lt;/th&gt;<br /> &lt;th&gt;In ruil voor&lt;/th&gt;<br />
				&lt;th&gt;Wie&lt;/th&gt;<br /> &lt;th&gt;Opmerking&lt;/th&gt;<br />
				&lt;th&gt;Resultaat&lt;/th&gt;<br /> &lt;th&gt;Datum&lt;/th&gt;<br />
				&lt;/tr&gt;<br /> &lt;tr&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${doneDealsNotYetConfirmed}"&gt;${deal.senderGame}<br />
				&lt;p /&gt;<br /> &lt;/c:forEach&gt;&lt;/td&gt;<br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal"
				items="${doneDealsNotYetConfirmed}"&gt;${deal.receiverGame}<br />
				&lt;p /&gt;<br /> &lt;/c:forEach&gt;&lt;/td&gt;<br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal"
				items="${doneDealsNotYetConfirmed}"&gt;${deal.sender}&amp;nbsp;<br />
				&lt;img<br />
				src="${pageContext.servletContext.contextPath}/images/arrow.png"<br />
				align="top" alt="arrow" style="width: 12px; height: 12px"&gt;<br />
				&amp;nbsp;${deal.receiver}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${doneDealsNotYetConfirmed}"&gt;<br />
				&lt;i&gt;${deal.message}&lt;/i&gt;<br /> &lt;p /&gt;<br /> <br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${doneDealsNotYetConfirmed}"&gt;${deal.status}<br />
				&lt;p /&gt;<br /> &lt;/c:forEach&gt;&lt;/td&gt;<br />
				&lt;td&gt;&lt;c:forEach var="deal"
				items="${doneDealsNotYetConfirmed}"&gt;${deal.date}<br /> &lt;p
				/&gt;<br /> &lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;/tr&gt;<br />
				&lt;/table&gt;<br /> &lt;/c:when&gt;<br /> &lt;c:otherwise&gt;<br />
				&lt;/c:otherwise&gt;<br /> &lt;/c:choose&gt;<br /> &lt;p /&gt;<br />
				<br /> &lt;c:choose&gt;<br /> &lt;c:when test="${not empty doneDeals }"&gt;<br />
				<br /> Voltooide deals:<br /> <br /> &lt;table&gt;<br />
				&lt;tr&gt;<br /> &lt;th&gt;Aanbod&lt;/th&gt;<br /> &lt;th&gt;In
				ruil voor&lt;/th&gt;<br /> &lt;th&gt;Wie&lt;/th&gt;<br />
				&lt;th&gt;Opmerking&lt;/th&gt;<br /> &lt;th&gt;Resultaat&lt;/th&gt;<br />
				&lt;th&gt;Datum&lt;/th&gt;<br /> &lt;/tr&gt;<br /> &lt;tr&gt;<br />
				<br /> &lt;td&gt;&lt;c:forEach var="deal"
				items="${doneDeals}"&gt;${deal.senderGame}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${doneDeals}"&gt;${deal.receiverGame}<br /> &lt;p
				/&gt;<br /> &lt;/c:forEach&gt;&lt;/td&gt;<br /> <br />
				&lt;td&gt;&lt;c:forEach var="deal"
				items="${doneDeals}"&gt;${deal.sender}&amp;nbsp;<br /> <br />
				&lt;img<br />
				src="${pageContext.servletContext.contextPath}/images/arrow.png"<br />
				align="top" alt="arrow" style="width: 12px; height: 12px"&gt;<br />
				<br /> &amp;nbsp;${deal.receiver}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${doneDeals}"&gt;<br />
				&lt;i&gt;${deal.message}&lt;/i&gt;<br /> &lt;p /&gt;<br /> <br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> <br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${doneDeals}"&gt;<br /> &lt;c:choose&gt;<br />
				&lt;c:when test="${deal.status eq 'Aangenomen'}"&gt;${deal.status}&amp;nbsp;<br />
				&lt;img<br />
				src="${pageContext.servletContext.contextPath}/images/check2.jpg"<br />
				align="top" alt="check" style="width: 12px; height: 12px"&gt;<br />
				&lt;p /&gt;<br /> &lt;/c:when&gt;<br /> &lt;/c:choose&gt;<br />
				&lt;c:choose&gt;<br /> &lt;c:when test="${deal.status eq 'Geweigerd'}"&gt;${deal.status}&lt;/c:when&gt;<br />
				&lt;/c:choose&gt;<br /> &lt;p /&gt;<br /> <br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;td&gt;&lt;c:forEach
				var="deal" items="${doneDeals}"&gt;${deal.date}<br /> &lt;p /&gt;<br />
				&lt;/c:forEach&gt;&lt;/td&gt;<br /> &lt;/tr&gt;<br />
				&lt;/table&gt;<br /> &lt;/c:when&gt;<br /> &lt;c:otherwise&gt;<br />
				&lt;/c:otherwise&gt;<br /> &lt;/c:choose&gt;<br />
				&lt;/form:form&gt;

			</div>
		</div>
		<div id="tabs-5">
			<div>
				<img
					src="${pageContext.servletContext.contextPath}/images/database.png"
					align="middle" alt="database" style="width: 1200px; height: 1000px">

			</div>
		</div>
	</div>


</body>
</html>