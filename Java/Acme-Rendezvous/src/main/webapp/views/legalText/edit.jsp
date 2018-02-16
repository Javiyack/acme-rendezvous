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
	<form:form action="administrator/legalText/edit.do"
		modelAttribute="legalText">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="body" />
		<form:hidden path="title" />
		<form:hidden path="laws" />
		<form:hidden path="moment" />
		
		<form:hidden path="Final" />
		
		
		<table>
			<tbody>
				<tr>
					<td><form:label path="title">
							<spring:message code="legalText.title" />:
								</form:label></td>
					<td><form:input path="title" /></td>
				</tr>
				
				<tr>
					<td><form:label path="body">
							<spring:message code="legalText.body" />
						</form:label></td>
					<td><form:input path="body" /></td>
				</tr>
				
				<tr>
					<td><form:label path="laws">
							<spring:message code="legalText.laws" />
						</form:label></td>
					<td><form:input path="laws" /></td>
				</tr>
		
				<tr>
					<form:label path="Final">
						<spring:message code="legalText.Final" />:
	</form:label>
				<tr>	<form:select path="Final">
						<form:option value="true">
							<spring:message code="legalText.Final.yes" />
						</form:option>
						<form:option value="false">
							<spring:message code="legalText.Final.no" />
						</form:option>
					</form:select>

				</tr>
			</tbody>
		</table>
		<input type="submit" name="save"
			value="<spring:message code="legalText.save" />" />&nbsp;
			<input type="submit" name="delete"
			value="<spring:message code="legalText.delete" />" />&nbsp;
						<input type="button" name="cancel"
			value="<spring:message code="legalText.cancel" />"
			onclick="javascript: relativeRedir('administrator/legalText/list.do');" />
		<br />
	</form:form>
</div>



