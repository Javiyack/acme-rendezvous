<%--
 * action-1.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="survivalClasses" requestURI="${requestURI}" id="row">
	
	<!-- Action links -->

	<security:authorize access="hasRole('EXPLORER')">
		<display:column>
			<a href="explorer/survivalClass/edit.do?survivalClassId=${row.id}">
				<spring:message	code="survivalClass.register" />
			</a>
		</display:column>		
	</security:authorize>
	
	<security:authorize access="hasRole('MANAGER')">
		<display:column>
			<a href="manager/survivalClass/edit.do?survivalClassId=${row.id}">
				<spring:message	code="survivalClass.edit" />
			</a>
		</display:column>		
	</security:authorize>
	
	
	<!-- Attributes -->
	
	<spring:message code="survivalClass.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />

	<spring:message code="survivalClass.description" var="momentHeader" />
	<display:column property="description" title="${momentHeader}"/>

	<spring:message code="survivalClass.trip" var="remarkHeader" />
	<display:column property="trip.title" title="${remarkHeader}" sortable="false" />
	
	<spring:message code="survivalClass.moment" var="replyMomentHeader" />
	<spring:message code="date.format" var="dateFormat" />
	<display:column property="moment" title="${replyMomentHeader}" sortable="true" format="${dateFormat}"/>
	

</display:table>

<!-- Action links -->

<security:authorize access="hasRole('AUDITOR')">
	<div>
		<a href="survivalClass/manager/edit.do"> <spring:message
				code="survivalClass.create" />
		</a>
	</div>
</security:authorize>