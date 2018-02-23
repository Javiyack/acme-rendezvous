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

<form:form action="question/user/create.do" modelAttribute="question">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="rendezvous" />


	<form:label path="question">
		<spring:message code="question.question" />
	</form:label>
	<form:input path="question" />
	<form:errors cssClass="error" path="question" />
	<br />

	<input type="submit" name="save"
		value='<spring:message code="question.save"/>' />&nbsp;
	
	<input type="button" name="cancel"
		value='<spring:message code="question.cancel"/>'
		onclick="javascript: relativeRedir('/');" />
	<br />

</form:form>