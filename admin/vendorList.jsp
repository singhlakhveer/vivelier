<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
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
<!-- Wrapper required for sidebar transitions -->
<div class="st-container" data-ng-controller="adminLoginCtrl"
	data-ng-init="adminProfile('<%=z%>');getAllVendors();"
>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"admin/header.jsp"'
	></nav>
	<!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"admin/sidebar.jsp"'
	></aside>
	<!-- sidebar effects OUTSIDE of st-pusher: -->
	<!-- st-effect-1, st-effect-2, st-effect-4, st-effect-5, st-effect-9, st-effect-10, st-effect-11, st-effect-12, st-effect-13 -->
	<!-- content push wrapper -->
	<div class="st-pusher">
		<!-- sidebar effects INSIDE of st-pusher: -->
		<!-- st-effect-3, st-effect-6, st-effect-7, st-effect-8, st-effect-14 -->
		<!-- this is the wrapper for the content -->
		<div class="st-content">
			<!-- extra div for emulating position:fixed of the menu -->
			<div class="st-content-inner " id="content" data-scrollable>
				<div class="panel-body">
					<div class="panel panel-default panel-table">
						<div class="container-fluid hotelTbls ">
							<h3 style="margin: 0 !important;"><%=prop.getProperty("vendorsList")%></h3>
							<div class="col-sm-12" style="margin-bottom: 20px;">
								<select class="pull-right" data-toggle="select2"
									style="width: 150px;" name="amount" ng-model="vendor.amount"
									data-ng-change="getPlan(vendor.amount);"
								>
									<!-- <option ng-repeat="vendor in vendorList" ng-value="vendor.amount"  ng-bind="vendor.amount"></option> -->
									<option value="All"><%=prop.getProperty("all")%></option>
									<option value="Free"><%=prop.getProperty("free")%></option>
									<option value="Basic"><%=prop.getProperty("basic")%></option>
									<option value="Pro"><%=prop.getProperty("pro")%></option>
									<option value="Preimum"><%=prop.getProperty("premium")%></option>
									<option value="Standard 1 Yr"><%=prop.getProperty("standard1")%></option>
									<option value="Standard 3 Yr"><%=prop.getProperty("standard3")%></option>
									<option value="Featured 1 Yr"><%=prop.getProperty("featured1")%></option>
								</select> <label class="pull-right"
									style="margin-right: 20px; margin-top: 5px;"
								><%=prop.getProperty("filterVendors")%> </label>
							</div>
							<div ng-if="vendorList.length == 0">
								<h1 style="text-align: center;"><%=prop.getProperty("noDataFound")%></h1>
							</div>
							<table class="table table-striped table-hover"
								ng-if="vendorList.length > 0"
							>
								<thead>
									<tr>
										<th><%=prop.getProperty("firstName")%></th>
										<th><%=prop.getProperty("lastName")%></th>
										<th><%=prop.getProperty("email")%></th>
										<th><%=prop.getProperty("phone")%></th>
										<th><%=prop.getProperty("vendorPlan")%></th>
										<th><%=prop.getProperty("status")%></th>
										<th><%=prop.getProperty("action")%></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="vendor in pagedItems[currentPage]">
										<td><span ng-bind="vendor.first_name"></span></td>
										<td><span ng-bind="vendor.last_name"></span></td>
										<td><span ng-bind="vendor.email"></span></td>
										<td><span ng-bind="vendor.phone"></span></td>
										<td><span ng-if="vendor.amount == 'Free List' "><%=prop.getProperty("free")%></span>
											<span ng-if="vendor.amount != 'Free List' "
											ng-bind="vendor.amount"
										></span></td>
										<td><span class="label label-primary"
											ng-if="vendor.status == 1 "
										><%=prop.getProperty("active")%></span> <span
											class="label label-danger" ng-if="vendor.status != 1 "
										><%=prop.getProperty("deactive")%></span></td>
										<td><a title="Edit" href="javascript:void(0)"
											ui-sref="admin.vendorDetail({id: vendor.id})" class="like"
										><i class="glyphicon glyphicon-pencil"></i></a> <a
											title="Deactive" href="javascript:void(0)"
											data-ng-click="vendorDeactive(vendor.id);" class="like"
										><i class="glyphicon glyphicon-remove"></i></a></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6">
											<div class="pagination pull-right">
												<ul class="pagination">
													<li ng-class="{disabled: currentPage == 0}"><a href
														ng-click="prevPage()"
													>&laquo; <%=prop.getProperty("prev")%></a></li>
													<li
														ng-repeat="n in range(pagedItems.length, currentPage, currentPage + gap) "
														ng-class="{active: n == currentPage}" ng-click="setPage()"
													><a href ng-bind="n + 1">1</a></li>
													<li
														ng-class="{disabled: (currentPage) == pagedItems.length - 1}"
													><a href ng-click="nextPage()"><%=prop.getProperty("next")%>
															&raquo;</a></li>
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