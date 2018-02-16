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
CREATE
	<form:form action="${requestURI}" modelAttribute="category">

		<form:hidden path="id" />
		<form:hidden path="version" />

		<table>
			<tbody>
				<tr>
					<td><form:label path="parent.name">
							<spring:message code="category.parent" />:
							</form:label></td>
					<td>
					<spring:message code="category.root" var="root" />		
					<form:select path="parent">	
							
							<form:option value="${nodeId}" label=" " />	
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
						<form:input path="name" readonly="false" placeholder="Nombre..."/> <form:errors cssClass="error"
							path="name" /></td>		
					
				</tr>
				
			</tbody>
		</table>
		<security:authorize access="hasRole('ADMINISTRATOR')">
		<input type="submit" name="save"
			value="<spring:message code="msg.save" />" />&nbsp;
					
		<jstl:if test="${category.id !=0}">
			
		<spring:message code="msg.delete.confirmation" var="confirmationMSG"/>
		
		<input type="button" 
				value="<spring:message code="msg.delete" />"
				onclick="confirmationWindow('${confirmationMSG}', '${category.id}')" />					
				
			<input type="button" name="cancel"
				value="<spring:message code="msg.cancel" />"
				onclick="javascript: relativeRedir('category/browse.do?categoryId=${category.id}');" />			
			
		</jstl:if> 
		<jstl:if
			test="${category.id ==0}">
			<input type="button" name="cancel"
				value="<spring:message code="msg.cancel" />"
				onclick="javascript: relativeRedir('category/browse.do?categoryId=${parentId.id}');" />			
			
		</jstl:if> 
			
		</security:authorize>
		
<br />

	</form:form>
</div>
<script>
function confirmationWindow(msg, catId) {
	if (confirm(msg)) {
		relativeRedir('category/delete.do?categoryId=' + catId );
	}else {
		alert("You decided to not submit the form!");
	}
}

</script>
