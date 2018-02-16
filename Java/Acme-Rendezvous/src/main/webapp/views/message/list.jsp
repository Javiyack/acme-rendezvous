<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

	<div>
		<a href="actor/message/create.do?folderId=${param.folderId }">
			<spring:message code="message.send"/>
		</a>
	</div>

<display:table requestURI="${requestURI }" name="messages" id="row" pagesize="10" class="displayTag">

	<spring:message code="message.date" var="messageDate"/>
	<display:column property="date" title="${messageDate }"/>
	<spring:message code="message.subject" var="messageSubject"/>
	<display:column property="subject" title="${messageSubject }"/>
	<spring:message code="message.body" var="messageBody"/>
	<display:column property="body" title="${messageBody }"/>
	<spring:message code="message.priority" var="messagePriority"/>
	<display:column property="priority" title="${messagePriority }"/>
	<spring:message code="message.sender" var="messageSender"/>
	<display:column property="sender.name" title="${messageSender }">
	</display:column>
	<spring:message code="message.target" var="messageTarget"/>
	<display:column property="target.name" title="${messageTarget }">
	</display:column>
	<display:column>
	<div>
		<a href="actor/message/edit.do?messageId=${row.id }">
			<spring:message code="message.delete"/>
		</a>
	</div>
	</display:column>


</display:table>