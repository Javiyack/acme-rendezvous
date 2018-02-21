
<%@page import="org.springframework.test.web.ModelAndViewAssert"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

 	 

<p>
	<spring:message code="actor.name" var="actorName" />
	<jstl:out value="${actorName} ${actor.name }" />
</p>
<p>
	<spring:message code="actor.surname" var="actorSurname" />
	<jstl:out value="${actorSurname} ${actor.surname}" />
</p>

<p>
	<spring:message code="actor.email" var="actorEmail" />
	<jstl:out value="${actorEmail} ${actor.email }" />
</p>

<p>
	<spring:message code="actor.phone" var="actorPhone" />
	<jstl:out value="${actorPhone} ${actor.phone }" />
</p>

<p>
	<spring:message code="actor.address" var="actorAddress" />
	<jstl:out value="${actorAddress} ${actor.address }" />
</p>


<h4>
	<spring:message code="actor.rendezvous" />
</h4>

<display:table name="rendezvouses" class="displaytag">
	<spring:message code="rendezvous.name" var="rendezvousName" />
	<display:column property="name" title="${rendezvousName}" />

	<spring:message code="rendezvous.description" var="rendezvousDescription" />
	<display:column property="description" title="${rendezvousDescription}" />

	<spring:message code="rendezvous.moment" var="rendezvousMoment" />
	<display:column property="moment" title="${rendezvousMoment}" format="${displaypriceformat}" />
	
	<spring:message code="rendezvous.picture" var="rendezvousPicture" />
	<display:column>
		<IMG src="${rendezvousPicture}" width="50" height="50"/>
	</display:column>
	
	<spring:message code="rendezvous.location" var="rendezvousLocation" />
	<display:column property="location" title="${rendezvousLocation}" />
	
	
</display:table>
<br/>
<br/>

<input type="button" name="back"
	value='<spring:message code="actor.back"/>'
	onclick="javascript: relativeRedir('/');" />
	<br />

	
