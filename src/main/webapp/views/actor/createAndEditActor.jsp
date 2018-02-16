
<%@page import="org.springframework.test.web.ModelAndViewAssert"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

 	 
 	
 	
<form:form action="${requestURI}" modelAttribute="${requestScope.rol}">	

<jstl:if test="${explorer.id eq '0'}"><spring:message code="actor.asExplorer"></spring:message></jstl:if>
<jstl:if test="${ranger.id eq '0'}"><spring:message code="actor.asRanger"></spring:message></jstl:if>

	<form:hidden path="id"/>
	<form:hidden path="version"/>
	
	
<jstl:if test="${requestScope.rol eq 'explorer'}"><form:hidden path="creditCard"/><form:hidden path="finder"/></jstl:if>
	

	
	
	
	
	
	<jstl:if test="${requestScope.rol eq 'ranger'} ">
	<form:hidden path="curriculum"/>
	
	</jstl:if>
	
	
	
	<jstl:if test="${requestScope.rol eq 'manager'} ">
		<!-- Sin parametros propios -->
	</jstl:if>
	
	
	
	<jstl:if test="${requestScope.rol eq 'administrator '} ">
	<!-- Sin parametros propios -->
	</jstl:if>
	
	
	
	
	<div>
		<form:label path="name">
			<spring:message code="actor.name"/>
		</form:label>
		<form:input path="name"/>
		<form:errors cssClass="error" path="name"/>
	</div>
	<div>
		<form:label path="surname">
			<spring:message code="actor.surname"/>
		</form:label>
		<form:input path="surname"/>
		<form:errors cssClass="error" path="surname"/>
	</div>
	<div>
		<form:label path="email">
			<spring:message code="actor.email"/>
		</form:label>
		<form:input path="email"/>
		<form:errors cssClass="error" path="email"/>
	</div>
	<div>
		<form:label path="phone">
			<spring:message code="actor.phone"/>
		</form:label>
		<form:input path="phone"/>
		<form:errors cssClass="error" path="phone"/>
	</div>
	<div>
		<form:label path="address">
			<spring:message code="actor.address"/>
		</form:label>
		<form:input path="address"/>
		<form:errors cssClass="error" path="address"/>
	</div>
	<jstl:choose>
	<jstl:when test="${explorer.id eq '0' or ranger.id eq '0'}">
	<form:hidden path="userAccount.authorities"/>
	<form:label path="userAccount.username">
	<spring:message code="actor.username"/>
	</form:label>
	<form:input path="userAccount.username"/>
	<form:errors cssClass="error" path="userAccount.username"/>
	<br>
	<form:label path="userAccount.username">
	<spring:message code="actor.password"/>
	</form:label>
	<form:password path="userAccount.password"/>
	<form:errors cssClass="error" path="userAccount.password"/>
	</jstl:when>
	<jstl:otherwise>
	<form:hidden path="userAccount"/>
	</jstl:otherwise>
	</jstl:choose>
	
<br>
<input type="submit" name="save" value="<spring:message code="actor.submit"/>"/>

	
	</form:form>
	
