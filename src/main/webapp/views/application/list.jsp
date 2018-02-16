<%--
 * list.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>
<%@page import="org.apache.commons.lang.time.DateUtils"%>
<%@page import="org.hibernate.engine.spi.RowSelection"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="requests" requestURI="${requestURI}" id="row">
	
	<jsp:useBean id="now" class="java.util.Date"/>
	
	<jstl:set value="<%=DateUtils.addMonths(new Date(), 1)%>" var="monthLater"></jstl:set>
	
	<jstl:choose>
		<jstl:when test="${row.status eq 'REJECTED'}">
			<jstl:set var="color" value="background-color:grey;"/>
		</jstl:when>
		<jstl:when test="${ row.status eq 'DUE'}">
			<jstl:set var="color" value="background-color:yellow;"/>
		</jstl:when>
		<jstl:when test="${ row.status eq 'ACCEPTED'}">
			<jstl:set var="color" value="background-color:green;"/>
		</jstl:when>
		
		<jstl:when test="${ row.status eq 'PENDING'and row.trip.startingDate gt now and row.trip.startingDate lt monthLater}">
			<jstl:set var="color" value="background-color:red;"/>
		</jstl:when>
		<jstl:when test="${ row.status eq 'PENDING'}">
			<jstl:set var="color" value="background-color:white;"/>
		</jstl:when>
		<jstl:when test="${ row.status eq 'CANCELLED'}">
			<jstl:set var="color" value="background-color:cyan;"/>
		</jstl:when>
	</jstl:choose>
	
	<security:authorize access="hasRole('MANAGER')">
	<spring:message code="application.explorer" var="titleExplorer" />
	
	<display:column  title="${titleExplorer}"   style="${color}">
	<jstl:out value="${row.explorer.name}${' '}${ row.explorer.surname}"></jstl:out>
	</display:column>
	</security:authorize>

	<spring:message code="application.trip" var="titleHeader" />
	<display:column property="trip.title" title="${titleHeader}"   style="${color}"/>	<!--Trip title-->
	 
	<spring:message code="application.date" var="titleDate" />
	<display:column property="moment" title="${titleDate}"  style="${color}"/>	<!--Date-->
	
	
	
<spring:message code="application.status" var="titleStatus"  />
	<display:column title="${titleStatus}"  style="${color}" sortable="true">
	<jstl:out value="${row.status}"/>
	
	</display:column>	
	
	<spring:message code="application.rejectionReason" var="titleRejection" />
	<display:column property="rejectionReason" title="${titleRejection}" style="${color}"/>	<!--Rejection reason-->
	
	<spring:message code="application.comments" var="titleComments" />
	<display:column property="comments" title="${titleComments}" style="${color}"/>	<!--Comments-->	
			


		<spring:message code="application.options" var="titleOptions" />		
	<display:column style="${color}" title="${titleOptions} ">
	
	<security:authorize access="hasRole('EXPLORER')">
	<jstl:choose>
	<jstl:when test="${row.status eq 'ACCEPTED' and  row.trip.startingDate gt now}"> 
	<a href="explorer/application/delete.do?id=${row.id}"><spring:message code="application.delete" /></a>
	</jstl:when>
	<jstl:otherwise > 
	<spring:message code="application.noOptions" />
	</jstl:otherwise>
	</jstl:choose>
	</security:authorize>
	
	
	<security:authorize access="hasRole('MANAGER')">
	<jstl:choose>
	<jstl:when test="${row.status eq 'PENDING'}"> 
	<a href="manager/application/edit.do?idRequest=${row.id}"><spring:message code="application.edit" /></a>
	</jstl:when>
	<jstl:otherwise > 
	<spring:message code="application.noOptions" />
	</jstl:otherwise>
	</jstl:choose>
	</security:authorize>
</display:column>	

	 
	</display:table >


	<div>
	
		<a href="explorer/application/create.do"> <spring:message
				code="application.create" />
		</a>
		
	</div>
	
	
