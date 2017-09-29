<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@page import="java.util.Properties"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<%
	String z = (String) request.getSession().getAttribute("vmail");
	if(z == null){
		out.print("<script>window.location.href = 'login'</script>");
	} else {
		String plan = (String) request.getSession().getAttribute("vPlan");
		 if (!plan.equals("Standard 1 Yr") && !plan.equals("Standard 3 Yr") && !plan.equals("Free List") ) {
			out.print("<script>window.location.href = 'vendor/401'</script>");
		} 
	}
%>
<div class="st-container" data-ng-controller="vendorCtrl"
	data-ng-init="vendorProfile('<%=z%>');getAllListing('<%=z%>');">
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
							<div id="table1_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row be-datatable-body">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th><%=prop.getProperty("catrgory")%></th>
									<th><%=prop.getProperty("subCategory")%></th>
									<th><%=prop.getProperty("title")%></th>
									<th><%=prop.getProperty("url")%></th>
									<%-- <th class="hidden-xs"><%=prop.getProperty("description")%></th> --%>
									<th><%=prop.getProperty("action")%></th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="list in pagedItems[currentPage]">
									<td><span ng-bind="list.categoryName" ></span></td>
									<td><span ng-bind="list.subCategoryName" ></span></td>
									<td><span ng-bind="list.title" ></span></td>
									<td><span ng-bind="list.website" ></span></td>
									<!-- <td class="hidden-xs"><span ng-bind="list.description" ></span></td> -->
									<td><!-- ng-click="listEdit(list.id);" -->
									<a title="Edit" ui-sref="vlisting.lstEdit({id: list.id})"
										 class="like"><i
											class="glyphicon glyphicon-pencil"></i></a><a title="Remove"
										href="javascript:void(0)" ng-click="removeList(list.id);"
										data-toggle="modal" data-target="#myModal" class="like"><i
											class="glyphicon glyphicon-remove"></i></a></td>
									<!-- Modal -->
									<div id="myModal" class="modal fade" role="dialog">
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