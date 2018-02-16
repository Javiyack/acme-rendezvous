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
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="auditRecord/edit.do" modelAttribute="auditRecord">

	<form:hidden path="id" />
	<form:hidden path="version" />
<!-- title -->
	<form:label path="title">
		<spring:message code="audit.title" />:
	</form:label>
	<form:input path="title" />
	<form:errors cssClass="error" path="title" />
	<br />
<!-- description-->

	<form:label path="description">
		<spring:message code="audit.description" />:
	</form:label>
	<form:textarea path="description" />
	<form:errors cssClass="error" path="description" />
	<br />
<!-- final-->
	<form:label path="final">
		<spring:message code="audit.final" />:
	</form:label>
	<form:select path="final">
	<form:option value="true" ><spring:message code="audit.final.yes"/>	</form:option>
	<form:option value="false"><spring:message code="audit.final.no"/></form:option>
	
	</form:select>
	<br />
	<!-- Attachments -->
	<form:label path="attachments">
		<spring:message code="audit.attachments" />:
	</form:label>
	<form:textarea path="attachments" />
	<form:errors cssClass="error" path="attachments" />
	<br />
	

	<input type="submit" name="save"
		value="<spring:message code="audit.save" />" />&nbsp; 

</form:form>
