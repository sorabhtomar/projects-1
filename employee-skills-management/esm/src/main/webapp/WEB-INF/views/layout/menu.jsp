<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<p>
	<a href="${pageContext.request.contextPath}/skills">
		<spring:message code="menu.manage.skills" />
	</a>
</p>
<p>
	<a href="${pageContext.request.contextPath}/employees">
		<spring:message code="menu.manage.employees" />
	</a>
</p>