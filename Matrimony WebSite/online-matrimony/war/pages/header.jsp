<%@ page import="com.matrimony.constants.Constants"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<table width="100%" border="0" cellpadding="3" cellspacing="3"
	class="header-table">
	<tr>
		<td width="8%"><img src="/images/logo.jpg" width="120px" height="112px"></td>
		<td align="left" class="website-title">
			<bean:message key="website.header"/>
			<!-- वधु-वर सूचक मंडळ, डोंबिवली -->
		</td>
		<td align="right" valign="middle">
			<table border="0" class="stats" cellpadding="3" cellspacing="3">
				<tr>
					<td align="right">
						<u><i><bean:message key="number.of.users"/>:</i></u></td>
					<td><b><i>286</i></b></td>
				</tr>
				<tr>
					<td align="right">
						<u><i><bean:message key="number.of.views"/>:</i></u>
					</td>
					<td><b><i>827</i></b></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="header-menu-table">
	<tr>
		<td colspan="2" width="100%" class="header-menu">
		<div>
		<ul id="list-nav">
			<logic:equal name="<%=Constants.USER_LOGGED_IN%>" value="false" scope="request">
				<li>
					<a href="/Menu.do?action=view&hm=register" id="header_menu_register" style="border-left: 3px solid #FCF8D3; float: right">
						<bean:message key="menu.item.register"/>
					</a>
				</li>
				<li>
					<a href="/Menu.do?action=view&hm=login" id="header_menu_login" style="border-left: 3px solid #FCF8D3; float: right">
						<bean:message key="menu.item.login"/>
					</a>
				</li>
			</logic:equal>
			<logic:equal name="<%=Constants.USER_LOGGED_IN%>" value="true" scope="request">
				<li>
					<a href="/Logout.do?action=logout" id="header_menu_logout" style="border-left: 3px solid #FCF8D3; float: right">
						<bean:message key="menu.item.logout"/>
					</a>
				</li>
				<li>
					<a href="/MyProfile.do?action=view&reload=true&sm=viewMyProfile" id="header_menu_myProfile" style="border-left: 3px solid #FCF8D3; float: right">
						<bean:message key="menu.item.my_profile"/>
					</a>
				</li>
			</logic:equal>
			<li>
				<a href="/Menu.do?action=view&hm=aboutUs" id="header_menu_home" style="border-left: none">
					<bean:message key="menu.item.home"/>
				</a>
			</li>
			<!--
			<li><a href="/Menu.do?hm=myProfile"><bean:message key="menu.item.my_profile"/></a></li>
			-->
			<li>
				<a href="/Menu.do?action=view&hm=membership" id="header_menu_membership">
					<bean:message key="menu.item.membership"/>
				</a>
			</li>
			<li>
				<a href="/Menu.do?action=view&hm=contactUs" id="header_menu_contactUs">
					<bean:message key="menu.item.contact_us"/>
				</a>
			</li>
			<li>
				<a href="/Menu.do?action=view&hm=siteMap" id="header_menu_siteMap" style="border-right: 3px solid #FCF8D3;">
					<bean:message key="menu.item.site_map"/>
				</a>
			</li>
		</ul>
		</div>
		</td>
	</tr>
</table>

<script>
	var currHeaderMenu = document.getElementById("header_menu_" + "<%=session.getAttribute(Constants.CURRENT_HEADER_MENU)%>");
	if (!currHeaderMenu)
	{
		currHeaderMenu = document.getElementById("header_menu_home");
	}
	currHeaderMenu.className = "selected";
</script>

