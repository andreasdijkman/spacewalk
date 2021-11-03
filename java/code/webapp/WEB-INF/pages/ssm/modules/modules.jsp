<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://rhn.redhat.com/rhn" prefix="rhn" %>
<%@ taglib uri="http://rhn.redhat.com/tags/list" prefix="rl" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>


<html:html>
    <body>
	<%@ include file="/WEB-INF/pages/common/fragments/ssm/header.jspf" %>
	<h2>
	    <bean:message key="ssm.modules.edit.header"/>
	</h2>

	<div class="page-summary"><bean:message key="ssm.modules.edit.summary"/></div>
	<hr>
	<html:form method="post" styleClass="form-horizontal" action="/ssm/modules/ModuleSubscriptions.do">
	    <rhn:csrf />
	    <html:hidden property="submitted" value="true"/>
	    <ul> <!-- Channels -->
		<c:forEach items="${ssm_module_tree}" var="channel">
		    <li>${channel.label}</li>
		    <ul> <!-- Modules -->
			<c:forEach items="${channel.modules}" var="module">
			    <li>${module.name}</li>
			    <ul> <!-- Streams -->
				<li>
				    <input type="radio" name="${channel.label}:${module.name}" value="remove">
				    Remove
				</li>
				<li>
				    <input type="radio" name="${channel.label}:${module.name}" value="no_action" checked>
				    Do not install
				</li>
				<c:forEach items="${module.streams}" var="stream">
				    <li>
					<input type="radio" name="${channel.label}:${module.name}" value="${stream.name}">
					${stream.name}
				    </li>
				</c:forEach>
			    </ul>
			</c:forEach>
		    </ul>
		</c:forEach>
	    </ul>
	    <div class="form-group">
		<html:submit property="dispatch" styleClass="btn btn-default form-horizontal pull-right">
                    <bean:message key="ssm.modules.edit.confirm_modules_streams"/>
		</html:submit>
	    </div>

	</html:form>
    </body>
</html:html>
