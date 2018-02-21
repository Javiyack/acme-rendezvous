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


	<acme:textbox code="rendezvous.name" path="name" />

	<acme:textarea code="rendezvous.description" path="description" />

	<acme:textbox code="rendezvous.moment" path="moment"
		placeholder="dd/MM/yyyy HH:mm" />

	<acme:textbox code="rendezvous.picture" path="picture" />

	<form:label path="draft">
		<spring:message code="rendezvous.draft" />
	</form:label>
	<form:checkbox path="draft"/>
	<br/>

	<acme:cancel url="/" code="rendezvous.cancel"/>
	<acme:submit name="save" code="rendezvous.save"/>

<jstl:if test="${rendezvous.id!=0 }">
<input type="submit" name="delete"
			value="<spring:message code="rendezvous.delete" />"
			onclick="return confirm('<spring:message code="rendezvous.confirm.delete" />')" />

</jstl:if>






	<%-- <form:label path="priority">
		<spring:message code="ms.priority" />:
	</form:label>
	<form:select path="priority">
		<form:option value="0" label="----" />
		<form:option value="HIGH" label="HIGH" />
		<form:option value="NEUTRAL" label="NEUTRAL" />
		<form:option value="LOW" label="LOW" />
	</form:select>
	<form:errors cssClass="error" path="priority" />
	<br />
	<br />

	<form:label path="recipient">
		<spring:message code="ms.recipient" />:
	</form:label>
	<form:select id="actors" path="recipient">
		<form:option value="0" label="----" />
		<form:options items="${actors}" itemValue="id" itemLabel="userAccount.username" />
	</form:select>
	<form:errors cssClass="error" path="recipient" />
	<br />
	<br />

	<form:label path="subject">
		<spring:message code="ms.subject" />:
	</form:label>
	<form:input path="subject" />
	<form:errors cssClass="error" path="subject" />
	<br />
	<br /> 

	<form:label path="body">
		<spring:message code="ms.body" />:
	</form:label>

	<form:textarea path="body" />
	<br />

	

	<input type="submit" name="save"
		value="<spring:message code="ms.send"/>" />&nbsp;
	<input type="button" name="cancel"
		value="<spring:message code="message.cancel"/>"
		onclick="javascript:relativeRedir('')" /> --%>



</form:form>