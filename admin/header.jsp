<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<%
	String z = (String) request.getSession().getAttribute("email");
	if (z == null) {
		out.print("<script>window.location.href = 'admin/login' </script>");
	} 
%>
<div class="container-fluid" data-ng-init="profile('<%=z%>');">
	<div class="navbar-header">
		<a href="#sidebar-menu" data-toggle="sidebar-menu"
			class="toggle pull-left visible-xs"><i class="fa fa-bars"></i></a>
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#main-nav">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<a class="navbar-brand dashboard-top-title" ui-sref="admin.dashboard"><i
			class="md fa-fw md-home text-primary"></i> <%=prop.getProperty("page_title")%></a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="main-nav">

		<ul class="nav navbar-nav navbar-right">
			<!-- user -->
			<li class="dropdown user"><a href="#" class="dropdown-toggle"
				ng-bind-html="customAdminHtml" data-toggle="dropdown"> </a>
				<ul class="dropdown-menu" role="menu">
					<li></li>
					<li><a href="#" ui-sref="admin.profile"><i
							class="fa fa-user"></i><%=prop.getProperty("profile")%></a></li>
					<li><a href="#" ui-sref="admin.settings"><i
							class="fa fa-wrench"></i><%=prop.getProperty("setting")%></a></li>
					<li><a href="#" data-ng-click="dbBackup();"><i
							class="fa fa-download"></i><%=prop.getProperty("dbBackup")%></a></li>
					<li><a href="#" ng-click="alogout();" ><i
							class="fa fa-sign-out"></i><%=prop.getProperty("logout")%></a></li>
				</ul></li>
			<!-- // END user -->
		</ul>
	</div>
	<!-- /.navbar-collapse -->

</div>
<!-- <div id="img" style="width: 20%; margin: 0 auto; display: none;">
	<img src="images/load.gif" />
</div> -->