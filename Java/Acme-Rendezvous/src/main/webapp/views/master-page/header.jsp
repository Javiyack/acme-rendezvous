<%--
 * header.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>


<div>
	<img src="http://creek-tours.com/wp-content/uploads/Kenya-Tanzania-Family-Safari-banner.jpg" alt="Acme-Rendezvous Co., Inc." style="height:6em; width:15em"/>
</div>
<!-- EXPLORER RANGER MANAGER ADMINISTRATOR AUDITOR SPONSOR + "$") -->
<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		<li>
				<input type="text" id="keyWord" placeholder="Buscar..." autofocus="autofocus" onchange="getKeyWordAndList()" />
				<button
			onclick="getKeyWordAndList()"
			class="dropbtn"  >
			<spring:message code="msg.search" />
		</button>

			</li>
		
		<li><a class="fNiv" href="category/browse.do"><spring:message
					code="master.page.categories" /></a></li>
		<security:authorize access="hasRole('ADMINISTRATOR')">
			<li><a class="fNiv"><spring:message
						code="master.page.administrator" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="administrator/actor/edit.do"><spring:message
								code="master.page.administrator.edit" /></a></li>
					<li><a href="administrator/legalText/list.do"><spring:message
								code="administrator.legalText.laws" /></a></li>			
								
					<li><a href="administrator/actor/list.do"><spring:message
								code="master.page.profile.edit" /></a></li>
					<li><a href="administrator/dashboard/statistics.do"><spring:message
								code="master.page.profile.dashboard" /></a></li>
				</ul></li>
					
		</security:authorize>

		<security:authorize access="hasRole('MANAGER')">
			<li><a class="fNiv"><spring:message
						code="master.page.manager" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="manager/actor/edit.do"><spring:message
								code="master.page.edit" /></a></li>
					<li><a href="manager/note/list.do"><spring:message
								code="master.page.notes" /></a></li>
					<li><a href="manager/survivalClass/list.do"><spring:message
								code="master.page.survival" /></a></li>
					<li><a href="manager/trip/list.do"><spring:message
								code="master.page.misTrips" /></a></li>

				</ul></li>
		</security:authorize>
		
			<security:authorize access="hasRole('EXPLORER')">
			<li><a class="fNiv"><spring:message
						code="master.page.explorer" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="explorer/actor/edit.do"><spring:message
								code="master.page.profile" /></a></li>
					<li><a href="explorer/trip/list.do"><spring:message
								code="master.page.trips" /></a></li>
					<li><a href="explorer/survivalClass/list.do"><spring:message
								code="master.page.survival" /></a></li>
					<li><a href="actor/folder/list.do"><spring:message
								code="master.page.messages" /></a></li>
					<li><a href="explorer/application/list.do"><spring:message
								code="master.page.applications" /></a></li>
					<li><a href="explorer/creditCard/create.do"><spring:message
								code="master.page.explorer.creditcard" /></a></li>
				</ul></li>
		</security:authorize>
		

		<security:authorize access="hasRole('AUDITOR')">
			<li><a class="fNiv"><spring:message
						code="master.page.auditor" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="auditor/audit/list.do"><spring:message
								code="master.page.audits" /></a></li>
					<li><a href="auditor/note/list.do"><spring:message
								code="master.page.notes" /></a></li>
				</ul></li>
		</security:authorize>

		<security:authorize access="hasRole('RANGER')">
			<li><a class="fNiv"><spring:message
						code="master.page.ranger" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="explorer/actor/edit.do"><spring:message
								code="master.page.profile" /></a></li>
					<li><a href="/trip/list.do"><spring:message
								code="master.page.trips" /></a></li>
					<li><a href="explorer/survivalClass/list.do"><spring:message
								code="master.page.survival" /></a></li>
					<li><a href="explorer/messages/list.do"><spring:message
								code="master.page.messages" /></a></li>
					<li><a href="explorer/application/list.do"><spring:message
								code="master.page.applications" /></a></li>
				</ul></li>
		</security:authorize>


		<security:authorize access="isAnonymous()">
			<li><a class="fNiv"> <spring:message
						code="master.page.trip" /></a>
				<ul>
					<li class="arrow"></li>				

					<li><a href="trip/list.do"><spring:message
								code="master.page.trips" /></a></li>
					<li><a href="anonymous/finder/create.do"><spring:message
								code="master.page.search.trip" /></a></li>
				</ul>
			</li>	<li><a class="fNiv"><spring:message
						code="master.page.register" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="anonymous/actor/createExplorer.do"><spring:message
								code="master.page.registerExplorer" /></a></li>
					<li><a href="anonymous/actor/createRanger.do"><spring:message
								code="master.page.registerRanger" /></a></li>

					
				</ul></li>
			<li><a class="fNiv" href="security/login.do"><spring:message
						code="master.page.login" /></a></li>		
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li><a class="fNiv">
				 <security:authentication
						property="principal.username" />
					</a>
				<ul>
					<li class="arrow"></li>
					<li><a href="actor/folder/list.do"><spring:message
								code="master.page.messages" /></a></li>
					<li><a href="j_spring_security_logout"><spring:message
								code="master.page.logout" /> </a></li>
				</ul></li>
			
		</security:authorize>
		
		
	</ul>
</div>

<div>
	<a href="${requestScope['javax.servlet.forward.request_uri']}<my:replaceParam name='language' value='en' />">en</a> | 
	<a href="${requestScope['javax.servlet.forward.request_uri']}<my:replaceParam name='language' value='es' />">es</a>
		
</div>
