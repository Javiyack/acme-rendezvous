<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="rendezvous/user/edit.do" modelAttribute="rendezvous">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="user" />
	<form:hidden path="deleted" />

	<form:label path="draft">
		<spring:message code="rendezvous.draft" />
	</form:label>
	<form:checkbox path="draft" />
	<form:label path="adult">
		<spring:message code="rendezvous.adult" />
	</form:label>
	<form:checkbox path="adult" />
	<table>
		<tbody>
			<acme:textboxOnTable code="rendezvous.name" path="name" />
			<acme:textareaOnTable code="rendezvous.description"
				path="description" />
			<spring:message code="moment.pattern" var="momentPattern" />
			<spring:message code="moment.format" var="momentFormat" />
			<acme:textboxOnTable code="rendezvous.moment" path="moment"
				placeholder="${momentPattern}" format="${momentFormat}" />
			<acme:textboxOnTable code="rendezvous.location.longitude" path="location.longitude" pattern="^([0-9]*\.?[0-9])|([0-9]*\.?)$"/>
			<acme:textboxOnTable code="rendezvous.location.latitude" path="location.latitude"  />
			<acme:textboxOnTable code="rendezvous.picture" path="picture" />
		</tbody>
	</table>
	<br />
	<acme:cancel url="/" code="rendezvous.cancel" />
			<acme:submit name="save" code="rendezvous.save" />

			<jstl:if test="${rendezvous.id!=0 }">
				<input type="submit" name="delete"
					value="<spring:message code="rendezvous.delete" />"
					onclick="return confirm('<spring:message code="rendezvous.confirm.delete" />')" />

			</jstl:if>
</form:form>