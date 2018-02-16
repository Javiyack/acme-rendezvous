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
EDIT	<form:form action="${requestURI}" modelAttribute="category">

		<form:hidden path="id" />
		<form:hidden path="version" />

		<table>
			<tbody>
				<tr>
					<td><form:label path="parent.name">
							<spring:message code="category.parent" />:
							</form:label></td>
					<td>
							
					<form:select path="parent">
							<form:option value="${parentId}" label="${parent.name}" />		
							<form:options items="${categories}" itemValue="id"
								itemLabel="name" />
						</form:select>
						<form:errors cssClass="error" path="parent" />
							
					</td>
				</tr>
				<tr>
					<td><form:label path="name">
							<spring:message code="category.name" />:
							</form:label></td>
					<td>
						<form:input path="name" readonly="false" /> <form:errors cssClass="error"
							path="name" /></td>		
							
					
				</tr>
				
			</tbody>
		</table>

		<security:authorize access="hasRole('ADMINISTRATOR')">
		
			<input type="submit" name="save"
				value="<spring:message code="msg.save" />" />&nbsp;					
		
			<input type="button" name="delete"
				value="<spring:message code="msg.delete" />"
				onclick="javascript: relativeRedir('category/delete.do');" />
			
			<input type="button" name="cancel"
				value="<spring:message code="msg.cancel" />"
				onclick="javascript: relativeRedir('category/browse.do?categoryId=${parentId.id}');" />			
			
			
		</security:authorize>
		<br />


	</form:form>
</div>

