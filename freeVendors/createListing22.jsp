<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
	ng-include="'front/header.jsp'"></nav>

<div id="content" class="ng-scope" ng-controller="freeVendorCtrl"
	ng-init="getCountries();getMainCategories();">
	<div class="bg-white">
		<div class="container">
			<div class="page-section">
				<div data-scrollable="" tabindex="1"
					style="overflow-y: hidden; outline: none;">

					<div class="form-section">
						<form id="contact-form" name="form" ng-submit="createListing();"
							enctype="multipart/form-data" novalidate>
							<div class="controls">
							<div class="row">
								<div class="col-md-12">
									<h2 class="text-center">Add Listing</h2>
								</div>
							</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("mainCategory")%> <span
												class="require">*</span></label>
											<div class="form-group">
												<select style="width: 100%;" data-toggle="select2"
													name="mainCategory" ng-model="listUser.mainCategory"
													required
													data-ng-change="getSubCategory(listUser.mainCategory);">
													<option>--- Select ---</option>
													<option ng-repeat="d in mainCategoriez"
														ng-value="d.mainCategoryId" ng-bind="d.categoryName"></option>
												</select> <span ng-show="mcategory" class="error"><%=prop.getProperty("selectMainCatrgory")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12 subCategory" style="display: none;">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("subCategory")%> <span
												class="require">*</span></label>
											<div class="form-group">
												<select style="width: 100%;" data-toggle="select2"
													ng-model="listUser.subCategory" ng-change="getSubCate();">
													<option ng-repeat="d in subCategoriez"
														ng-value="d.subCategoryId" ng-bind="d.subCategoryName"></option>
												</select> <span ng-show="scategory" class="error"><%=prop.getProperty("selectSubCatrgory")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_phone"><%=prop.getProperty("mainImg")%> <span
												class="require">*</span></label> <input type="file" name="file"
												id="file" accept="image/*" ng-model="listUser.file"
												onchange="angular.element(this).scope().uploadListMainImage(this.files)">
											<span ng-show="mImage" class="error"><%=prop.getProperty("selectMainImg")%></span>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("signupToday")%> <span
												class="require">*</span></label>
											<div class="form-group">
												<select style="width: 100%;" data-toggle="select2"
													name="listPlan" ng-model="listUser.listPlan"
													ng-change="getLstPlan();" required="required">
													<option value="0">--- Select ---</option>
													<option value="1"><%=prop.getProperty("free")%></option>
													<option value="30"><%=prop.getProperty("standard11")%></option>
													<option value="70"><%=prop.getProperty("standard33")%></option>
													<option value="1000"><%=prop.getProperty("featured11")%></option>
												</select> <span ng-show="listPlan" class="error"><%=prop.getProperty("selectListPlan")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("title")%> <span class="require">*</span></label>
											<div class="form-group">
												<input type="text" value="" ng-model="listUser.title"
													name="title" required="required" class="form-control" /> <span
													ng-show="form.title.$touched && form.title.$error.required"
													class="error"><%=prop.getProperty("validTitle")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("companyName")%> <span
												class="require">*</span></label>
											<div class="form-group">
												<input type="text" value="" ng-model="listUser.companyName"
													name="companyName" required="required" class="form-control" />
												<span
													ng-show="form.companyName.$touched && form.companyName.$error.required"
													class="error"><%=prop.getProperty("validCompany")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("contactPerson")%> <span
												class="require">*</span></label>
											<div class="form-group">
												<input type="text" value=""
													ng-model="listUser.contactPerson" name="contactPerson"
													required="required" class="form-control" /> <span
													ng-show="form.contactPerson.$touched && form.contactPerson.$error.required"
													class="error"><%=prop.getProperty("validContactPerson")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("address")%> <span class="require">*</span></label>
											<div class="form-group">
												<textarea name="address" ng-model="listUser.address"
													required="required" class="form-control"></textarea>
												<span
													ng-show="form.address.$touched && form.address.$error.required"
													class="error"><%=prop.getProperty("validAddress")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("city")%> <span class="require">*</span></label>
											<div class="form-group">
												<input type="text" value="" ng-model="listUser.city"
													name="city" required="required" class="form-control" /> <span
													ng-show="form.city.$touched && form.city.$error.required"
													class="error"><%=prop.getProperty("validCity")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("state")%> <span class="require">*</span></label>
											<div class="form-group">
												<input type="text" value="" ng-model="listUser.state"
													name="state" required="required" class="form-control" /> <span
													ng-show="form.state.$touched && form.state.$error.required"
													class="error"><%=prop.getProperty("validState")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("country")%> <span class="require">*</span></label>
											<div class="form-group">
												<select style="width: 100%;" data-toggle="select2"
													ng-model="listUser.countries"
													data-ng-options="item for item in countriez track by item"
													ng-change="chgCountry();">
												</select> <span ng-show="country" class="error"><%=prop.getProperty("validCountry")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("phone")%> <span class="require">*</span></label>
											<div class="form-group">
												<input type="text" value="" name="phone"
													ng-model="listUser.phone" required="required"
													class="form-control" /> <span
													ng-show="form.phone.$touched && form.phone.$error.required"
													class="error"><%=prop.getProperty("validPhone")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("fax")%></label>
											<div class="form-group">
												<input type="text" value="" name="fax"
													ng-model="listUser.fax" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("email")%> <span class="require">*</span></label>
											<div class="form-group">
												<input type="email" value="" name="email"
													ng-model="listUser.email" required="required"
													class="form-control" /> <span
													ng-show="form.email.$touched && form.email.$error.required"
													class="error"><%=prop.getProperty("enterEmail")%></span> <span
													ng-show="form.email.$touched && form.email.$error.email"
													class="error"><%=prop.getProperty("validEmail")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("website")%></label>
											<div class="form-group">
												<input type="url" value="" name="url"
													ng-model="listUser.website" class="form-control" /> <span
													class="error" ng-show="form.url.$error.url"><%=prop.getProperty("validWebsite")%></span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("description")%> <span
												class="require">*</span></label>
											<div class="form-group">
												<textarea name="description" ng-model="listUser.description"
													required="required" class="form-control"></textarea>
												<span
													ng-show="form.description.$touched && form.description.$error.required"
													class="error"><%=prop.getProperty("validDescription")%></span>
											</div>
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<input type="submit" ng-disabled="!form.$valid"
											class="btn btn-primary" value="<%=prop.getProperty("create")%>">
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
	<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
</footer>
<!-- // Footer -->