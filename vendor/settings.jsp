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
					<div class="profile-image">
						<div class="container">
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-md-6" ng-show="valid">
									<div class="alert alert-success">
										<a href="#" class="close" data-dismiss="alert"
											aria-label="close">&times;</a> <%=prop.getProperty("passwordUpdateMsg")%>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<h3><%=prop.getProperty("updatePassword")%></h3>
									<br>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-7">
									<form class="form-horizontal" name="form"
										ng-submit="passwordUpdate();" novalidate>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputEmail3"><%=prop.getProperty("password")%></label>
												<div class="col-sm-9">
													<input type="password" placeholder="*****" name="password"
														id="inputEmail3" ng-model="vendor.password" required
														class="form-control"> <span class="error"
														ng-show="password"><%=prop.getProperty("validPassword")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-sm-3 control-label" for="inputEmail3"><%=prop.getProperty("confirmPassword")%></label>
												<div class="col-sm-9">
													<input type="password" placeholder="*****"
														name="confirmPassword" id="inputEmail3"
														ng-model="vendor.confirmPassword" required
														class="form-control"> <span class="error"
														ng-show="confirmpassword"><%=prop.getProperty("enterConfirmPassword")%></span> <span ng-bind="vendor.inval"
														ng-if="form.confirmPassword.$valid" class="error" ></span>
												</div>
											</div>
										</div>
										<div class="col-sm-2 padding-top"></div>
										<div class="col-sm-2 padding-top col-sm-offset-1">
											<input type="Submit" value="<%=prop.getProperty("update")%>"
												class="btn btn-primary">
										</div>
								</form>
								</div>
								<div class="col-sm-12">
									<br>
									<h3><%=prop.getProperty("vendorStatus")%></h3>
									<br>
									<div class="form-group col-sm-12">
										<label class="col-sm-2 control-label"><%=prop.getProperty("vendorPlan")%></label> <span
											class="label label-default"
											data-ng-if="vendor.amount == 'Basic' "><%=prop.getProperty("basic")%></span> <span
											class="label label-info" data-ng-if="vendor.amount == 'Pro' "><%=prop.getProperty("pro")%></span>
										<span class="label label-primary"
											data-ng-if="vendor.amount == 'Preimum' "><%=prop.getProperty("premium")%></span> <span
											class="label label-default"
											data-ng-if="vendor.amount == 'Free' "><%=prop.getProperty("free")%></span> <span
											class="label label-default"
											data-ng-if="vendor.amount == 'Free List' "><%=prop.getProperty("free")%></span> <span
											class="label label-success"
											data-ng-if="vendor.amount == 'Standard 1 Yr' "><%=prop.getProperty("standard1")%></span> <span class="label label-primary"
											data-ng-if="vendor.amount == 'Standard 3 Yr' "><%=prop.getProperty("standard3")%></span> <span class="label label-primary"
											data-ng-if="vendor.amount == 'Featured 1 Yr' "><%=prop.getProperty("featured1")%></span>
									</div>
									<div class="form-group col-sm-12">
										<label class="col-sm-2 control-label"> <%=prop.getProperty("status")%> </label><span
											data-ng-if="paymentStatus == 'Active' "
											class="label label-primary"><%=prop.getProperty("active")%></span> <span
											data-ng-if="paymentStatus == 'Expire' "
											class="label label-danger"><%=prop.getProperty("expire")%></span>
									</div>
									<div class="form-group col-sm-12" ng-if="vendor.amount != 'Free'">
										<label class="col-sm-2 control-label"> <%=prop.getProperty("expireOn")%> </label> <span
											class="label label-warning" data-ng-bind="vendor.expireDate" ></span>
									</div>
								</div>
							</div>
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