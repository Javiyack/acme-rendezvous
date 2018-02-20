
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>



<h3><spring:message code="dashboard.rendezvouses.by.user" /></h3>

	<ul>
	<li><spring:message code="dashboard.average" />: ${dashboard.rendezvouses.by.user[0]}</li>
	<li><spring:message code="dashboard.deviation" />: ${dashboard.rendezvouses.by.user[1]}</li>
	</ul>

<h3><spring:message code="dashboard.rendezvouses.ratio.creation" /></h3>

	<ul>
	<li><spring:message code="dashboard.ratio" />: ${dashboard.rendezvouses.ratio.creation[0]}</li>
	</ul>
	
<h3><spring:message code="dashboard.users.per.rendezvous" /></h3>

	<ul>
	<li><spring:message code="dashboard.average" />: ${dashboard.users.per.rendezvous[0]}</li>
	<li><spring:message code="dashboard.deviation" />: ${dashboard.users.per.rendezvous[1]}</li>
	</ul>


<h3><spring:message code="dashboard.rendezvouses.rsvp" /></h3>

	<ul>
	<li><spring:message code="dashboard.average" />: ${dashboard.rendezvouses.rsvp[0]}</li>
	<li><spring:message code="dashboard.deviation" />: ${dashboard.rendezvouses.rsvp[1]}</li>
	</ul>
	

<h3><spring:message code="dashboard.rendezvouses.top10" /></h3>

<display:table class="displaytag" name="dashboard.rendezvouses.top10" id="row">
	
	<spring:message code="rendezvous.name" var="titleName" />
	<display:column property="name" title="${titleName}" />	
	 
</display:table >


<h3><spring:message code="dashboard.announcements.ratio" /></h3>

	<ul>
	<li><spring:message code="dashboard.average" />: ${dashboard.announcements.ratio[0]}</li>
	<li><spring:message code="dashboard.deviation" />: ${dashboard.announcements.ratio[1]}</li>
	</ul>



<h3><spring:message code="dashboard.announcements.above.75" /></h3>

<display:table class="displaytag" name="dashboard.announcements.above.75" id="row">
	
	<spring:message code="rendezvous.name" var="titleName" />
	<display:column property="name" title="${titleName}" />	
	 
</display:table >

<h3><spring:message code="dashboard.rendezvouses.linked" /></h3>

<display:table class="displaytag" name="dashboard.rendezvouses.linked" id="row">
	
	<spring:message code="rendezvous.name" var="titleName" />
	<display:column property="name" title="${titleName}" />	
	 
</display:table >


<h3><spring:message code="dashboard.questions.rendezvous" /></h3>

	<ul>
	<li><spring:message code="dashboard.average" />: ${dashboard.questions.rendezvous[0]}</li>
	<li><spring:message code="dashboard.deviation" />: ${dashboard.questions.rendezvous[1]}</li>
	</ul>

<h3><spring:message code="dashboard.answers.rendezvous" /></h3>

	<ul>
	<li><spring:message code="dashboard.average" />: ${dashboard.answers.rendezvous[0]}</li>
	<li><spring:message code="dashboard.deviation" />: ${dashboard.answers.rendezvous[1]}</li>
	</ul>

<h3><spring:message code="dashboard.replies.comment" /></h3>

	<ul>
	<li><spring:message code="dashboard.average" />: ${dashboard.replies.comment[0]}</li>
	<li><spring:message code="dashboard.deviation" />: ${dashboard.replies.comment[1]}</li>
	</ul>
		