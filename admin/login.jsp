<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<%
	String z = (String) request.getSession().getAttribute("email");
	if (z != null) {
		out.print("<script>window.location.href = 'admin/dashboard';</script>");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" ui-sref="home-slider"><%=prop.getProperty("page_title")%></a>
		</div>
	</div>
</nav>
	<section class="signup-section" data-ng-controller="adminLoginCtrl">
		<div class="container">
			<div class="row signup-form admin-login-form">
				<h3 class="signup-heading">
					<i class="fa fa-sign-in" aria-hidden="true"></i> Login
				</h3>
				<form ng-submit="adminLogin()" name="form" novalidate>
					<div class="col-sm-12">
						<div class="alert alert-danger" ng-hide="!inval">
							<%=prop.getProperty("inval")%>
						</div>
						<div class="form-group">
							<label><%=prop.getProperty("email")%></label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-envelope" aria-hidden="true"></i>
								</div>
								<input id="form_email" type="email" name="email"
										class="form-control" autocomplete="off"
										ng-model="adminlogin.email" required>
							</div>
							<span ng-show="form.email.$error.email" style="color: #ca0707;">*<%=prop.getProperty("invalEmail")%></span>
						</div>
						<div class="form-group">
							<label><%=prop.getProperty("password")%></label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-lock" aria-hidden="true"></i>
								</div>
								<input id="form_phone" type="password" name="password" autocomplete="off"
												class="form-control" ng-model="adminlogin.password">
							</div>
						</div>
						<input type="submit" class="vendor-btn"
							value="<%=prop.getProperty("login")%>"> 
					</div>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="/front/footer.jsp"></jsp:include>
</body>
</html>