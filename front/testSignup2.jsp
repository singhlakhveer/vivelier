<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
	ng-include="'front/header.jsp'"></nav>

<div id="content" class="ng-scope" data-ng-controller="vendorCtrl">
	<div class="bg-white">
		<div class="container">
			<div class="page-section">
				<div data-scrollable="" tabindex="1"
					style="overflow-y: hidden; outline: none;">

					<div class="form-section">
						<form id="contact-form" ng-submit="sign_up();" name="form"  novalidate>

							<div class="controls">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_name"><%=prop.getProperty("firstName")%> <span class="error">*</span></label> <input
												id="form_name" type="text" name="name" 
												ng-model="user.first_name" class="form-control"
												placeholder="Please enter your firstname *" required="required" >
												<span data-ng-show="form.name.$touched && form.name.$error.required " style="color: #ca0707;"><%=prop.getProperty("validFN")%></span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_lastname"><%=prop.getProperty("lastName")%> <span class="error">*</span></label> <input
												id="form_lastname" type="text" name="surname"
												ng-model="user.last_name" class="form-control"
												placeholder="Please enter your lastname *" required="required">
												<span data-ng-show="form.surname.$touched && form.surname.$error.required " style="color: #ca0707;"><%=prop.getProperty("validLN")%></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email"><%=prop.getProperty("email")%> <span class="error">*</span></label> <input
												id="form_email" type="email" name="email"
												class="form-control" placeholder="Please enter your email *"
												ng-model="user.email" required="required">
												<span data-ng-show="form.email.$touched && form.email.$error.required " style="color: #ca0707;"><%=prop.getProperty("enterEmail")%></span>
												<span data-ng-show="form.email.$touched && form.email.$error.email " style="color: #ca0707;"><%=prop.getProperty("validEmail")%></span>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_phone"><%=prop.getProperty("phone")%> <span class="error">*</span></label> <input id="form_phone"
												type="tel" name="phone" class="form-control"
												ng-model="user.phone" placeholder="Please enter your phone" 
												ng-minlength="10" ng-maxlength="10" required="required">
												<span ng-show="form.phone.$touched && form.phone.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("enterPhone")%></span> <span
														ng-show="form.phone.$touched && form.phone.$error.minlength || form.phone.$error.maxlength"
														style="color: #ca0707;"><%=prop.getProperty("validPhone")%></span>
										</div>
									</div>

									<div class="col-md-12">
											<label for="form_phone"><%=prop.getProperty("vendorPlan")%> <span class="error">*</span></label>
									</div>
									<div class="col-md-4">
										<label class="radio-inline"> <input type="radio"
											name="amount" ng-model="user.amount" class="radio-inline" required="required"
											value="5"> $5 <%=prop.getProperty("basic")%>
										</label>

									</div>
									<div class="col-md-4">
										<label class="radio-inline"> <input type="radio"
											name="amount" ng-model="user.amount" class="radio-inline" required="required"
											value="10"> $10 <%=prop.getProperty("pro")%>
										</label>
									</div>
									<div class="col-md-4">
										<label class="radio-inline"> <input type="radio"
											name="amount" ng-model="user.amount" class="radio-inline" required="required"
											value="20"> $20 <%=prop.getProperty("premium")%>
										</label>
									</div>
								</div>
								<span data-ng-show="form.amount.$touched && form.amount.$error.required " style="color: #ca0707;"><%=prop.getProperty("selectVendorPlan")%></span>
								<br>
								<div class="row">
									<div class="col-md-12">
										<input type="submit" ng-disabled="!form.$valid" class="btn btn-primary btn-send"
											value="<%=prop.getProperty("next")%>">
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
<!-- // END #content -->

<!-- Footer -->
<footer class="footer">
	<strong><%=prop.getProperty("page_title")%></strong>  &copy;2015
</footer>
<!-- // Footer -->
</div>
