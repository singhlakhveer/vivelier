<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
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
	data-ng-init="adminProfile('<%=z%>');getVendorById();vendorProfile();">
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
					
							<ul class="nav nav-tabs">
								<li><a data-toggle="tab" href="#home"><%=prop.getProperty("profile")%></a></li>
								<li  class="active"><a data-toggle="tab" href="#menu2"
									ng-if="user.amount == 'Standard 1 Yr' || user.amount == 'Standard 3 Yr' || user.amount == 'Featured 1 Yr' || user.amount == 'Free List'"
									ng-init="getAllListing(user.email);"><%=prop.getProperty("vendorListing")%></a></li>
								<li><a data-toggle="tab" href="#menu1"><%=prop.getProperty("setting")%></a></li>
							</ul>
							<div class="tab-content">
								<div id="home" class="tab-pane fade">
									<div class="profile-image">
										<div class="container">
											<div class="row">
												<div class="col-sm-3"></div>
												<div class="col-sm-7">
													<div class="col-sm-12" ng-show="valid">
														<div class="alert alert-success">
															<a href="#" class="close" data-dismiss="alert"
																aria-label="close">&times;</a> Vendor password is <strong>
																successfully </strong>reset.
														</div>
													</div>
												</div>
												<div class="col-sm-3">
													<div class="outer-circle-image">
														<div class="inner-circle-image" ng-bind-html="customHtml">
														</div>
													</div>
												</div>
												<div class="col-sm-7">
													<div class="col-sm-6">
														<div class="form-group">
															<label class="col-sm-4 control-label"><%=prop.getProperty("firstName")%></label>
															<div class="col-sm-8">
																<label class="col-sm-12 control-label" for="inputEmail3"
																	ng-bind="user.first_name"></label>
															</div>
														</div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															<label class="col-sm-4 control-label"><%=prop.getProperty("lastName")%></label>
															<div class="col-sm-8">
																<label class="col-sm-12 control-label" for="inputEmail3"
																	ng-bind="user.last_name"></label>
															</div>
														</div>
													</div>
													<div class="col-sm-12">
														<div class="form-group">
															<label class="col-sm-2 control-label" for="inputEmail3"><%=prop.getProperty("email")%></label>
															<div class="col-sm-10">
																<label class="col-sm-12 control-label" for="inputEmail3"
																	ng-bind="user.email"></label>
															</div>
														</div>
													</div>
													<div class="col-sm-12">
														<div class="form-group">
															<label class="col-sm-2 control-label" for="inputEmail3"><%=prop.getProperty("phone")%></label>
															<div class="col-sm-10">
																<label class="col-sm-12 control-label" for="inputEmail3"
																	ng-bind="user.phone"></label>
															</div>
														</div>
													</div>
													<div class="col-sm-12">
														<div class="form-group">
															<label class="col-sm-2 control-label" for="inputEmail3"><%=prop.getProperty("address")%></label>
															<div class="col-sm-10">
																<label class="col-sm-12 control-label" for="inputEmail3"
																	ng-bind="user.address"></label>
															</div>
														</div>
													</div>
													<div class="col-sm-12"><br>
														<div class="col-sm-3">
															<div class="form-group">
																<%=prop.getProperty("status")%>
																
																	<span class="label label-primary"
																		ng-if="user.status == 1 "><%=prop.getProperty("active")%></span> <span
																		class="label label-danger" ng-if="user.status != 1 "><%=prop.getProperty("deactive")%></span>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<%=prop.getProperty("vendorPlan")%>
																
																	<span class="label label-default"
																		data-ng-if="user.amount == 'Basic' "><%=prop.getProperty("basic")%></span> <span
																		class="label label-info"
																		data-ng-if="user.amount == 'Pro' "><%=prop.getProperty("pro")%></span> <span
																		class="label label-success"
																		data-ng-if="user.amount == 'Preimum' "><%=prop.getProperty("premium")%></span>
																		<span class="label label-success"
																		data-ng-if="user.amount == 'Free' "><%=prop.getProperty("free")%></span>
																	<span class="label label-success"
																		data-ng-if="user.amount == 'Free List' "><%=prop.getProperty("free")%></span> <span
																		class="label label-success"
																		data-ng-if="user.amount == 'Standard 1 Yr' "><%=prop.getProperty("standard1")%></span> <span class="label label-primary"
																		data-ng-if="user.amount == 'Standard 3 Yr' "><%=prop.getProperty("standard3")%></span> <span class="label label-primary"
																		data-ng-if="user.amount == 'Featured 1 Yr' "><%=prop.getProperty("featured1")%></span>
																
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group" ng-show="user.amount != 'Free' ">
																<%=prop.getProperty("expireOn")%>
																
																	<span data-ng-bind="user.expireDate"
																		ng-if="user.vendorPaymentStatus == 'Active' && user.amount != 'Free'"
																		class="label label-warning"></span> <span
																		ng-if="user.vendorPaymentStatus != 'Active' && user.amount != 'Free'"
																		class="label label-danger"><%=prop.getProperty("expire")%></span>
																
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="menu1" class="tab-pane fade">
									<div class="setting-tab">
										<h3><%=prop.getProperty("resetPassword")%></h3>
										<button class="btn btn-primary" data-toggle="modal" data-target="#myModal"><%=prop.getProperty("reset")%></button>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog modal-sm loginpopup">
											<div class="modal-content form-wrap">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h3 class="modal-title"><%=prop.getProperty("forgotPassword")%></h3>
												</div>
												<div class="modal-body">
													<div class="alert alert-danger" ng-hide="!inval1">
														<%=prop.getProperty("invalEmail")%>
													</div>
													<div class="alert alert-success" ng-hide="!suc1" style="text-align: center;">
														<%=prop.getProperty("vendorPasswordResetMsg")%>
													</div>
													<form name="form1" ng-submit="reset();" novalidate>
														<div class="form-group">
															<label><%=prop.getProperty("email")%> <span class="error">*</span></label> <input
																class="form-control" type="email" ng-model="email"
																name="email" required="required"> <span
																ng-show="form1.email.$error.email" class="error"><%=prop.getProperty("invalEmail")%></span>
														</div>
														
														<div class="form-group">
															<input class="btn btn-primary form-control"
																ng-disabled="!form1.$valid" value="<%=prop.getProperty("resetPassword")%>" type="submit">
														</div>
													</form>
												</div>
												<div class="modal-footer"></div>
											</div>
										</div>
									</div>
									<div class="setting-tab">
										<div ng-if="user.status != 1 ">
											<h3><%=prop.getProperty("activeVendor")%></h3>
											<button class="btn btn-primary" ng-click="vendorActive();"><%=prop.getProperty("activateVendor")%></button>
										</div>
									</div>
								</div>
								<div id="menu2" class="tab-pane fade in active">
								<div ng-if="pagedItems.length == 0 " style="text-align: center;">
									<h1><%=prop.getProperty("noDataFound")%></h1>
								</div>
								<div id="table1_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row be-datatable-body">
									<div class="col-sm-12 hotelTbls">
									<table class="table table-striped"  ng-if="pagedItems[currentPage].length > 0 ">
										<thead>
											<tr>
												<th><%=prop.getProperty("catrgory")%></th>
												<th><%=prop.getProperty("subCategory")%></th>
												<th><%=prop.getProperty("title")%></th>
												<th><%=prop.getProperty("webURL")%></th>
												<th><%=prop.getProperty("description")%></th>
												<th><%=prop.getProperty("action")%></th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="list in pagedItems[currentPage]">
												<td><span ng-bind="list.categoryName" ></span></td>
												<td><span ng-bind="list.subCategoryName" ></span></td>
												<td><span ng-bind="list.title" ></span></td>
												<td><span ng-bind="list.website"></span></td>
												<td><span ng-bind="list.description" ></span></td>
												<td> <a title="Remove"
													href="javascript:void(0)" ng-click="removeList(list.id);" data-toggle="modal"
													data-target="#myModal1"
													class="like"><i class="glyphicon glyphicon-remove"></i></a></td>
													<!-- Modal -->
														<div id="myModal1" class="modal fade" role="dialog">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal">&times;</button>
																		<h4 class="modal-title"><%=prop.getProperty("deleteList")%></h4>
																	</div>
																	<div class="modal-body">
																		<p><%=prop.getProperty("deleteMsg")%></p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-danger"
																			ng-click="deleteList();" data-dismiss="modal"><%=prop.getProperty("delete")%></button>
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal"><%=prop.getProperty("close")%></button>
																	</div>
																</div>
															</div>
														</div>
													<!-- // Modal -->
											</tr>
										</tbody>
										<tfoot>
										   <tr>
											<td colspan="6">
												<div class="pagination pull-right">
													<ul class="pagination">

														<li ng-class="{disabled: currentPage == 0}"><a href
															ng-click="prevPage()">&laquo; <%=prop.getProperty("prev")%></a></li>
														<li
															ng-repeat="n in range(pagedItems.length, currentPage, currentPage + gap) "
															ng-class="{active: n == currentPage}"
															ng-click="setPage()"><a href ng-bind="n + 1">1</a></li>
														<li
															ng-class="{disabled: (currentPage) == pagedItems.length - 1}"><a
															href ng-click="nextPage()"><%=prop.getProperty("next")%> &raquo;</a></li>
													</ul>
												</div>
											</td>
											</tr>
										</tfoot>
									</table>
									</div>
									</div>
									</div>
								</div>
								<!-- <div id="menu3" class="tab-pane fade">
								<div ng-if="pagedItems.length == 0 " style="text-align: center;">
									<h1>Opps! No data found :(</h1>
								</div>
									<table class="table table-striped table-hover"
										style="width: 95%;"  ng-if="pagedItems[currentPage].length > 0 ">
										<thead>
											<tr>
												<th>ID</th>
												<th>Title</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="ad in pagedItems[currentPage]">
												<td><span ng-bind="ad.id" ></span></td>
												<td><span ng-bind="ad.title" ></span></td>
												<td> <a title="Remove"
													href="javascript:void(0)" class="like" data-toggle="modal"
													data-target="#myModal" ng-click="removeAd(ad.id);"><i
														class="glyphicon glyphicon-remove"></i></a></td>
												Modal
												<div id="myModal" class="modal fade" role="dialog">
													<div class="modal-dialog">
														Modal content
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">Delete Ad</h4>
															</div>
															<div class="modal-body">
																<p>Do you want to delete ?</p>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-danger"
																	ng-click="deleteAd();" data-dismiss="modal">Delete</button>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>
													</div>
												</div>
												// Modal
											</tr>
										</tbody>
										<tfoot>
											<td colspan="6">
												<div class="pagination pull-right">
													<ul class="pagination">
														<li ng-class="{disabled: currentPage == 0}"><a href
															ng-click="prevPage()">&laquo; Prev</a></li>
														<li
															ng-repeat="n in range(pagedItems.length, currentPage, currentPage + gap) "
															ng-class="{active: n == currentPage}"
															ng-click="setPage()"><a href ng-bind="n + 1">1</a></li>
														<li
															ng-class="{disabled: (currentPage) == pagedItems.length - 1}"><a
															href ng-click="nextPage()">Next &raquo;</a></li>
													</ul>
												</div>
											</td>
										</tfoot>
									</table>
								</div> -->							
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
