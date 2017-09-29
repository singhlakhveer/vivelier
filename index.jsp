<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
%>
<!DOCTYPE html>
<html lang="en" ng-app="app" ng-controller="AppCtrl"
	class="ng-class:app.settings.htmlClass">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title><%=prop.getProperty("page_title")%></title>
<base href="/realestate/" />
<link href="http://localhost:8080/realestate/css/vendor/all.css"
	rel="stylesheet">
<link href="http://localhost:8080/realestate/css/app/app.css"
	rel="stylesheet">
<link href="http://localhost:8080/realestate/css/custom.css"
	rel="stylesheet">
<link href="http://localhost:8080/realestate/css/bootstrap.min.css"
	rel="stylesheet">
<link href="http://localhost:8080/realestate/css/style.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
	
		<script src="http://localhost:8080/realestate/js/vendor/all.js"></script>
		<!-- <script src="http://localhost:8080/realestate/js/jquery.backTop.min.js"></script> -->
		<script src="http://localhost:8080/realestate/js/custom.js"></script>
		<script src="http://localhost:8080/realestate/js/ckeditor/ckeditor.js"></script>
		
</head>
<body>
	<div data-ui-view class="ui-view-main"></div>
	<script>
		var colors = {
			"danger-color" : "#e74c3c",
			"success-color" : "#81b53e",
			"warning-color" : "#f0ad4e",
			"inverse-color" : "#2c3e50",
			"info-color" : "#2d7cb5",
			"default-color" : "#6e7882",
			"default-light-color" : "#cfd9db",
			"purple-color" : "#9D8AC7",
			"mustard-color" : "#d4d171",
			"lightred-color" : "#e15258",
			"body-bg" : "#f6f6f6"
		};
		var config = {
			theme : "angular",
			skins : {
				"default" : {
					"primary-color" : "#16ae9f"
				}
			}
		};
	</script>
	

	<script src="http://localhost:8080/realestate/js/app/app.js"></script>
	
	<!-- Controllers -->
	<script src="http://localhost:8080/realestate/js/ctrl/homeCtrl.js"></script>
	<script src="http://localhost:8080/realestate/js/ctrl/vendorCtrl.js"></script>
	<script src="http://localhost:8080/realestate/js/ctrl/adminCtrl.js"></script>
	<script src="http://localhost:8080/realestate/js/ctrl/freeVendorCtrl.js"></script>
	
	<!-- Factories -->
	<script src="http://localhost:8080/realestate/js/factory/vendor.js"></script>
	<script src="http://localhost:8080/realestate/js/factory/admin.js"></script>
	<script src="http://localhost:8080/realestate/js/factory/freeVendor.js"></script>
	<script src="http://localhost:8080/realestate/js/factory/home.js"></script>
	<!-- Filters -->
	<!-- <script src="http://localhost:8080/realestate/js/filters/removeHyphen.js"></script> -->
	
</body>
</html>