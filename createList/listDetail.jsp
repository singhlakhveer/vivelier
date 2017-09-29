<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<% String z = (String) request.getSession().getAttribute("vmail");
	if (z == null) {
		out.print("<script>window.location.href = 'login'</script>");
	} else {
		String plan = (String) request.getSession().getAttribute("vPlan");
		 if (!plan.equals("Standard 1 Yr") && !plan.equals("Standard 3 Yr") && !plan.equals("Featured 1 Yr") && !plan.equals("Free List")) {
			out.print("<script>window.location.href = 'vendor/401'</script>");
		} 
	}
%>
<style>
.imgHotel img {
	width: 100%;
}
.hotelDetail {
	margin-top: 20px;
}
</style>
<div class="st-container" data-ng-controller="vendorCtrl"
	data-ng-init="vendorProfile('<%=z%>'); listDetail();">
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
				<div class="container-fluid">
						<div class="row hotelDetail col-sm-offset-1">
							<div class="col-md-4 imgHotel" >
									<div ng-bind-html="img"></div>
								</div>
							<div class="col-md-6">
								<div class="panel panel-default panel-table">
									<div class="panel-body">
										<div class="detail">
											<h2 ng-bind="h.title"></h2> <div id="rating"></div>
											<span ng-bind="h.address"></span><br>
											<i ng-bind="h.city"></i>, <i ng-bind="h.state"></i>, <i ng-bind="h.country"></i><br>
											<span><%=prop.getProperty("website")%> : </span><i ng-bind-html="website"></i> <br>
											<span><%=prop.getProperty("phone")%> : </span> <i ng-bind="h.phone"></i><br>
											<span><%=prop.getProperty("email")%> : </span> <i ng-bind-html="email1"></i> 
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row col-sm-offset-1" ng-if="h.description != '' ">
							<div class="col-md-10">
								<div class="panel panel-default panel-table">
									<div class="panel-body">
										<p ng-bind="h.description"></p>
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