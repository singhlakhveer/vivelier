<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
	ng-include="'front/header.jsp'"></nav>

<div id="content" class="ng-scope" ng-controller="freeVendorCtrl">
	<div class="bg-white">
		<div class="container">
			<div class="page-section">
				<div data-scrollable="" tabindex="1"
					style="overflow-y: hidden; outline: none;">

					<div class="form-section">
						<form id="contact-form" name="form" ng-submit="freeSignup();"
							novalidate>
							<div class="controls">

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_name">First Name <span class="error">*</span></label>
											<input id="form_name" type="text" name="firstName"
												ng-model="user1.firstName" class="form-control" required
												placeholder="Please enter your firstname *"> <span
												class="error"
												ng-show="form.firstName.$touched && form.firstName.$error.required">Please
												Enter Your First Name.</span>

										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_lastname">Last Name <span
												class="error">*</span></label> <input id="form_lastname" type="text"
												name="lastName" ng-model="user1.lastName"
												class="form-control" required
												placeholder="Please enter your lastname *"> <span
												class="error"
												ng-show="form.lastName.$touched && form.lastName.$error.required">Please
												Enter Your Last Name.</span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email">Email <span class="error">*</span></label>
											<input id="form_email" type="email" name="email"
												class="form-control" placeholder="Please enter your email *"
												ng-model="user1.email" required="required"> <span
												class="error"
												ng-show="form.email.$touched && form.email.$error.required">Please
												Enter Your E-mail.</span> <span class="error"
												ng-show="form.email.$touched && form.email.$error.email">Please
												Enter Valid E-mail.</span>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_phone">Phone <span class="error">*</span></label>
											<input id="form_phone" type="tel" name="phone"
												class="form-control" required ng-model="user1.phone"
												placeholder="Please enter your phone *"> <span
												class="error"
												ng-show="form.phone.$touched && form.phone.$error.required">Please
												Enter Your Phone Number.</span>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_phone">Address <span class="error">*</span></label>
											<textarea class="form-control" ng-model="user1.address"
												name="address" required
												placeholder="Please enter your address *"></textarea>
											<span class="error"
												ng-show="form.address.$touched && form.address.$error.required">Please
												Enter Your Address.</span>
										</div>
									</div>

								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<input type="submit" class="btn btn-primary"
											ng-disabled="!form.$valid" value="Sign Up">
									</div>
								</div>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>


	<section class="footer-section" ng-include='"front/footer.jsp"'>
	</section>

</div>
<!-- // END #content -->

<!-- Footer -->
<footer class="footer">
	<strong>Global Hotels Directory</strong> &copy;2015
</footer>
<!-- // Footer -->