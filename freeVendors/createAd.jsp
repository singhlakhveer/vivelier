
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
	data-ng-init="vendorProfile('<%=z%>');getAds();">

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
							<form novalidate ng-submit="createAd()" name="form"
								enctype="multipart/form-data">
								<div class="col-sm-8 col-sm-offset-2">
									<h1>Create New Ad.</h1>

									<div class="col-sm-12">
										<input type="hidden" placeholder="title" name="id"
											id="inputEmail3" ng-model="vendor.email" required
											class="form-control">
										<div class="form-group">
											<label class="col-sm-3 control-label" for="inputEmail3">Title
												<span class="error">*</span>
											</label>
											<div class="col-sm-9">
												<input type="text" placeholder="title" name="title"
													id="inputEmail3" ng-model="ad.title" required
													class="form-control">
											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<br> <label class="col-sm-3 control-label"
												for="inputEmail3">Description <span class="error">*</span></label>
											<div class="col-sm-9">
												<textarea ng-model="ad.description" name="description"
													placeholder="Please enter ad description"
													class="form-control" required></textarea>

											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<br> <label class="col-sm-3 control-label"
												for="inputEmail3">Features <span class="error">*</span></label>
											<div class="col-sm-9">
												<!-- Feature list -->
												<div class="form-group input-group"
													ng-repeat="f in featureList">
													<input class="form-control dd" ng-value="f" id="list"
														name="features" type="text" disabled="disabled"> <span
														class="input-group-btn">
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
									<div class="col-sm-12">
										<div class="form-group">
											<br> <label class="col-sm-3 control-label"
												for="inputEmail3">Image <span class="error">*</span></label>
											<div class="col-sm-9">
												<input type="file" ng-model="ad.images" class="form-cintrol"
													id="file" name="image" ng-model="ad.img"
													onchange="angular.element(this).scope().uploadAdImage(this.files)" />
												<span class="error" ng-show="error">Please select ad
													image.</span>
											</div>
										</div>
									</div>
									<div class="col-sm-12 button-margin">
										<div class="form-group">
											<br> <label class="col-sm-3 control-label"
												for="inputEmail3"></label>
											<div class="col-sm-9">
												<input type="submit" value="Create Ad"
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

