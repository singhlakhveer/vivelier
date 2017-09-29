<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String z = (String) request.getSession().getAttribute("vmail");
	if (z == null) {
		out.print("<script>window.location.href = 'login';</script>");
	}
%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>

<div class="container-fluid" ng-controller="vendorCtrl" ng-init="profile('<%=z%>');">
	<div class="navbar-header">
		<a href="#sidebar-menu" data-toggle="sidebar-menu"
			class="toggle pull-left visible-xs"><i class="fa fa-bars"></i></a>
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#main-nav">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<a class="navbar-brand dashboard-top-title" ui-sref="vendor.dashboard"><i
			class="md fa-fw md-home text-primary"></i> <%=prop.getProperty("page_title")%></a>
	</div>
	
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="main-nav">
		<ul class="nav navbar-nav navbar-right">
			<!-- key word search -->
				<li class="searchKeyWord" ng-show="vendor.amount == 'Standard 1 Yr' || vendor.amount == 'Standard 3 Yr' || vendor.amount == 'Featured 1 Yr' || vendor.amount == 'Free List'">
					<div>
						  <form ng-submit="keywordSearch();" name="form">
					        <div class="input-group">
								    <input type="text" list="keyword" name="keyword" ng-model="keyword" ng-keyup="getKeywords()" class="form-control" 
								    placeholder="search keywords for listing" autocomplete="off">
									  <datalist id="keyword">
									</datalist>
								 <div class="input-group-btn">
						        	<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
						    	</div>
							</div>
						</form>
					</div>	
				 </li>
			<!-- user -->
			<li class="dropdown user"><a href="#" class="dropdown-toggle"
				ng-bind-html="customHtml" data-toggle="dropdown"> </a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#" ui-sref="vendor.profile"><i
							class="fa fa-user"></i><%=prop.getProperty("profile")%> </a></li>
					<li><a href="#" ui-sref="vendor.settings"><i
							class="fa fa-wrench"></i><%=prop.getProperty("setting")%></a></li>
					<li><a href="#" ng-click="logout();"><i
							class="fa fa-sign-out"></i><%=prop.getProperty("logout")%></a></li>
				</ul></li>
			<!-- // END user -->
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- <div id="img" style="width: 20%; margin: 0 auto; display: none;">
	<img src="images/load.gif" />
</div> -->