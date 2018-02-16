<%--
 * list.jsp
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

<!-- Listing grid -->

<div class="dropdown">
	<button onclick="dropDown()" class="dropbtn">
		<spring:message code="browser.categories" />
	</button>
	<div id="myDropdown" class="dropdown-content">${tree}</div>
</div>
<div class="dropdown">

	<jstl:if test="${selected.name !='CATEGORY'}">
		<jstl:forEach var="level" items="${ruta}">
			<jstl:if test="${level.name !='CATEGORY'}">
				<button
					onclick="window.location.href='category/browse.do?categoryId=${level.id}'"
					class="dropbtn">${level.name}</button>
			</jstl:if>

		</jstl:forEach>
	</jstl:if>


</div>
<p>
	<security:authorize access="hasRole('ADMINISTRATOR')">
		<button
			onclick="window.location.href='category/create.do?parentId=${selected.id}'"
			class="dropbtn">
			<spring:message code="category.new" />
		</button>

		<jstl:if test="${selected.name !='CATEGORY'}">
			<button
				onclick="window.location.href='category/edit.do?Id=${selected.id}'"
				class="dropbtn">
				<spring:message code="msg.edit" />
			</button>
		</jstl:if>
	</security:authorize>
	
	<jstl:if test="${selected.name !='CATEGORY'}">
		<button
			onclick="window.location.href='category/browse.do?categoryId=${selected.parent.id}'"
			class="dropbtn">
			<spring:message code="msg.up" />
		</button>
	</jstl:if>

</p>



<h> <spring:message code="category.header.trip" /> <jstl:if
	test="${selected.name !='CATEGORY'}">${selected.name}: 
</jstl:if> </h>

<%@include file="/views/trip/list.jsp"%>


