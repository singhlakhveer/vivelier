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
%>
<!-- Wrapper required for sidebar transitions -->
<div class="st-container"  data-ng-controller="adminLoginCtrl" data-ng-init="adminProfile('<%= z %>');">

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"admin/header.jsp"'></nav>
	<!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"admin/sidebar.jsp"'>
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
			<div class="st-content-inner" id="content" data-scrollable>
				<div class="jumbotron text-center bg-transparent margin-none">
					<div class="row">
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-home fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge"><%=prop.getProperty("totalHotels")%></div>
											<div><h3 ng-bind="dashboardTotalHotels"></h3></div>
										</div>
									</div>
								</div>
								<a href="admin/hotels" >
									<div class="panel-footer">
										<span class="pull-left"><%=prop.getProperty("viewHotels")%></span> <span
											class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-user fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge"><%=prop.getProperty("vendors")%></div>
											<div><h3 ng-bind="dashboardTotalVendor"></h3></div>
										</div>
									</div>
								</div>
								<a href="admin/vendors">
									<div class="panel-footer">
										<span class="pull-left"><%=prop.getProperty("allVendors")%></span> <span
											class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-tasks fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge"><%=prop.getProperty("db")%></div>
											<div><h3><%=prop.getProperty("backup")%></h3></div>
										</div>
									</div>
								</div>
								<a href="admin/exportData">
									<div class="panel-footer">
										<span class="pull-left"><%=prop.getProperty("backup")%></span> <span
											class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /st-content-inner -->
		</div>
		<!-- /st-content -->
	</div>
	<!-- /st-pusher -->
	<!-- Footer -->
	<footer class="footer">
		<strong><%=prop.getProperty("page_title")%></strong>  &copy;2015
	</footer>
	<!-- // Footer -->
</div>