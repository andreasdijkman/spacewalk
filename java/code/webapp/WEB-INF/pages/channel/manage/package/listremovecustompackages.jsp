<%@ taglib uri="http://rhn.redhat.com/rhn" prefix="rhn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://rhn.redhat.com/tags/list" prefix="rl" %>

<html:xhtml/>
<html>
<head>
    <meta name="page-decorator" content="none" />
    <!-- disables the enter key from submitting the form -->
    <script type="text/javascript" language="JavaScript">
		function key(e) {
		var pkey = e ? e.which : window.event.keyCode;
		return pkey != 13;
		}
		document.onkeypress = key;
		if (document.layers) document.captureEvents(Event.KEYPRESS);
     </script>
</head>
<body>
<rhn:toolbar base="h1" img="/img/rhn-icon-packages.gif" imgAlt="overview.jsp.alt"
 helpUrl="/rhn/help/channel-mgmt/en-US/channel-mgmt-Custom_Channel_and_Package_Management-Manage_Software_Packages.jsp">
   <bean:message key="channel.jsp.manage.package.title"/>
</rhn:toolbar>




<rl:listset name="packageSet">
<rhn:csrf />
<bean:message key="channel.jsp.manage.package.message"/>
<h2><bean:message key="channel.jsp.manage.package.subtitle"/></h2>


<table class="details" width="80%">

			  <tr> <th width="10%">Channel:</th><td width="40%">
			  <select name="selected_channel">
					<option value="all_managed_packages" <c:if test="${all_selected eq true}">selected = "selected"</c:if>>All managed packages</option>
					<option value="orphan_packages" <c:if test="${orphan_selected eq true}">selected = "selected"</c:if>>Packages in no channels.</option>
				    <optgroup>
					<c:forEach var="option" items="${channel_list}">
						<c:choose>
							<c:when test="${option.baseChannel}">
							    </optgroup>
								<option value="${option.id}"  <c:if test="${option.selected eq true}">selected = "selected"</c:if>    >${option.name}	</option>
								<optgroup>
							</c:when>
							<c:otherwise>
								<option value="${option.id}"   <c:if test="${option.selected eq true}">selected = "selected"</c:if> >${option.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</optgroup>
			  </select>

			  </td>
					  <td>
							  <input type="submit" name="view"  value="<bean:message key="channel.jsp.package.viewpackages"/>">
					  </td>
			     </tr>



  </table>




		  <rl:list dataset="pageList" name="packageList"
		  decorator="SelectableDecorator"
					emptykey="channel.jsp.package.addemptylist"
					alphabarcolumn="nvrea"
					 filter="com.redhat.rhn.frontend.taglibs.list.filters.PackageFilter"
					>

				<rl:decorator name="ElaborationDecorator"/>
				<rl:decorator name="PageSizeDecorator"/>

				<rl:selectablecolumn value="${current.selectionKey}"
					selected="${current.selected}"/>


                 <rl:column sortable="true"
                                   bound="false"
                           headerkey="download.jsp.package"
                           sortattr="nvrea"
					defaultsort="asc"
                           >

                        <a href="/rhn/software/packages/Details.do?pid=${current.id}">${current.nvrea}</a>
                </rl:column>


                 <rl:column sortable="false"
                                   bound="false"
                           headerkey="channel.jsp.manage.package.channels"
                          >
                          <c:if test="${empty current.packageChannels}">
				(<bean:message key="channel.jsp.manage.package.none"/>)
                          </c:if>

                          <c:forEach var="channel" items="${current.packageChannels}">
				${channel}
				<BR>
                          </c:forEach>

                </rl:column>

                 <rl:column sortable="false"
                                   bound="false"
                           headerkey="package.jsp.provider"
                          >
                        ${current.provider}
                </rl:column>



			  </rl:list>


			<p align="right">
			<input type="submit" name="confirm"  value="<bean:message key="channel.jsp.manage.package.confirmbutton"/>"
            <c:choose>
                <c:when test="${empty pageList}">disabled</c:when>
            </c:choose>
            >
			</p>
     <rhn:submitted/>
</rl:listset>
</body>
</html>

