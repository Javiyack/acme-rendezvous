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

		<security:authorize access="isAnonymous()">

			<li><a href="user/list.do"><spring:message
						code="master.page.user.list" /></a></li>

			<li><a href="rendezvous/list.do"><spring:message
						code="master.page.rendezvouses" /></a></li>

			<li><a class="fNiv" href="security/login.do"><spring:message
						code="master.page.login" /></a></li>

			<li><a href="user/create.do"><spring:message
						code="master.page.register" /></a></li>

		</security:authorize>

		<security:authorize access="hasRole('USER')">

			<li><a href="user/list.do"><spring:message
						code="master.page.user.list" /></a></li>

			<li><a class="fNiv"><spring:message
						code="master.page.rendezvouses" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="rendezvous/list.do"><spring:message
								code="master.page.rendezvouses" /></a></li>
					<li><a href="rendezvous/user/list.do"><spring:message
								code="master.page.myRendezvouses" /></a></li>
					<li><a href="rendezvous/user/create.do"><spring:message
								code="master.page.newrendezvous" /></a></li>
				</ul></li>

		</security:authorize>

		<security:authorize access="hasRole('ADMINISTRATOR')">
			<li><a href="rendezvous/list.do"><spring:message
						code="master.page.rendezvouses" /> </a></li>

			<li><a href="comment/list.do"><spring:message
						code="master.page.comments" /> </a></li>

			<li><a href="dashboard/list.do"><spring:message
						code="master.page.dashboard" /> </a></li>

		</security:authorize>


		<security:authorize access="isAuthenticated()">
			<li><a class="fNiv">
				 <security:authentication
						property="principal.username" />
					</a>
				<ul>
					<li class="arrow"></li>
					<li><a href="actor/edit.do"><spring:message
								code="master.page.actor.edit" /></a></li>
					
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
