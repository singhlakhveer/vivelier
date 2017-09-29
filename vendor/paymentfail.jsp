<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String z = (String) request.getSession().getAttribute("vmail");
	if (z == null) {
%>
<script type="text/javascript">
	$(document).ready(function() {
		window.location.href = "login";
	});
</script>
<%
	}
%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<div class="st-container" data-ng-controller="vendorCtrl"
	data-ng-init="vendorProfile('<%=z%>');">

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"vendor/header.jsp"'></nav>

	<!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"vendor/sidebar.jsp"'>
	</aside>

	<!-- sidebar effects OUTSIDE of st-pusher: -->
	<!-- st-effect-1, st-effect-2, st-effect-4, st-effect-5, st-effect-9, st-effect-10, st-effect-11, st-effect-12, st-effect-13 -->

	<!-- content push wrapper -->
	<div class="st-pusher">

		<!-- sidebar effects INSIDE of st-pusher: -->
		<!-- st-effect-3, st-effect-6, st-effect-7, st-effect-8, st-effect-14 -->

		<!-- this is the wrapper for the content -->
		<div class="st-content">

			<!-- extra div for emulating position:fixed of the menu -->
			<div class="st-content-inner" id="content" data-scrollable
				data-ng-init="vendorProfile">
				<div class="container-fluid">

					<div class="page-section" style="height: 330px;">
						<h1 style="text-align: center;"><%=prop.getProperty("fail")%></h1>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- /st-content-inner -->
<!-- /st-content -->
<!-- /st-pusher -->
<!-- Footer -->
<footer class="footer">
	<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
</footer>
<!-- // Footer -->
</div>