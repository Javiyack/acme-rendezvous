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

<form:form action="manager/trip/create.do" modelAttribute="trip">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<div>
		<form:label path="ticker">>
			<spring:message code="trip.ticker" />
		</form:label>
		<form:input path="ticker" />
		<form:errors cssClass="error" path="ticker" />
	</div>
	<div>
		<form:label path="title">
			<spring:message code="trip.title" />
		</form:label>
		<form:input path="title" />
		<form:errors cssClass="error" path="title" />
	</div>
	<div>
		<form:label path="description">>
			<spring:message code="trip.description" />
		</form:label>
		<form:textarea path="description" />
		<form:errors cssClass="error" path="description" />
	</div>
	<div>
		<form:label path="startingDate">>
			<spring:message code="trip.startingDate" />
		</form:label>
		<form:input path="startingDate" />
		<form:errors cssClass="error" path="startingDate" />
	</div>
	<div>
		<form:label path="endingDate">>
			<spring:message code="trip.endingDate" />
		</form:label>
		<form:input path="endingDate" />
		<form:errors cssClass="error" path="endingDate" />
	</div>
	<div>
		<form:label path="price">>
			<spring:message code="trip.price" />
		</form:label>
		<form:input path="price" />
		<form:errors cssClass="error" path="price" />
	</div>
	<input type="submit" name="save"
		value="<spring:message code="price.submit"/>" />

</form:form>