<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
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

<%
	Properties prop = propertyConfig.getLangProperties(request, response);
%>
<div class="st-container" data-ng-controller="vendorCtrl"
	data-ng-init="vendorProfile('<%=z%>');">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"vendor/header.jsp"'></nav>
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"vendor/sidebar.jsp"'>
	</aside>

	<div class="st-pusher">

		<div class="st-content">
			<div class="st-content-inner" id="content" data-scrollable
				data-ng-init="vendorProfile">
				<div class="container-fluid"><br>
					<%-- <h1><%=prop.getProperty("advanceSearch")%></h1> --%>
					<div class="panel panel-default panel-table">
						<div class="panel-body">
							<div class="alert alert-danger alert-dismissable fade in" ng-show="exporthotels">
							    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							    <strong>Please</strong> checked to export hotels.
							</div>
							<form ng-submit="advanceSearch();"
								enctype="application/x-www-form-urlencoded">
								<div class="col-sm-12">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="control-label"><%=prop.getProperty("hotelName")%></label>
											<div class="">
												<input placeholder="Hotel Name" name="hotelName"
													autocomplete="off" class="form-control"
													ng-model="advancesearch.hotelName" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="control-label"><%=prop.getProperty("city")%></label>
											<div class="">
												<input placeholder="City Name" name="city"
													autocomplete="off" class="form-control"
													ng-model="advancesearch.city" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="control-label"><%=prop.getProperty("state")%></label>
											<div class="">
												<input placeholder="State Name" name="state"
													autocomplete="off" class="form-control"
													ng-model="advancesearch.state" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="control-label"><%=prop.getProperty("country")%></label>
											<div class="">
												<input placeholder="Country Name" name="country"
													autocomplete="off" class="form-control"
													ng-model="advancesearch.country" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="control-label"><%=prop.getProperty("zip")%></label>
											<div class="">
												<input placeholder="Zip Code" name="zip"
													autocomplete="off" class="form-control"
													ng-model="advancesearch.zip" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="control-label">Rating</label>
											<div class="">
												<select name="rating" ng-model="advancesearch.rating"
												 class="form-control">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>
											</div><br>
											<input type="submit" class="btn btn-primary pull-right" value="Search">
										</div>
									</div>
								</div>
							</form>
							<br>
							<div id="table1_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap no-footer planData">
								<div class="row be-datatable-body">
									<div ng-if="pagedItems.length == 0" style="text-align: center;">
										<%=prop.getProperty("noDataFound")%>
									</div>
									<div class="col-sm-12 hotelTbls" ng-if="pagedItems.length > 0">
										<%-- <div class="pull-right" style="margin-bottom: 10px;">
									<label><%=prop.getProperty("search")%></label> <input
										type="text" ng-model="searchData"
										class="form-control advance-search" />
								</div> --%>
										<button ng-click="exportSearchHotels();"
											class="btn btn-primary">Export Hotels</button>
										<table class="table table-striped table-condensed table-hover">
											<thead>
												<tr>
													<th style="width: 40px !important;"><input
														type="checkbox" onclick="toggleChecked(this.checked)" />
													</th>
													<th><%=prop.getProperty("hotelName")%></th>
													<th><%=prop.getProperty("website")%></th>
													<th><%=prop.getProperty("phone")%></th>
													<th><%=prop.getProperty("address")%></th>
													<th><%=prop.getProperty("city")%></th>
													<th><%=prop.getProperty("country")%></th>
												</tr>
											</thead>
											<tbody>
												<tr
													ng-repeat="hotel in pagedItems[currentPage] | filter : searchData"
													style="cursor: pointer;">
													<td><input type="checkbox" class="checkbox" name="id[]"
														id="hotelId" ng-value="hotel.id"></td>
													<td ng-click="hotelsDetail(this);"><span
														ng-bind="hotel.hotelName"></span></td>
													<td ng-click="hotelsDetail(this);"><span
														ng-bind="hotel.website"></span></td>
													<td ng-click="hotelsDetail(this);"><span
														ng-bind="hotel.telephone1"></span></td>
													<td ng-click="hotelsDetail(this);"><span
														ng-bind="hotel.address"></span></td>
													<td ng-click="hotelsDetail(this);"><span
														ng-bind="hotel.city"></span></td>
													<td ng-click="hotelsDetail(this);"><span
														ng-bind="hotel.country"></span></td>
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
																href ng-click="nextPage()"><%=prop.getProperty("next")%>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
	</footer>
</div>