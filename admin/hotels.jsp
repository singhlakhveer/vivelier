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
	data-ng-init="adminProfile('<%=z%>'); hotelList();countHotels();">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"admin/header.jsp"'></nav>
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"admin/sidebar.jsp"'>
	</aside>
	<div class="st-pusher">
		<div class="st-content">
			<div class="st-content-inner" id="content" data-scrollable>
				<div class="container-fluid">
					<button data-ng-click="addHotel();"
						class="btn btn-primary pull-right"
						style="margin-top: 9px; margin-right: 30px;"><%=prop.getProperty("addNewHotel")%></button>
					<h3><%=prop.getProperty("listOfHotels")%></h3>
					<br>
					<div class="panel panel-default panel-table">
						<div class="panel-body">
							<div id="table1_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row be-datatable-body">
									<div class="col-sm-12 hotelTbls">
										<div class="pull-right">
											<label><%=prop.getProperty("search")%></label> <input trype="text"
												class="form-control" ng-model="search"
												ng-keyup="searchHotel();" />
										</div>
										<table class="table table-striped table-hover">
											<thead>
												<tr>
													<th><%=prop.getProperty("hotelName")%></th>
													<th><%=prop.getProperty("website")%></th>
													<th><%=prop.getProperty("phone")%></th>
													<th><%=prop.getProperty("address")%></th>
													<th><%=prop.getProperty("country")%></th>
													<th><%=prop.getProperty("action")%></th>
												</tr>
											</thead>
											<tr ng-repeat="hotel in hotelsList">
												<td><span ng-bind="hotel.hotelName" ></span></td>
												<td><span ng-bind="hotel.website" ></span></td>
												<td><span ng-bind="hotel.telephone1" ></span></td>
												<td><span ng-bind="hotel.address" ></span></td>
												<td><span ng-bind="hotel.country" ></span></td>
												<td><a title="Edit" href="javascript:void(0)"
													ui-sref="admin.detailHotel({id: hotel.id})" class="like"><i
														class="glyphicon glyphicon-pencil"></i></a>
														<a title="Edit" href="javascript:void(0)"
														data-toggle="modal" data-target="#myModal"
													data-ng-click="deleteHotel(hotel.id);" class="like"><i
														class="glyphicon glyphicon-remove"></i></a></td>
														<!-- Modal -->
														<div id="myModal" class="modal fade" role="dialog">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">Delete this Hotel</h4>
																	</div>
																	<div class="modal-body">
																		<p>Do you want to delete ?</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-danger"
																			ng-click="deleteHotelById();" data-dismiss="modal">Delete</button>
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div>
											</tr>
										</table>
										<div class="pull-right">
											<ul class="pagination pull-right">
												<li ng-repeat="pgn in pagination"><a href="#"
													ng-click="pageNo(this);" ng-model="page_No" ng-bind="pgn"></a>
													<!-- <button ng-click="pageNo(this);" ng-model="page_No" ng-bind="pgn" class="btn btn-primary" /> -->
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