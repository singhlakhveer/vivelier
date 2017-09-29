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
<meta name="description" content="<%=prop.getProperty("con.title")%>">
<meta name="keywords" content="<%=prop.getProperty("con.keywords")%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=seo.getProperty("con.title")%></title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="signup-section" data-ng-controller="homeCtrl"
		ng-init="getAboutDataInFront();">
		<div class="container">
			<div class="row signup-form" style="width: 100%;">
				<div class="col-sm-8">
					<div class="col-sm-12">
						<div class="col-sm-10" ng-show="contactMsg">
							<div class="alert alert-success">
							  Your message was sent <strong>successfully.</strong> Thanks. 
							</div>
						 </div>
					</div>
					<form name="form" ng-submit="contactUs();" novalidate>
						<h3>Contact Us</h3>
						<div class="col-sm-5">
							<div class="form-group">
								<label><%=prop.getProperty("firstName")%> <span class="error">*</span></label>
								<input type="text" name="firstName" ng-model="contact.firstName" class="form-control firstName" autocomplete="off"  required>
										
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-group">
								<label><%=prop.getProperty("lastName")%> <span class="error">*</span></label>
								<input type="text" name="lastName" ng-model="contact.lastName" class="form-control lastName" autocomplete="off"  required>
								
							</div>
						</div>
						<div class="col-sm-10">
							<div class="form-group">
								<label><%=prop.getProperty("email")%> <span class="error">*</span></label>
								<input type="email" name="email" ng-model="contact.email" class="form-control" autocomplete="off"  required>
								
							</div>
						</div>
						<div class="col-sm-10">
							<div class="form-group">
								<label><%=prop.getProperty("message")%> </label>
								<textarea name="message" ng-model="contact.message" class="form-control message"></textarea>
							</div>
						</div>
						<div class="col-sm-10">
							<div class="form-group">
								<input type="Submit" class="vendor-btn pull-right" ng-disabled="!form.$valid" value="<%=prop.getProperty("sendMessage")%>">
							</div>
						</div>
					</form>
				</div>
				<div class="col-sm-4 address-direction">
					<h3>Address & Directions</h3>
						<div class="form-group">
							<h4>Global Hotel Directory</h4>
							<p>D-151, Phase 8</p>
							<p>Bestech Business Tower</p>
							<p>Mohali, Punjab</p>
							<p>India (141401)</p>
						</div>
						<div class="form-group map" >
							<iframe width="100%" height="200" frameborder="0" scrolling="no" marginheight="0" src="https://maps.google.com/maps?q=Global Hotels, Sector - 66, Ajitgarh, Sahibzada Ajit Singh Nagar, Punjab 160066, &t=&z=14&ie=UTF8&iwloc=&output=embed" marginwidth="0"><a class="addmaps" href="http://wordpress-photography-themes.org"id="get-map-data" mce_href="http://maps.google.com/maps/">Global Hotels, Sector - 66, Ajitgarh, Sahibzada Ajit Singh Nagar, Punjab 160066, </a><style>#gmap_canvas img{max-width:none!important;background:none!important}</style><a class="addmaps" href="http://www.map-embed.com"id="get-map-data">map-embed.com</a></iframe>
						</div>
				</div>				
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>