<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
	Properties seo = propertyConfig.getSEOProperty();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description" content="<%=prop.getProperty("cl.title")%>">
<meta name="keywords" content="<%=prop.getProperty("cl.title")%>">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=seo.getProperty("cl.title")%></title>

<!-- Bootstrap -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet"> -->
</head>
<body>
	<div ng-controller="freeVendorCtrl" ng-init="getCountries();getMainCategories();">
		<jsp:include page="/front/header.jsp"></jsp:include>
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
														ng-value="d.categoryName" ng-bind="d.categoryName"></option>
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
												<input type="text" value="" ng-model="listUser.title" autocomplete="off"
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
												<input type="text" value="" ng-model="listUser.companyName" autocomplete="off"
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
												<input type="text" value="" autocomplete="off"
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
												<textarea name="address" ng-model="listUser.address" autocomplete="off"
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
												<input type="text" value="" ng-model="listUser.city" autocomplete="off"
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
												<input type="text" value="" ng-model="listUser.state" autocomplete="off"
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
												<input type="text" value="" name="phone" autocomplete="off"
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
												<input type="text" value="" name="fax" autocomplete="off"
													ng-model="listUser.fax" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("email")%> <span class="require">*</span></label>
											<div class="form-group">
												<input type="email" value="" name="email" autocomplete="off"
													ng-model="listUser.email" required="required" ui-event="{ blur : 'checkEmail()' }"
													class="form-control" ng-keyup="hideError();" /> <span
													ng-show="form.email.$touched && form.email.$error.required"
													class="error"><%=prop.getProperty("enterEmail")%></span> <span
													ng-show="form.email.$touched && form.email.$error.email"
													class="error"><%=prop.getProperty("validEmail")%></span>
													<span ng-show="ckemail" class="error">This email already registered.</span>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("website")%></label>
											<div class="form-group">
												<input type="url" value="" name="url" autocomplete="off"
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
												<textarea name="description" ng-model="listUser.description" autocomplete="off"
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
											class="vendor-btn" value="<%=prop.getProperty("create")%>">
									</div>
								</div><br>
							</div>
						</form>
					</div>
		<jsp:include page="/front/footer.jsp"></jsp:include>
	</div>
</body>
</html>