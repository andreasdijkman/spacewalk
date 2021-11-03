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
	<html:form method="post" styleClass="form-horizontal" action="/systems/details/SystemModules.do?sid=${sid}">
	    <rhn:csrf />
	    <html:hidden property="submitted" value="true"/>
	    
	    <h3>Modules to remove</h3>
	    <ul>
		<c:forEach items="${modules_remove_list}" var="item">
		    <li>${item.module}</li>
		</c:forEach>
	    </ul>

	    <h3>Modules to install</h3>
	    <ul>
		<c:forEach items="${modules_install_list}" var="item">
		    <li>${item.module}:${item.stream}</li>
		</c:forEach>
	    </ul>
	    <div class="form-group">
		<html:submit property="dispatch" styleClass="btn btn-default form-horizontal pull-right">
                    <bean:message key="sdc.modules.edit.update_modules_streams"/>
		</html:submit>
	    </div>

	</html:form>
    </body>
</html:html>
