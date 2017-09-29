
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
<style>
.page-section {
	padding: 50px 0 0;
}
</style>
<%
	String z = (String) request.getSession().getAttribute("vmail");
%>
<div class="st-container" data-ng-controller="vendorCtrl"
	style="padding-top: 0;"
	data-ng-init="vendorProfile('<%=z%>');singleAd();">

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
							<form novalidate ng-submit="updateAd()" name="form"
								enctype="multipart/form-data">
								<div class="col-sm-8 col-sm-offset-2">
									<div ng-show="suc" class="alert alert-success center">
										<a href="#" class="close" data-dismiss="alert"
											aria-label="close">&times;</a> Your Ad is <strong>
											Successfully updated. </strong>
									</div>

									<div class="col-sm-12">
										<div class="form-group">
											<input type="hidden" placeholder="title" ng-model="ad.id"
												class="form-control"> <label
												class="col-sm-3 control-label" for="inputEmail3">Title</label>
											<div class="col-sm-9">
												<input type="text" placeholder="title" name="title"
													id="inputEmail3" ng-model="ad.title" required
													class="form-control"> <span class="error"
													ng-show="form.title.$touched && form.title.$error.required">Please
													enter title</span>
											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<br> <label class="col-sm-3 control-label"
												for="inputEmail3">Description</label>
											<div class="col-sm-9">
												<textarea ng-model="ad.description" name="description"
													placeholder="Please enter ad description"
													class="form-control" required></textarea>
												<span class="error"
													ng-show="form.description.$touched && form.description.$error.required">Please
													enter description</span>
											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<br> <label class="col-sm-3 control-label"
												for="inputEmail3">Features</label>
											<div class="col-sm-9">
												<!-- Feature list -->
												<div class="form-group input-group"
													ng-repeat="f in featureList1">
													<input class="form-control dd" ng-value="f.value"
														name="features" type="text"> <span
														class="input-group-btn">
														<button class="btn btn-primary"
															ng-click="removeFeatureList1($index);" type="button"
															title="Remove">
															<i class="fa fa-close"></i>
														</button>
													</span>
												</div>
												<div class="form-group input-group"
													ng-repeat="f in featureList">
													<input class="form-control dd" ng-value="f" name="features"
														type="text"> <span class="input-group-btn">
														<button class="btn btn-primary"
															ng-click="removeFeatureList($index);" type="button"
															title="Remove">
															<i class="fa fa-close"></i>
														</button>
													</span>
												</div>
												<!-- // Feature list End -->
												<div class="form-group input-group">
													<input class="form-control" placeholder="Add New Feature"
														ng-model="ad.feature" type="text"> <span
														class="input-group-btn">
														<button ng-click="addFeatureList()"
															class="btn btn-primary" type="button">
															<i class="fa fa-plus"></i>
														</button>
													</span>
												</div>
												<span class="error" ng-show="error">Please Enter
													feature.</span>
											</div>
										</div>
									</div>
									<div class="col-sm-12 button-margin">
										<div class="form-group">
											<br> <label class="col-sm-3 control-label"
												for="inputEmail3"></label>
											<div class="col-sm-9">
												<input type="submit" value="Update Ad"
													ng-disabled="!form.$valid" class="btn btn-primary" />
											</div>
										</div>
									</div>
									<br> <br>
								</div>
							</form>
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

