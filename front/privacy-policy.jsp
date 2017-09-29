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
<meta name="description" content="<%=prop.getProperty("pp.title")%>">
<meta name="keywords" content="<%=prop.getProperty("pp.keywords")%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=seo.getProperty("pp.title")%></title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="signup-section" data-ng-controller="homeCtrl"
		ng-init="getprivacyDataInFront();">
		<div class="container">
			<div class="row signup-form" ng-bind-html="bindPrivacyData"
				style="width: 100%;"></div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>