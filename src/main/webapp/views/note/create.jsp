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
	<form:form action="${requestURI}" modelAttribute="note">

		<form:hidden path="id" />
		<form:hidden path="version" />

		<table>
			<tbody>
				<tr>
					<td><form:label path="trip">
							<spring:message code="note.trip" />:
							</form:label></td>
					<td>
							
					<form:select path="trip">
							<form:option value="0" label="----" />		
							<form:options items="${trips}" itemValue="id"
								itemLabel="title" />
						</form:select>
						<form:errors cssClass="error" path="trip" />
							
					</td>
				</tr>
				<tr>
					<td><form:label path="moment">
							<spring:message code="note.moment" />:
							</form:label></td>
					<td><spring:message code="moment.format" var="momentFormat" />
						<form:input path="replyMoment" readonly="true"
							format="${momentFormat}" /> <form:errors cssClass="error"
							path="moment" /></td>		
							
					
				</tr>
				<tr>
					<td><form:label path="remark">
							<spring:message code="note.remark" />:
							</form:label></td>
					<td><form:textarea path="remark" /> <form:errors
							cssClass="error" path="remark" />
							</td>
				</tr>
				<tr>
					<td><form:label path="replyMoment">
							<spring:message code="note.replyMoment" />:
							</form:label></td>
					<td><spring:message code="moment.format" var="momentFormat" />

						<form:input path="replyMoment" readonly="true"
							format="${momentFormat}" /> <form:errors cssClass="error"
							path="moment" /></td>
				</tr>
				<tr>
					<td><form:label path="reply">
							<spring:message code="note.reply" />:
							</form:label></td>
					<td><form:textarea path="reply" /> <form:errors
							cssClass="error" path="reply" /></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" name="save"
			value="<spring:message code="note.save" />" />&nbsp;
					
		<security:authorize access="hasRole('AUDITOR')">
			<input type="button" name="cancel"
				value="<spring:message code="note.cancel" />"
				onclick="javascript: relativeRedir('auditor/note/list.do');" />
			<br />
		</security:authorize>
		<security:authorize access="hasRole('MANAGER')">
			<input type="button" name="cancel"
				value="<spring:message code="note.cancel" />"
				onclick="javascript: relativeRedir('manager/note/list.do');" />
			<br />
		</security:authorize>


	</form:form>
</div>

