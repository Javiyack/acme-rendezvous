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

<div class="formDiv">
	<form:form action="${requestURI}" modelAttribute="legalText">

		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="moment" />
		<form:hidden path="body" />
		<form:hidden path="title" />
		<form:hidden path="laws" />


		<table>
			<tbody>
				<tr>
					<td><form:label path="title">
							<spring:message code="legalText.title" />:
							</form:label></td>
					<td><form:input path="title" /> <form:errors cssClass="error"
							path="title" /></td>
				</tr>



				<tr>
					<td><form:label path="body">
							<spring:message code="legalText.body" />:
							</form:label></td>
					<td><form:textarea path="body" /> <form:errors
							cssClass="error" path="body" /></td>
				</tr>
				<tr>
					<td><form:label path="laws">
							<spring:message code="legalText.laws" />:
							</form:label></td>
					<td><form:textarea path="laws" /> <form:errors
							cssClass="error" path="laws" /></td>
				</tr>

			</tbody>
		</table>
		<input type="submit" name="save"
			value="<spring:message code="legalText.saveCreate" />"
			onclick="javascript: relativeRedir('administrator/legalText/list.do');" />&nbsp;
			
			<input type="button" name="cancel"
			value="<spring:message code="legalText.cancel" />"
			onclick="javascript: relativeRedir('administrator/legalText/list.do');" />

	</form:form>
</div>

