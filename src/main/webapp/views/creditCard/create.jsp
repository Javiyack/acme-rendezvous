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
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="${requestURI}" modelAttribute="creditCard" >
	<table>
	<tr>
		<th colspan="2"></th>
	</tr>
	<thead>
	
	</thead>
		<tbody>

			<tr>
				<td>	<form:label path="holderName">
		<spring:message code="creditcard.holdername" />:
	</form:label>			</td>
				
				<td>		<form:input  type="text" path="holderName"/>
<form:errors cssClass="error" path="holderName"/>
			</td>
			</tr>
			<tr>
				<td>		<form:label path="brandName">
		<spring:message code="creditcard.brandname" />:
	</form:label>		</td>
				
				<td>		
	
	<form:input  type="text" path="brandName"/>
	<form:errors cssClass="error" path="brandName"/>
			</td>
			</tr>
			<tr>
				<td>		<form:label path="number">
		<spring:message code="creditcard.number" />:
	</form:label>	</td>
				
				<td>		
	
	<form:input  type="text" path="number"/>
	<form:errors cssClass="error" path="number"/>		</td>
			</tr>
			<tr>
				<td>			
	<form:label path="expirationMonth">
		<spring:message code="creditcard.month" />:
	</form:label>	</td>
				
				<td>		
	<form:input  type="text" path="expirationMonth"/>
	<form:errors cssClass="error" path="expirationMonth"/>		</td>
			</tr>
			<tr>
				<td>		<form:label path="expirationYear">
		<spring:message code="creditcard.year"/>:
	</form:label>
		</td>
				
				<td>		<form:input  type="text" path="expirationYear"/>
	<form:errors cssClass="error" path="expirationYear"/>			</td>
			</tr>
			<tr>
				<td>		<form:label path="CVV">
		CVV:
	</form:label>		</td>
				
				<td>		
	<form:input  type="text" path="CVV"/>
	<form:errors cssClass="error" path="CVV"/>
			</td>
			</tr>
		</tbody>
	</table>



		

	
	
	
	
	
	<input type="submit" name="save"
		value="<spring:message code="application.save" />"/>
	
	<input type="button" name="cancel"
		value="<spring:message code="application.cancel" />"
		onclick="javascript: relativeRedir('application/list.do');" />



</form:form>
