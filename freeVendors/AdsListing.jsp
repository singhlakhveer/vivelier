
<%
	String plan = (String) request.getSession().getAttribute("vPlan");
	if (!plan.equals("Free")) {
%>
<script>
	$(document).ready(function() {
		window.location.href = "vendor/401";
	});
</script>
<%
	}
%>
<!-- Wrapper required for sidebar transitions -->

<%
	String z = (String) request.getSession().getAttribute("vmail");
%>
<div class="st-container" data-ng-controller="vendorCtrl"
	style="padding-top: 0;"
	data-ng-init="vendorProfile('<%=z%>');getAds('<%=z%>');">
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"vendor/header.jsp"'></nav>

	<!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"vendor/sidebar.jsp"'
		style="display: block; position: fixed !important;"></aside>
	<!-- content push wrapper -->
	<div class="st-pusher">
		<div class="st-content">
			<!-- extra div for emulating position:fixed of the menu -->
			<div class="st-content-inner" id="content" data-scrollable
				data-ng-init="vendorProfile">
				<div class="container-fluid">
					<div class="page-section">
						<div class="row margin-bottom">
							<div class="row margin-bottom">
								<div ng-if="pagedItems.length == 0" style="text-align: center;"
									class="col-sm-12" id="adList">
									<h1>Opps! No data found :(</h1>
								</div>
								<div ng-if="pagedItems.length > 0" class="col-sm-12" id="adList">
									<div ng-show="suc" class="alert alert-success center"
										style="margin-top: 20px;">
										<a href="#" class="close" data-dismiss="alert"
											aria-label="close">&times;</a> Your Ad is <strong>
											Successfully deleted. </strong>
									</div>
									<h1 class="col-sm-12 col-sm-offset-2">Your Ad's</h1>
									<table class="table table-striped table-hover col-sm-offset-2"
										style="width: 85%;">
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
												<td><a title="Edit" href="javascript:void(0)"
													ng-click="getADbyId(ad.id);" class="like"><i
														class="glyphicon glyphicon-pencil"></i></a> <a title="Remove"
													href="javascript:void(0)" class="like" data-toggle="modal"
													data-target="#myModal" ng-click="removeAd(ad.id);"><i
														class="glyphicon glyphicon-remove"></i></a></td>
												<!-- Modal -->
												<div id="myModal" class="modal fade" role="dialog">
													<div class="modal-dialog">
														<!-- Modal content-->
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">Delete Ad</h4>
															</div>
															<div class="modal-body">
																<p>Do you want to delete ?</p>
																</span>
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
												<!-- // Modal -->
											</tr>
										</tbody>
										<tfoot>
											<td colspan="6">
												<div class="pagination pull-right">
													<ul class="pagination">
														<li ng-class="{disabled: currentPage == 0}"><a href
															ng-click="prevPage()">« Prev</a></li>
														<li
															ng-repeat="n in range(pagedItems.length, currentPage, currentPage + gap) "
															ng-class="{active: n == currentPage}"
															ng-click="setPage()"><a href ng-bind="n + 1">1</a></li>
														<li
															ng-class="{disabled: (currentPage) == pagedItems.length - 1}"><a
															href ng-click="nextPage()">Next »</a></li>
													</ul>
												</div>
											</td>
										</tfoot>
									</table>
								</div>
							</div>
							<!-- /row -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /st-pusher -->
	</div>
	<!-- Footer -->
	<footer class="footer">
		<strong>Global Hotels Directory</strong> &copy;2015
	</footer>
	<!-- // Footer -->
</div>
