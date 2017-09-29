<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
%>
<%
	String Semail = (String) request.getSession().getAttribute("Semail");
	String Sfname = (String) request.getSession().getAttribute("Sfname");
	String Slname = (String) request.getSession().getAttribute("Slname");
	String Sphone = (String) request.getSession().getAttribute("Sphone");
	String Splan = (String) request.getSession().getAttribute("Splan");

	String user = Semail+"-"+Sfname+"-"+Slname+"-"+Sphone+"-"+Splan;
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=prop.getProperty("page_title")%></title>

<!-- Bootstrap -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet"> -->
</head>
<body>
	<div id="content" class="ng-scope" ng-controller="vendorCtrl" ng-init="signupMail('<%=Semail%>'); signupNewVendor('<%= user %>');">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="bg-white">
		<div class="container">
			<div class="page-section" style="margin-top:150px; text-align: center;">
				<%=prop.getProperty("thankyou")%>
				<p class="lead"><%=prop.getProperty("loginCredentials")%></p>
				<form>
					<input type="hidden" ng-model="user.email" value="<%=Semail%>">
					<input type="hidden" ng-model="user.fname" value="<%=Sfname%>">
					<input type="hidden" ng-model="user.lname" value="<%=Slname%>">
					<input type="hidden" ng-model="user.phone" value="<%=Sphone%>">
					<input type="hidden" ng-model="user.plan" value="<%=Splan%>">
				</form>
				
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>