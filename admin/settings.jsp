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
														id="inputEmail3" ng-model="admin.password" required
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
														ng-model="admin.confirmPassword" required
														class="form-control"> <span class="error"
														ng-show="confirmpassword"><%=prop.getProperty("enterConfirmPassword")%></span> <span ng-bind="admin.inval" class="error"
														ng-if="form.confirmPassword.$valid"></span>
												</div>
											</div>
										</div>

										<div class="col-sm-2 padding-top"></div>
										<div class="col-sm-2 padding-top col-sm-offset-1">
											<input type="Submit" value="Save"
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