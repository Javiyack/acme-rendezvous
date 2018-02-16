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

<form:form action="sponsorship/edit.do" modelAttribute="auditRecord">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<!-- BannerUrl -->
	<div>

		<form:label path="bannerUrl">
			<spring:message code="sponsorship.bannerUrl" />:
	</form:label>
		<form:input path="bannerUrl" />
		<form:errors cssClass="error" path="bannerUrl" />
		<br />
	</div>

	<!-- InfoLink-->
	<div>

		<form:label path="infoLink">
			<spring:message code="sponsorShip.infoLink" />:
			</form:label>
		<form:textarea path="infoLink" />
		<form:errors cssClass="error" path="infoLink" />
		<br />
	</div>
	<!-- Sponsor -->
	<div>
		<form:label path="sponsor">
			<spring:message code="sponsorShip.sponsor" />:
	</form:label>
		<form:select path="sponsor">
			<form:options items="${sponsor}" itemValue="id" itemLabel="name" />
		</form:select>
		<br />
	</div>

	<!-- creditCard -->
	<div>
		<form:label path="creditCard">
			<spring:message code="sponsorShip.creditCard" />:

		<form:label path="holderName">
				<spring:message code="sponsorShip.creditCard.holderName" />
			</form:label>
			<form:label path="brandName">
				<spring:message code="sponsorShip.creditCard.brandName" />
			</form:label>
			<form:label path="number">
				<spring:message code="sponsorShip.creditCard.number" />
			</form:label>
			<form:label path="expirationMonth">
				<spring:message code="sponsorShip.creditCard.expirationMonth" />
			</form:label>
			<form:label path="expirationYear">
				<spring:message code="sponsorShip.creditCard.expirationYear" />
			</form:label>
			<form:label path="CVV">
				<spring:message code="sponsorShip.creditCard.CVV" />
			</form:label>
		</form:label>


	</div>
	<br />




	<input type="submit" name="save"
		value="<spring:message code="sponsorShip.save" />" />&nbsp;
</form:form>
