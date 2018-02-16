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

<form:form action="anonymous/finder/search.do" modelAttribute="finder">

	<form:hidden path="id" />
	<form:hidden path="version" />
<!-- keyword -->
	<form:label path="keyWord">
		<spring:message code="finder.keyword" />:
	</form:label>

	<form:input path="keyWord" />
	<br/>
<!--  date from -->
<security:authorize access="hasRole('EXPLORER')">
	<form:label path="inicialMoment">
		<spring:message code="finder.inicialMoment" />:
	</form:label>

	<form:input path="inicialMoment" />
	<form:errors cssClass="error" path="inicialMoment"/>
<!-- to -->
	<form:label path="finalMoment">
		<spring:message code="finder.finalMoment" />:
	</form:label>

	<form:input path="finalMoment" />
		<form:errors cssClass="error" path="finalMoment"/>
	
<!-- price from -->
<form:label path="minPrice">
		<spring:message code="finder.minPrice" />:
	</form:label>

	<form:input path="minPrice" />
	<form:errors cssClass="error" path="minPrice"/>
<!-- to-->
<form:label path="maxPrice">
		<spring:message code="finder.maxPrice" />:
	</form:label>

	<form:input path="maxPrice" />
		<form:errors cssClass="error" path="maxPrice"/>
	</security:authorize>
	
	<input type="submit" name="search"
		value="<spring:message code="finder.create" />" />


</form:form>
