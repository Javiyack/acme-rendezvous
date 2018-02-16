<%--
 * list.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>
<%@page import="org.apache.commons.lang.time.DateUtils"%>
<%@page import="org.hibernate.engine.spi.RowSelection"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<table style="width: 70%; ">
  <tr>
    <th><spring:message code="dashboard.statistics"/></th>
    <th><spring:message code="dashboard.value"/></th>
  </tr>
 
  <tr>
  <td><spring:message code="dashboard.tripApplication"/></td>
  <td>${tripApplication }</td>
  </tr>
  
   <tr>
  <td><spring:message code="dashboard.tripManager"/></td>
  <td>${tripManager }</td>
  </tr>
  
    <tr>
  <td><spring:message code="dashboard.tripPrice"/></td>
  <td>${tripPrice }</td>
  </tr>
  
   <tr>
  <td><spring:message code="dashboard.tripRanger"/></td>
  <td>${tripRanger }</td>
  </tr>
  
  <tr>
  <td><spring:message code="dashboard.applicationPending"/></td>
  <td>${applicationsPending}</td>
  </tr>
  
   <tr>
  <td><spring:message code="dashboard.applicationDue"/></td>
  <td>${applicationsDue}</td>
  </tr>
  
   <tr>
  <td><spring:message code="dashboard.applicationAccepted"/></td>
  <td>${applicationsAccepted}</td>
  </tr>
  
   <tr>
  <td><spring:message code="dashboard.applicationCancelled"/></td>
  <td>${applicationsCancelled}</td>
  </tr>
  
   <tr>
  <td><spring:message code="dashboard.statsTripCancelled"/></td>
  <td>${statsTripsCancelled}</td>
  </tr>
  </table>
  <h3><spring:message code="dashboard.tripsCancelled"/></h3>
<display:table name="tripsCancelled" id="row"  class="displayTag" style="width:30%;">

<spring:message code="trip.trips"/>
	<spring:message code="trip.title" var="tripTitle"/>
	<display:column property="title" title="${tripTitle }"/>
	
</display:table>


<h3><spring:message code="dashboard.legaltext"/></h3>
<display:table name="legalTexts" id="row"  class="displayTag" style="width:30%;">

	<spring:message code="dashboard.legaltextCount" var="legaltextTitle"/>

	<display:column property="title" title="${tripTitle }"/>
	<display:column title="${legaltextTitle}">${row.trips.size()}</display:column>
	
</display:table>
  
  



	
