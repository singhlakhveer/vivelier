<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<!-- Wrapper required for sidebar transitions -->
<%
	String z = (String) request.getSession().getAttribute("email");
	if (z == null) {
%>
<script type="text/javascript">
	$(document).ready(function() {
		window.location.href = "admin/login";
	});
</script>
<%
	}
%>
<div class="st-container" data-ng-controller="adminLoginCtrl"
	data-ng-init="adminProfile('<%=z%>');">
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
			<div class="st-content-inner" id="content" data-scrollable
				data-ng-init="vendorProfile">
				<div class="container-fluid">

					<div class="profile-image">
						<div class="container">
							<div class="row">
								<div class="col-sm-3"></div>
								<div class="col-md-7" ng-show="valid">
									<div class="alert alert-success">
										<a href="#" class="close" data-dismiss="alert"
											aria-label="close">&times;</a> <%=prop.getProperty("profileUdateMsg")%>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3">

									<div class="outer-circle-image">
										<div class="inner-circle-image" ng-bind-html="customAdminHtml">
										</div>
										<div class="profile">
											<br>
											<form novalidate name="form1" enctype="multipart/form-data">
												<input type="file" name="file"
													onchange="angular.element(this).scope().uploadFile(this.files)" />
												<br> <input type="submit"
													ng-click="uploadFiles('<%=z%>')" value="<%=prop.getProperty("uploadImg")%>"
													class="btn btn-primary" />
											</form>
										</div>
									</div>
								</div>
								<div class="col-sm-7">
									<form class="form-horizontal" name="form" ng-submit="profileUpdate();" novalidate>
										<div class="col-sm-6">

											<div class="form-group">
												<label class="col-sm-4 control-label"><%=prop.getProperty("firstName")%></label>
												<div class="col-sm-8">
													<input type="text" placeholder="First Name"
														name="firstName" ng-model="admin.firstName" required
														class="form-control"> <span
														ng-show="form.firstName.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validFN")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-sm-4 control-label"><%=prop.getProperty("lastName")%></label>
												<div class="col-sm-8">
													<input type="text" name="lastName" placeholder="Last Name"
														ng-model="admin.lastName" required class="form-control">
													<span ng-show="form.lastName.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validLN")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="inputEmail3"><%=prop.getProperty("email")%></label>
												<div class="col-sm-10">
													<input type="email" ng-disabled="true" placeholder="Email"
														name="email" id="inputEmail3" ng-model="admin.email"
														required class="form-control">
													<div></div>
													<span ng-show="form.email.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("enterEmail")%></span> <span
														ng-show="form.email.$error.email" style="color: #ca0707;"><%=prop.getProperty("validEmail")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="inputEmail3"><%=prop.getProperty("phone")%></label>
												<div class="col-sm-10">
													<input type="text" placeholder="Phone" name="phone"
														id="inputEmail3" ng-model="admin.phone" required
														ng-minlength="10" ng-maxlength="10" class="form-control">
													<span ng-show="form.phone.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("enterPhone")%></span> <span
														ng-show="form.phone.$error.minlength || form.phone.$error.maxlength"
														style="color: #ca0707;"><%=prop.getProperty("validPhone")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="inputEmail3"><%=prop.getProperty("address")%></label>
												<div class="col-sm-10">
													<textarea name="address" placeholder="Address"
														id="inputEmail3" ng-model="admin.address" required
														class="form-control"></textarea>
													<span ng-show="form.address.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validAddress")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-2 padding-top"></div>
										<div class="col-sm-2 padding-top">
											<input type="Submit" ng-disabled="!form.$valid" value="<%=prop.getProperty("save")%>"
												class="btn btn-primary">
										</div>
								</form>
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
<!-- /st-pusher -->

<!-- Footer -->
<footer class="footer">
	<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
</footer>
<!-- // Footer -->

</div>