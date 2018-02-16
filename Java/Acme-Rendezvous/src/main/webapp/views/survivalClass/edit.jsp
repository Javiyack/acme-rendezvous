<%--
 * edit.jsp
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
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize access="hasRole('EXPLORER')">		
	<form:form action="explorer/survivalClass/edit.do" modelAttribute="survivalClass">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<form:label path="title">
		<spring:message code="survivalClass.title" />:
	</form:label>
	<form:input path="title" readonly="true"/>
	<form:errors cssClass="error" path="title" />
	<br />

	<form:label path="description">
		<spring:message code="survivalClass.description" />:
	</form:label>
	<form:textarea path="description"  readonly="true"/>
	<form:errors cssClass="error" path="description" />
	<br />

	<form:label path="trip">
		<spring:message code="survivalClass.trip" />:
	</form:label>
	<form:input path="trip.title" />
	<form:errors cssClass="error" path="trip" />
	<br />

	<form:label path="moment">
		<spring:message code="survivalClass.moment" />:
	</form:label>
	<spring:message code="moment.format" var="momentFormat" />
	<form:input path="moment" readonly="true" format="${momentFormat}" />
	<form:errors cssClass="error" path="moment" />
	<br />
	
	<br />

	<input type="submit" name="register"
		value="<spring:message code="survivalClass.register" />" />&nbsp; 		
		
	<input type="button" name="cancel"
		value="<spring:message code="survivalClass.cancel" />"
	onclick="javascript: relativeRedir('explorer/survivalClass/list.do');" />		
	<br />


</form:form>
</security:authorize>


	
	

<security:authorize access="hasRole('MANAGER')">		
	<form:form action="manager/survivalClass/edit.do" modelAttribute="survivalClass">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<form:label path="title">
		<spring:message code="survivalClass.title" />:
	</form:label>
	<form:input path="title"/>
	<form:errors cssClass="error" path="title" />
	<br />

	<form:label path="description">
		<spring:message code="survivalClass.description" />:
	</form:label>
	<form:textarea path="description"/>
	<form:errors cssClass="error" path="description" />
	<br />

	<form:label path="trip">
		<spring:message code="survivalClass.trip" />:
	</form:label>
	<form:input path="trip.title" />
	<form:errors cssClass="error" path="trip" />
	<br />

	<form:label path="moment">
		<spring:message code="survivalClass.moment" />:
	</form:label>
	<form:input path="moment" />
	<form:errors cssClass="error" path="moment" />
	<br />
	
	<br />

	<br />
	<input type="submit" name="save"
	value="<spring:message code="survivalClass.save" />" />&nbsp; 		
	
	<jstl:if test="${survivalClass.id != 0}">
	<input type="submit" name="delete"
		value="<spring:message code="survivalClass.delete" />"
		onclick="return confirm('<spring:message code="survivalClass.confirm.delete" />')" />&nbsp;
	</jstl:if>
	
	<input type="button" name="cancel"
	value="<spring:message code="survivalClass.cancel" />"
	onclick="javascript: relativeRedir('manager/survivalClass/list.do');" />
	
	<br />	

</form:form>
</security:authorize>



