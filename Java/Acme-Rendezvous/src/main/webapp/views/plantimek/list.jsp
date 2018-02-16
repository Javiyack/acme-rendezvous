<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<h>
Plantimeks:
</h>
<display:table name="plantimeks" id="row" pagesize="5" class="displayTag">
	
	<spring:message code="trip.trips"/>
	<spring:message code="trip.title" var="tripTitle"/>
	<display:column property="pKey" title="${tripTitle }"/>
	<spring:message code="trip.title" var="tripTitle"/>
	<display:column property="title" title="${tripTitle }"/>
	<spring:message code="trip.description" var="tripDescription"/>
	<display:column property="description" title="${tripDescription }"/>
	<spring:message code="trip.price" var="tripPrice"/>
	<display:column property="gauge" title="${tripPrice }"/>
	<spring:message code="date.format" var="dateFormat" />
	<spring:message code="trip.startingDate" var="tripStartingDate"/>
	<display:column property="moment" title="${tripStartingDate }"  format="${dateFormat}"/>
	
	<security:authorize access="hasRole('MANAGER')">
	<display:column>
		<div>
			<a href="manager/trip/edit.do?tripId=${row.id }">
				<spring:message code="trip.edit"/>
			</a>
		</div>
		</display:column>
	</security:authorize>
	
	

</display:table>
<security:authorize access="hasRole('MANAGER')">
	<button
		onclick="window.location.href='manager/trip/create.do'"
		class="dropbtn" tooltip="Crear nuevo viaje">
		<spring:message code="msg.new" />
	</button>

</security:authorize>


