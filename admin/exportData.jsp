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
								<div class="col-md-12">
									<div class="col-sm-8" ng-show="valid">
										<div class="alert alert-success">
											<a href="#" class="close" data-dismiss="alert"
												aria-label="close">&times;</a> <%=prop.getProperty("exportHotelMsg")%>
												 <span ng-bind="hotel" ></span>
										</div>
									</div>
									<div class="col-sm-12">
										<h3><%=prop.getProperty("exportData")%></h3>
										<div class="col-sm-8">
											<div class="form-group">
												<label class="col-sm-3 control-label"><%=prop.getProperty("exportHotelsBy")%></label>
												<div class="col-sm-9">
													<select data-ng-model="selectedItem"
														data-ng-change="changeCityCountry()" class="selectpicker"
														data-style="btn-primary">
														<option></option>
														<option value="City">City</option>
														<option value="State">State</option>
														<option value="Country">Country</option>
														<option value="Rating">Rating</option>
													</select> <br>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-8" data-ng-show="select" style="margin-top:20px;" >
										<div class="form-group">
											<label class="col-sm-3 control-label"><%=prop.getProperty("exportHotelsBy")%></label>
											<div class="col-sm-9">
												<select style="width: 100%;" data-toggle="select2"
											name="selectedItemData" ng-model="selectedItemData" required="required" data-ng-options="item for item in names">
										</select>
												<br>
												<br>
												<button class="btn btn-primary" ng-click="exportHotelDetails();"><%=prop.getProperty("export")%></button>
											</div>
										</div>
									</div>
									<!-- <div class="col-sm-12" style="margin-top: 50px;display: none;">
										<h3>Import Hotels data</h3>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-sm-3 control-label">Import Hotels Data
													</label>
												<div class="col-sm-9">
													<form novalidate name="form" >
														<input type="file" name="file" onchange="angular.element(this).scope().csvFile(this.files)"/><br>
														<button type="submit" ng-click="uploadCSVFile();" class="btn btn-primary">Upload File</button>
													</form>
												
												</div>
											</div>
										</div>
									</div> -->
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
	<strong><%=prop.getProperty("page_title")%></strong>  &copy;2015
</footer>
<!-- // Footer -->

</div>