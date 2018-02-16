<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="actor/message/edit.do" modelAttribute="m">

	<form:hidden path="id" />
	<form:hidden path="version" />	
	<form:hidden path="folder"/>
	<form:hidden path="sender"/>
	<form:hidden path="date"/>
	<form:hidden path="notification"/>
	<form:hidden path="spam"/>
	
	
	
	<form:label path="subject">
	<spring:message code="message.subject" />:
	</form:label>
	<form:input path="subject" />
	<form:errors cssClass="error" path="subject" />
	<br />

	<form:label path="body">
		<spring:message code="message.body" />:
	</form:label>
	<form:input path="body" />
	<form:errors cssClass="error" path="body" />
	<br />

	<form:label path="priority">
		<spring:message code="message.priority" />:
	</form:label>
	<form:input path="priority" />
	<form:errors cssClass="error" path="priority" />
	<br />

	<form:label path="target">
		<spring:message code="message.target" />:
	</form:label>
	<form:select id="targets" path="target" >
		<form:option value="0" label="----" />		
		<form:options items="${targets}" itemValue="id"
			itemLabel="name" />
	</form:select>
	<form:errors cssClass="error" path="target" />

	<input type="submit" name="save"
		value="<spring:message code="message.send" />" /> 
	<jstl:if test="${message.id != 0}">
	<input type="submit" name="delete"
			value="<spring:message code="message.delete" />"
			onclick="return confirm('<spring:message code="message.confirm.delete" />')" />
	</jstl:if>
</form:form>