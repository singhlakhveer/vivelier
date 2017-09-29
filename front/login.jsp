<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.lakhi.realestate.vender.dao.vendorDao"%>
<%@page import="com.lakhi.realestate.vender.service.VendorService"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	String z = (String) request.getSession().getAttribute("vmail");
	if (z != null) {
%>
<script>
	$(document).ready(function() {
		window.location.href = "vendor/dashboard"; //p@$$word
	});
</script>
<%
	} else if (z == null) {
		Cookie[] ck = request.getCookies();
		String z1 = null;
		for (Cookie c : ck) {
			if (c.getName().equals("loginStatus")) {
				z1 = c.getValue();
				VendorService vendor = new vendorDao();
				vendor.updateLoginStatus(z1);
			}
		}
	}
%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
	Properties seo = propertyConfig.getSEOProperty();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description" content="<%=prop.getProperty("login.title")%>">
<meta name="keywords" content="<%=prop.getProperty("login.title")%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=seo.getProperty("login.title")%></title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="signup-section" data-ng-controller="vendorCtrl">
		<div class="container">
			<div class="row signup-form">
				<h3 class="signup-heading">
					<i class="fa fa-sign-in" aria-hidden="true"></i> Login
				</h3>
				<form ng-submit="vendorLogin();" name="form" novalidate>
					<div class="col-sm-12">
						<div class="alert alert-danger" ng-hide="!inval">
							<%=prop.getProperty("inval")%>
						</div>
						<div class="alert alert-danger" ng-hide="!isLog">
							<strong>Oops ! </strong>You are already loged in any where else.
						</div>
						<div class="alert alert-danger" ng-hide="!deactive">
							<%=prop.getProperty("deactivate")%>
						</div>
						<div class="form-group">
							<label><%=prop.getProperty("email")%></label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-envelope" aria-hidden="true"></i>
								</div>
								<input type="text" class="form-control" autocomplete="off"
									ng-model="login.email" required id="exampleInputAmount"
									placeholder="<%=prop.getProperty("email")%>"
								>
							</div>
						</div>
						<div class="form-group">
							<label><%=prop.getProperty("password")%></label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-lock" aria-hidden="true"></i>
								</div>
								<input type="password" class="form-control"
									ng-model="login.password" required id="exampleInputAmount"
									placeholder="<%=prop.getProperty("password")%>"
								>
							</div>
						</div>
						<input type="submit" class="vendor-btn"
							value="<%=prop.getProperty("login")%>"
						> <a class="login-anchor" href="#" data-toggle="modal"
							data-target="#myModal"
						><%=prop.getProperty("forgotPassword")%> ?</a>
					</div>
				</form>
			</div>
			<div style="text-align: center; margin-bottom: 20px;">
				Need new account ? <a href="signup" class="login-anchor">Sign up
					here</a>
			</div>
		</div>
		<!-- Forgot password model -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm loginpopup">
				<div class="modal-content form-wrap">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title"><%=prop.getProperty("forgotPassword")%></h3>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger" ng-hide="!inval1">
							<strong>Oops!</strong>
							<%=prop.getProperty("invalEmail")%>.
						</div>
						<div class="alert alert-success" ng-hide="!suc1"
							style="text-align: center;"
						>
							<%=prop.getProperty("passwordSent")%>
						</div>
						<form name="form1" ng-submit="forgotPass();" novalidate>
							<div class="form-group">
								<label><%=prop.getProperty("email")%> <span
									class="error"
								>*</span></label> <input class="form-control" type="email" ng-model="email"
									autocomplete="off" name="email" required="required"
								> <span ng-show="form1.email.$error.email" class="error"><%=prop.getProperty("invalEmail")%></span>
							</div>
							<div class="form-group">
								<input class="btn btn-primary form-control review-login"
									ng-disabled="!form1.$valid"
									value="<%=prop.getProperty("resetPassword")%>"
									type="submit"
								>
							</div>
						</form>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- // Forgot password model -->
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>