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
	name="notes" requestURI="${requestURI}" id="row">
	
	<!-- Action links -->
		
	<security:authorize access="hasRole('AUDITOR')">
		<display:column>
			<a href="auditor/note/edit.do?noteId=${row.id}">
				<spring:message	code="note.view" />
			</a>
		</display:column>		
	</security:authorize>
	
	<security:authorize access="hasRole('MANAGER')">
		<display:column>
			<a href="manager/note/edit.do?noteId=${row.id}">
				<spring:message	code="note.toReply" />
			</a>
		</display:column>		
	</security:authorize>
	
	
	<!-- Attributes --> 
	
	<spring:message code="note.trip" var="titleHeader" />
	<display:column property="trip.title" title="${titleHeader}" sortable="true" />

	<spring:message code="note.moment" var="momentHeader" />
	<spring:message code="date.format" var="dateFormat" />	
	<display:column property="moment" title="${momentHeader}" sortable="true" format="${dateFormat}"/>

	<spring:message code="note.remark" var="remarkHeader" />
	<display:column property="remark" title="${remarkHeader}" sortable="false" />
	
	<spring:message code="note.replyMoment" var="replyMomentHeader" />
	<display:column property="replyMoment" title="${replyMomentHeader}" sortable="false" format="${dateFormat}"/>
	
	<spring:message code="note.reply" var="replyHeader" />
	<display:column property="reply" title="${replyHeader}" sortable="false" />
	

</display:table>

<!-- Action links -->

<security:authorize access="hasRole('AUDITOR')">
	<div>
		<a href="auditor/note/create.do"> <spring:message
				code="note.create" />
		</a>
	</div>
</security:authorize>