<%--
 * create.jsp
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


<jstl:if test="${readOnly}">
	<div class="dropdown">
		<button class="dropbtn" id="categoriaName">
			<jstl:if test="${trip.category.name==null}">
				<spring:message code="categoriy.select" />:
		</jstl:if>
			${trip.category.name}
		</button>
	</div>
</jstl:if>



<jstl:if test="${!readOnly}">

	<div class="dropdown">
		<button onclick="dropDown()" class="dropbtn" id="categoriaName">
			<jstl:if test="${trip.category.name==null}">
				<spring:message code="categoriy.select" />:
		</jstl:if>
			${trip.category.name}
		</button>
		<div id="myDropdown" class="dropdown-content">${tree}</div>

	</div>
</jstl:if>

<button class="dropbtn" id="legalText">
	<spring:message code="master.page.legalTexts" />
</button>
<div id="myDropdown" class="dropdown-content">
	<p>Legal</p>
</div>


<button class="dropbtn" id="tag">Tag</button>
<div id="myDropdown" class="dropdown-content">
	<jstl:forEach var="tagValue" items="${tagValues}">
		<ul>
			<li><jstl:out value="${tagValue.tag.mane}"></jstl:out> <jstl:out
					value="${tagValue.value}"></jstl:out></li>
		</ul>
	</jstl:forEach>
</div>

<div class="dropdown"></div>

<div class="formDiv">

	<form:form action="${requestURI}" modelAttribute="trip">

		<form:hidden path="id" />
		<form:hidden path="version" />

		<form:hidden path="manager" />
		<form:hidden path="category" id="categoryId" />
		<form:hidden path="legalText" id="legatTextId" />

		<table>
			<tbody>

				<tr>
					<td><form:label path="title">
							<spring:message code="trip.title" />:
							</form:label></td>
					<td><form:input path="title" readonly="${readOnly}" /> <form:errors
							cssClass="error" path="title" /></td>


				</tr>
				<tr>
					<td><form:label path="ticker">
							<spring:message code="trip.ticker" />:
							</form:label></td>
					<td><form:input path="ticker" readonly="true" /> <form:errors
							cssClass="error" path="ticker" /></td>


				</tr>
				<tr>
					<td><form:label path="description">
							<spring:message code="trip.description" />:
							</form:label></td>
					<td><form:textarea path="description"
							disabled="${readOnly==true}" /> <form:errors cssClass="error"
							path="description" /></td>


				</tr>
				<tr>
					<td><form:label path="startingDate">
							<spring:message code="date.format" var="dateFormat" />
							<spring:message code="trip.startingDate" />:
							</form:label></td>
					<td><form:input path="startingDate" readonly="${readOnly}"
							format="${dateFormat}" /> <form:errors cssClass="error"
							path="startingDate" /></td>


				</tr>
				<tr>
					<td><form:label path="publicationDate">
							<spring:message code="trip.publicationDate" />:
							</form:label></td>
					<td><form:input path="publicationDate" readonly="${readOnly}"
							format="${dateFormat}" /> <form:errors cssClass="error"
							path="publicationDate" /></td>


				</tr>
				<tr>
					<td><form:label path="endingDate">
							<spring:message code="trip.endingDate" />:
							</form:label></td>
					<td><form:input path="endingDate" readonly="${readOnly}"
							format="${dateFormat}" /> <form:errors cssClass="error"
							path="endingDate" /></td>


				</tr>
				<tr>
					<td><form:label path="ranger.name">
							<spring:message code="master.page.ranger" />:
							</form:label></td>
					<td><form:select path="ranger" disabled="${readOnly == true}">
							<form:option value="${ranger}" label="${ranger.name}" />
							<form:options items="${rangers}" itemValue="id" itemLabel="name" />
						</form:select> <form:errors cssClass="error" path="ranger" /></td>


				</tr>
				<tr>
					<td><form:label path="manager.name">
							<spring:message code="master.page.manager" />:
							</form:label></td>
					<td><form:input path="manager.name" readonly="true" /> <form:errors
							cssClass="error" path="manager.name" /></td>


				</tr>
				<tr>
					<td><form:label path="category.name">
							<spring:message code="master.page.category" />:
							</form:label></td>
					<td><form:input path="category.name" readonly="true"
							id="categoria2" /> <form:errors cssClass="error"
							path="category.name" /></td>
				</tr>

			</tbody>
		</table>

		<p>Bloqueado = ${readOnly==true}</p>

		<security:authorize access="hasRole('MANAGER')">

			<input type="submit" name="save"
				value="<spring:message code="msg.save" />" />&nbsp;					
			
			<jstl:if test="${trip.id!=0}">
				<input type="button" name="delete"
					value="<spring:message code="msg.delete" />"
					onclick="javascript: relativeRedir('manager/trip/delete.do?tripId=${trip.id}');" />

			</jstl:if>

			<input type="button" name="cancel"
				value="<spring:message code="msg.cancel" />"
				onclick="javascript: relativeRedir('manager/trip/list.do');" />


		</security:authorize>
		<br />


	</form:form>
</div>

