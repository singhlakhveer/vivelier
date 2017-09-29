<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
Properties seo = propertyConfig.getSEOProperty();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta name="description" content="<%=prop.getProperty("signup.title")%>">
	<meta name="keywords" content="<%=prop.getProperty("signup.title")%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%=seo.getProperty("signup.title")%></title>

  </head>
  <body>
	  <jsp:include page="header.jsp"></jsp:include>
	<section class="signup-section" ng-controller="vendorCtrl">
		<div class="container">
				<div class="row signup-form">
					<h3 class="signup-heading"><i class="fa fa-user-plus" aria-hidden="true"></i> SignUp</h3>
					<form ng-submit="sign_up();" name="form"  novalidate>
						<div class="col-sm-12">
							<div class="row">
								<div class="col-sm-6 form-group">
									<label><%=prop.getProperty("firstName")%></label>
										<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
										<input type="text" name="name" class="form-control" ng-model="user.first_name" required="required" autocomplete="off" id="exampleInputAmount" placeholder="<%=prop.getProperty("firstName")%>">
									</div>
										<span data-ng-show="form.name.$touched && form.name.$error.required " class="error"><%=prop.getProperty("validFN")%></span>
								</div>
								<div class="col-sm-6 form-group">
									<label><%=prop.getProperty("lastName")%></label>
										<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
										<input type="text" name="surname" class="form-control" ng-model="user.last_name" required="required" autocomplete="off" id="exampleInputAmount" placeholder="<%=prop.getProperty("lastName")%>">
									</div>
										<span data-ng-show="form.surname.$touched && form.surname.$error.required " class="error"><%=prop.getProperty("validLN")%></span>
								</div>
							</div>	
							<div class="form-group">
								<label><%=prop.getProperty("email")%></label>
									<div class="input-group">
									<div class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></div>
									<input type="email" class="form-control" name="email" autocomplete="off" ng-model="user.email" required="required" id="exampleInputAmount" placeholder="<%=prop.getProperty("email")%>"
									ui-event="{ blur : 'checkEmail()' }" ng-keyup="hideError();">
								</div>
								<span data-ng-show="form.email.$touched && form.email.$error.required " class="error"><%=prop.getProperty("enterEmail")%></span>
												<span data-ng-show="form.email.$touched && form.email.$error.email " class="error"><%=prop.getProperty("validEmail")%></span>
												<span ng-show="ckemail" class="error">This email already registered.</span>
							</div>		
						<div class="form-group">
								<label><%=prop.getProperty("phone")%></label>
									<div class="input-group">
									<div class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></div>
									<input type="tel" name="phone" autocomplete="off" ng-model="user.phone" ng-minlength="10" ng-maxlength="10" required="required" class="form-control" id="exampleInputAmount" placeholder="<%=prop.getProperty("phone")%>">
								</div>
								<span ng-show="form.phone.$touched && form.phone.$error.required"
									class="error"><%=prop.getProperty("enterPhone")%></span> <span
									ng-show="form.phone.$touched && form.phone.$error.minlength || form.phone.$error.maxlength"
									class="error"><%=prop.getProperty("validPhone")%></span>
							</div>	
						<div class="row">
						  <ul class="radioSec">
						  <h5>Vendor Plan</h5>
								<div class="col-sm-4">
						  		 <li>
									<input type="radio" id="f-option" value="5" name="amount" ng-model="user.amount" required="required">
									<label for="f-option">$5 <%=prop.getProperty("basic")%> </label>
									<div class="check"></div>
								  </li>
								</div>	
								<div class="col-sm-4">
								<li>
									<input type="radio" id="s-option" name="amount" ng-model="user.amount" required="required" value="10">
									<label for="s-option">$10 <%=prop.getProperty("pro")%> </label>
									<div class="check"><div class="inside"></div></div>
								  </li>
								</div>
								<div class="col-sm-4">
								  <li>
									<input type="radio" id="t-option" name="amount" ng-model="user.amount" required="required" value="20">
									<label for="t-option">$20 <%=prop.getProperty("premium")%> </label>
									<div class="check"><div class="inside"></div></div>
								  </li>
								</div>	
							 <span data-ng-show="form.amount.$touched && form.amount.$error.required " style="margin-left: 30px;" class="error"><%=prop.getProperty("selectVendorPlan")%></span>
							 </ul>
							</div>						
							<input type="submit" ng-disabled="!form.$valid" class="vendor-btn" value="<%=prop.getProperty("next")%>">
						</div>
					</form> 
				</div>
				<div style="text-align:center;margin-bottom:20px;">  
					 Already a member ? <a href="login" class="login-anchor">login</a>
				</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>