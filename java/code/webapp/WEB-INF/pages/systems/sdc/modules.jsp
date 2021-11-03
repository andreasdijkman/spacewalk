<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://rhn.redhat.com/rhn" prefix="rhn" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<html:html>
    <body>
	<%@ include file="/WEB-INF/pages/common/fragments/systems/system-header.jspf" %>
	<h2>
	    <rhn:icon type="header-channel" title="common.download.channelAlt" />
	    <bean:message key="sdc.modules.edit.header2"/>
	</h2>
	<html:form method="post" styleClass="form-horizontal" action="/systems/details/SystemModules.do?sid=${system.id}">
	    <rhn:csrf />
	    <html:hidden property="submitted" value="true"/>
	    <p><bean:message key="sdc.modules.edit.summary"/></p>
	    <c:choose>
		<c:when test="${system.baseChannel == null}">
		    <div class="form-group">
			<div class="alert alert-warning">
                            <bean:message key="sdc.channels.edit.nobasechannel"/>
			    <a href="/systems/details/SystemChannels.do?sid=${system.id}">Channel</a>
			</div>
		    </div>
		</c:when>
		<c:otherwise>
		    <ul> <!-- Channels -->
			<c:forEach items="${module_tree}" var="channel">
			    <li>${channel.label}</li>
			    <ul> <!-- Modules -->
				<c:forEach items="${channel.modules}" var="module">
				    <li>${module.name}</li>
				    <ul> <!-- Streams -->
					<li>
					    <c:choose>
						<c:when test="${not module.installed}">
						    <input type="radio" name="${channel.label}:${module.name}" value="no_action" checked>
						    Do not install
						</c:when>
						<c:otherwise>
						    <input type="radio" name="${channel.label}:${module.name}" value="remove">
						    Remove
						</c:otherwise>
					    </c:choose>
					</li>
					<c:forEach items="${module.streams}" var="stream">
					    <c:choose>
						<c:when test="${stream.installed}">
						    <c:set var="stream_value" value="no_action"/>
						    <c:set var="stream_checked" value="checked"/>
						</c:when>
						<c:otherwise>
						    <c:set var="stream_value" value="${stream.name}"/>
						    <c:set var="stream_checked" value=""/>
						</c:otherwise>
					    </c:choose>
					    <li>
						<input type="radio" name="${channel.label}:${module.name}" value="${stream_value}" ${stream_checked}>
						${stream.name}
					    </li>
					</c:forEach>
				    </ul>
				</c:forEach>
			    </ul>
			</c:forEach>
		    </ul>
		</c:otherwise>
	    </c:choose>
	    <div class="form-group">
		<html:submit property="dispatch" styleClass="btn btn-default form-horizontal pull-right">
                    <bean:message key="sdc.modules.edit.confirm_modules_streams"/>
		</html:submit>
	    </div>

	</html:form>
    </body>
</html:html>
