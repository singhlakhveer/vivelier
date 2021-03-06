<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<%
	String z = (String) request.getSession().getAttribute("vmail");
	if (z == null) {
		out.print("<script>window.location.href = 'login'</script>");
	} else {
		String plan = (String) request.getSession().getAttribute("vPlan");
		if (!plan.equals("Standard 1 Yr") && !plan.equals("Standard 3 Yr") && !plan.equals("Free List") ) {
			out.print("<script>window.location.href = 'vendor/401'</script>");
		} 
	}
%>
<div class="st-container" data-ng-controller="vendorCtrl"
	data-ng-init="vendorProfile('<%=z%>');getMainCategories();editList();">
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
					<div class="row">
						<div class="col-md-7" ng-show="suc">
							<div class="alert alert-success">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> <%=prop.getProperty("lstUpdateMsg")%>
							</div>
						</div>
						<div class="col-sm-12">
							<br>
							<button ui-sref="vlisting.listing"
								class="btn btn-primary pull-right">
								<i class="fa fa-list"></i> <%=prop.getProperty("listing")%>
							</button>
							<br>
						</div>
						<div class="col-sm-9">
							<form name="form" ng-submit="updateList();" novalidate>
								<div class="col-sm-10">
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("mainCategory")%>
											<span class="error">*</span>
										</label>
										<div class="col-sm-8">
											<input type="hidden" ng-model="list.id" /> <select
												style="width: 100%;" data-toggle="select2" 
												name="categoryName" ng-model="list.categoryName"
												required="required"
												data-ng-change="getSubCategory(list.categoryName);">
												<option>--- Select ---</option>
												<option ng-repeat="d in mainCategoriez"
													ng-value="d.categoryName" ng-bind="d.categoryName"></option>
											</select> <span class="error" ng-show="error"><%=prop.getProperty("selectMainCatrgory")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10 subCategory" style="display: none;">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("subCategory")%> <span class="error">*</span>
										</label>
										<div class="col-sm-8">
											<select style="width: 100%;" data-toggle="select2"
												required="required" ng-model="list.subCategory"
												ng-change="getSubCate();">
												<option ng-repeat="d in subCategoriez"
													ng-value="d.subCategoryId" ng-bind="d.subCategoryName"></option>
											</select> <span class="error" ng-show="error"><%=prop.getProperty("selectSubCatrgory")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("title")%> <span
											class="error">*</span></label>
										<div class="col-sm-8">
											<input type="text" ng-model="list.title" name="title" autocomplete="off"
												class="form-control" /> <span class="error"
												ng-show="form.title.$touched && form.title.$error.required"><%=prop.getProperty("validTitle")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("address")%> <span
											class="error">*</span></label>
										<div class="col-sm-8">
											<input type="text" ng-model="list.address" name="address" autocomplete="off"
												class="form-control" /> <span class="error"
												ng-show="form.address.$touched && form.address.$error.required"><%=prop.getProperty("validAddress")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("city")%> <span
											class="error">*</span></label>
										<div class="col-sm-8">
											<input type="text" ng-model="list.city" name="city" autocomplete="off"
												class="form-control" /> <span class="error"
												ng-show="form.city.$touched && form.city.$error.required"><%=prop.getProperty("validCity")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("state")%> <span
											class="error">*</span></label>
										<div class="col-sm-8">
											<input type="text" ng-model="list.state" name="state" autocomplete="off"
												class="form-control" /> <span class="error"
												ng-show="form.state.$touched && form.state.$error.required"><%=prop.getProperty("validState")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("country")%> <span
											class="error">*</span></label>
										<div class="col-sm-8">
											<input type="text" ng-model="list.country" name="country" autocomplete="off"
												class="form-control" /> <span class="error"
												ng-show="form.country.$touched && form.country.$error.required"><%=prop.getProperty("validCountry")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("webURL")%>  <span
											class="error">*</span></label>
										<div class="col-sm-8">
											<input type="text" name="url" ng-model="list.website" autocomplete="off"
												class="form-control" required="required" /> <span
												class="error"
												ng-show="form.url.$touched && form.url.$error.required"><%=prop.getProperty("validWebsite")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"><%=prop.getProperty("description")%> <span
											class="error">*</span></label>
										<div class="col-sm-8">
											<textarea name="description" ng-model="list.description"
												class="form-control" required="required"></textarea>
											<span class="error"
												ng-show="form.description.$touched && form.description.$error.required"><%=prop.getProperty("validDescription")%></span>
										</div>
									</div>
								</div>
								<div class="col-sm-10">
									<br>
									<div class="form-group">
										<label class="col-sm-3 control-label"></label>
										<div class="col-sm-8">
											<input type="submit" value="<%=prop.getProperty("listUpdate")%>"
												ng-disabled="!form.$valid" class="btn btn-primary" />
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="col-sm-2">
							<br>
							<div class="col-sm-12">
								<div class="form-group">
									<div id="listimg">
										<script id="some-template" type="text/x-handlebars-template">
										{{#users}}
											<img src="images/vendor/listing/{{mainImage}}"  height="250px" width="250px" >
										{{/users}}	
									</script>
									</div>
									<form ng-submit="updateCoverImage();" novalidate>
										<input type="hidden" ng-model="list.id" /> <br> <input
											type="file" name="file" id="file"
											onchange="angular.element(this).scope().uploadListcoverImage(this.files)">
										<span class="error" ng-show="coverImage"><%=prop.getProperty("validCoverImg")%></span> <br>
										<button class="btn btn-primary"><%=prop.getProperty("coverImg")%></button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /st-content-inner -->
<!-- /st-content -->
<!-- /st-pusher -->
<!-- Footer -->
<footer class="footer">
	<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
</footer>
<!-- // Footer -->
</div>