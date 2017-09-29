<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.Properties"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
%>
<%
String z = (String) request.getSession().getAttribute("email");
	if (z == null) {
		out.print("<script>window.location.href = 'admin/login'</script>");
	}
%>
<div class="st-container" data-ng-controller="adminLoginCtrl"
	data-ng-init="adminProfile('<%=z%>');allContactUsList();">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"admin/header.jsp"'></nav>
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"admin/sidebar.jsp"'>
	</aside>
	<div class="st-pusher">
		<div class="st-content">
			<!-- extra div for emulating position:fixed of the menu -->
			<div class="st-content-inner" id="content" data-scrollable
				data-ng-init="vendorProfile">
				<div class="container-fluid">
					<div class="panel panel-default panel-table"  ng-if="pagedItems.length > 0">
						<div class="panel-body">
							<div class="col-sm-12 hotelTbls">
								<div id="table1_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap no-footer">
									<div class="row be-datatable-body">
										<table class="table table-striped table-hover">
											<thead>
												<tr>
													<th>First Name</th>
													<th>Last Name</th>
													<th>Email</th>
													<th>Message</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<tr ng-repeat="cu in pagedItems[currentPage]">
													<td><span ng-bind="cu.firstName"></span></td>
													<td><span ng-bind="cu.lastName"></span></td>
													<td><span ng-bind="cu.email"></span></td>
													<td><span ng-bind="cu.message"></span></td>
													<td><a href="" ng-click="deleteContact(cu.id)" data-toggle="modal" data-target="#myModal1" title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i>
													</a></td>
													<!-- Modal -->
														<div id="myModal1" class="modal fade" role="dialog">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal">&times;</button>
																		<h4 class="modal-title"><%=prop.getProperty("deleteContactUs")%></h4>
																	</div>
																	<div class="modal-body">
																		<p><%=prop.getProperty("deleteMsg")%></p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-danger"
																			ng-click="confirmDeleteContact();" data-dismiss="modal"><%=prop.getProperty("delete")%></button>
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
																ng-class="{active: n == currentPage}" ng-click="setPage()"><a
																href ng-bind="n + 1">1</a></li>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
	</footer>
</div>