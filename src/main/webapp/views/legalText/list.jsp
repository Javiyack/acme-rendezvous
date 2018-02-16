<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="legalTexts" requestURI="${requestURI}" id="row">
	
	<!-- Action links -->
		
	<security:authorize access="hasRole('ADMINISTRATOR')">
		<display:column>
			<a href="administrator/legalText/edit.do?legalTextId=${row.id}">
				<spring:message	code="legalText.edit" />
			</a>
		</display:column>		
	</security:authorize>
<%-- 			<display:column> --%>
<%-- 			<a href="legalText/display.do?legalTextId=${row.id}"> --%>
<%-- 				<spring:message	code="legalText.display" /> --%>
<!-- 			</a> -->
<%-- 		</display:column>	 --%>
	
	<!-- Attributes --> 
	
	<spring:message code="legalText.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />


	<spring:message code="legalText.body" var="remarkHeader" />
	<display:column property="body" title="${remarkHeader}" sortable="false" />


	<spring:message code="legalText.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}"  />

	
	<spring:message code="legalText.laws" var="lawsHeader" />
	<display:column property="laws" title="${lawsHeader}" />
	
	

</display:table>

<!-- Action links -->

<security:authorize access="hasRole('ADMINISTRATOR')">
	<div>
		<a href="administrator/legalText/create.do"> <spring:message
				code="legalText.create" />
		</a>
	</div>
</security:authorize>