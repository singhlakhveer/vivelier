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
	String z = (String) request.getSession().getAttribute("vmail");
	if (z == null) {
		out.print("<script>window.location.href = 'login'</script>");
	} else {
		String plan = (String) request.getSession().getAttribute("vPlan");
		 if (!plan.equals("Basic") && !plan.equals("Pro") && !plan.equals("Preimum")) {
			out.print("<script>window.location.href = 'vendor/401'</script>");
		} 
	}
%>
<div class="st-container" data-ng-controller="vendorCtrl"
	data-ng-init="vendorProfile('<%=z%>');countHotels();hotelList();">

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
					<div class="panel panel-default panel-table">
						<div class="panel-body">
							<div class="col-sm-12 hotelTbls">
								<%-- <button title="You only 50 records exported"
									ng-click="exportSearchHotels();" class="btn btn-primary"><%=prop.getProperty("exportHotels")%></button> --%>
								<div class="pull-right">
									<label><%=prop.getProperty("search")%></label> <input trype="text" class="form-control"
										ng-model="vsearch" ng-keyup="searchHotel();" />
								</div>
								<div id="table1_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row be-datatable-body">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th><%=prop.getProperty("hotelName")%></th>
											<th><%=prop.getProperty("website")%></th>
											<th><%=prop.getProperty("phone")%></th>
											<th><%=prop.getProperty("address")%></th>
											<th><%=prop.getProperty("city")%></th>
											<th><%=prop.getProperty("country")%></th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="hotel in hotelsList" style="cursor: pointer;"
											ng-click="hotelsDetail(this);">
											<td><span ng-bind="hotel.hotelName" ></span></td>
											<td><span ng-bind="hotel.website" ></span></td>
											<td><span ng-bind="hotel.telephone1" ></span></td>
											<td><span ng-bind="hotel.address" ></span></td>
											<td><span ng-bind="hotel.city" ></span></td>
											<td><span ng-bind="hotel.country" ></span></td>
										</tr>
									</tbody>
								</table>
								<ul class="pagination pull-right">
									<li class="pgn pagination" ng-repeat="pgn in pagination">
										<a href="#" ng-click="pageNo(this);" ng-model="page_No"
										ng-bind="pgn"></a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /st-content-inner -->
	</div>>
<!-- /st-pusher -->

<!-- Footer -->
<footer class="footer">
	<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
</footer>
<!-- // Footer -->
</div>