<%--
 * edit.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="${requestURI}" modelAttribute="request" >

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="moment"/>
	<form:hidden path="rejectionReason"/>
	<form:hidden path="explorer" />
	<form:hidden path="canceled"/>
	
	<security:authorize access="hasRole('EXPLORER')">
	
	<form:label path="trip">
		<spring:message code="application.trip" />:
	</form:label>
	
	<form:select path="trip">
		<form:options items="${trips}" itemValue="id" itemLabel="title"/>
	</form:select>
			<form:errors cssClass="error" path="trip"/>
	
	<form:hidden path="status"/>
	<form:label path="comments">
		<spring:message code="application.comments" />:
	</form:label>
	<form:textarea path="comments" />
	<br />
	</security:authorize>
	
<br/>
	<security:authorize access="hasRole('MANAGER')">
	<form:hidden path="trip"/>
	<form:hidden path="comments"/>
	<form:select path="status">
	<form:option value="DUE">DUE</form:option>
	<form:option value="REJECTED">REJECTED</form:option>
	</form:select>
	</security:authorize>

	

	<input type="submit" name="save"
		value="<spring:message code="application.save" />"/>
	
	<input type="button" name="cancel"
		value="<spring:message code="application.cancel" />"
		onclick="javascript: relativeRedir('application/list.do');" />



</form:form>
