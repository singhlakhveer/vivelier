
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.lakhi.realestate.vender.dao.vendorDao"%>
<%@page import="com.lakhi.realestate.vender.service.VendorService"%>
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
<!-- Wrapper required for sidebar transitions -->
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
				style="padding-top: 0;">
				<div class="jumbotron text-center bg-transparent margin-none">
					<div ng-if="paymentStatus == 'Expire' "
						class="alert alert-danger center">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<%=prop.getProperty("planExpire")%>
					</div>
					<div class="row">

						<div class="col-lg-4 col-md-6"
							ng-if="vendor.amount == 'Basic' || vendor.amount == 'Pro' || vendor.amount == 'Preimum'">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-home fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge"><%=prop.getProperty("totalHotels")%></div>
											<div>
												<h3 ng-bind="dashboardTotalHotels"></h3>
											</div>
										</div>
									</div>
								</div>
								<a href="vendor/advanceSearch" ng-if="paymentStatus == 'Active' ">
									<div class="panel-footer">
										<span class="pull-left"><%=prop.getProperty("viewHotels")%></span> <span
											class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-6"
							ng-if="vendor.amount == 'Featured 1 Yr' || vendor.amount == 'Standard 3 Yr' || vendor.amount == 'Standard 1 Yr' || vendor.amount == 'Free List'">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-list-ol fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge"><%=prop.getProperty("yourListing")%></div>
											<div>
												<h3>
													<i class="fa fa-plus"></i>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<a href="vlisting/" ng-if="vendor.vendorPaymentStatus == 'Active'">
									<div class="panel-footer">
										<span class="pull-left"><%=prop.getProperty("list")%></span> <span class="pull-right"><i
											class="fa fa-arrow-circle-right"></i></span>
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
											<div class="huge"><%=prop.getProperty("activePlan")%></div>
											<div ng-if="dashboardVendorPlan != 'Free List'">
												<h3 ng-bind="dashboardVendorPlan"></h3>
											</div>
											<div ng-if="dashboardVendorPlan == 'Free List'">
												<h3><%=prop.getProperty("free")%></h3>
											</div>
										</div>
									</div>
								</div>
								<a href="vendor/updatePlan">
									<div class="panel-footer">
										<span class="pull-left"><%=prop.getProperty("updatePlan")%></span> <span
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
											<div class="huge"><%=prop.getProperty("profile")%></div>
											<div>
												<h3 ng-bind="dashboardVendorName"></h3>
											</div>
										</div>
									</div>
								</div>
								<a href="vendor/profile">
									<div class="panel-footer">
										<span class="pull-left"><%=prop.getProperty("viewProfile")%></span> <span
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
		<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
	</footer>
	<!-- // Footer -->
</div>