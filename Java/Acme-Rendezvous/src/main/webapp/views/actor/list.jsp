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


<display:table pagesize="5" class="displaytag" name="actors" requestURI="${requestUri}" id="row">
	
	<spring:message code="actor.name" var="actorName" />
	<display:column property="name" title="${actorName}" sortable="true" />

	<spring:message code="actor.surname" var="actorSurname" />
	<display:column property="surname" title="${actorSurname}" sortable="true" />
		
	<display:column>
		<div>
			<a href="actor/display.do?actorId=${row.id}"> <spring:message
 				code="actor.display" />
			</a>
		</div>
	</display:column>

</display:table>
	
	
<input type="button" name="back"
	value='<spring:message code="actor.back"/>'
	onclick="javascript: relativeRedir('/');" />
	<br />

	
	
