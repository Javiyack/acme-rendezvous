<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<display:table name="trips" id="row" pagesize="5" class="displayTag">
	
	<spring:message code="trip.trips"/>
	<spring:message code="trip.title" var="tripTitle"/>
	<display:column property="title" title="${tripTitle }"/>
	<spring:message code="trip.description" var="tripDescription"/>
	<display:column property="description" title="${tripDescription }"/>
	<spring:message code="trip.price" var="tripPrice"/>
	<display:column property="price" title="${tripPrice }"/>
	<spring:message code="date.format" var="dateFormat" />
	<spring:message code="trip.startingDate" var="tripStartingDate"/>
	<display:column property="startingDate" title="${tripStartingDate }"  format="${dateFormat}"/>
	<spring:message code="trip.endingDate" var="tripEndingDate"/>
	<display:column property="endingDate" title="${tripEndingDate }" format="${dateFormat}"/>
	<display:column>
	<security:authorize access="isAnonymous() or hasRole('EXPLORER') or hasRole('RANGER') or hasRole('ADMINISTRATOR') or hasRole('AUDITOR')">
		<div>
		<a href="trip/edit.do?tripId=${row.id }">
			<spring:message code="trip.view"/>
		</a>
	</div>
	</security:authorize>
	<security:authorize access="hasRole('MANAGER')">
		<div>
			<a href="manager/trip/edit.do?tripId=${row.id }">
				<spring:message code="trip.edit"/>
			</a>
		</div>
	</security:authorize>
	
	</display:column>

</display:table>
<security:authorize access="hasRole('MANAGER')">
	<button
		onclick="window.location.href='manager/trip/create.do'"
		class="dropbtn" tooltip="Crear nuevo viaje">
		<spring:message code="msg.new" />
	</button>

</security:authorize>


