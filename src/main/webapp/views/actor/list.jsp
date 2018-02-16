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
<h1>Rangers</h1>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="rangers" requestURI="${requestURI}" id="row">
	
	<spring:message code="actor.name" var="titleName" />
	<display:column property="name" title="${titleName}"   style="${color}"/>	
	
	<spring:message code="actor.surname" var="titleSurname" />
	<display:column property="surname" title="${titleSurname}"   style="${color}"/>	
	
	<spring:message code="actor.phone" var="titleName" />
	<display:column property="phone" title="${titleSurname}"   style="${color}"/>	
	
	<display:column>
	<a href="administrator/userAccount/createRanger.do?idRanger=<jstl:out value="${row.id}"/>"><spring:message code="actor.userAccount.assign"/></a>
	</display:column>
	 
	</display:table >
	<br>
	<h1>Managers</h1>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="managers" requestURI="${requestURI}" id="row">
	
	<spring:message code="actor.name" var="titleName" />
	<display:column property="name" title="${titleName}"   style="${color}"/>	
	
	<spring:message code="actor.surname" var="titleSurname" />
	<display:column property="surname" title="${titleSurname}"   style="${color}"/>	
	
	<spring:message code="actor.phone" var="titleName" />
	<display:column property="phone" title="${titleSurname}"   style="${color}"/>	
	
	<display:column>
	<a href="/administrator/userAccount/createRanger.do?idManager=<jstl:out value="${row.id}"/>"><spring:message code="actor.userAccount.assign"/></a>
	</display:column>
	
	 
	</display:table >
	
	


	
	
