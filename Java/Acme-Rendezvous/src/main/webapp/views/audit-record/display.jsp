<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<div>
<img src="images/rectangulogris.png"/>
<h1><jstl:out value="${auditRecord.moment }"/></h1>
<h1><jstl:out value="${auditRecord.title }"/></h1>
<h1><jstl:out value="${auditRecord.auditor }"/></h1>
<h1><jstl:out value="${auditRecord.trip }"/></h1>
<h1><jstl:out value="${auditRecord.description }"/></h1>
<h1><jstl:out value="${auditRecord.attachments }"/></h1>
</div>