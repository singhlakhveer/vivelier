<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
%>
<%@page import="com.lakhi.realestate.vender.model.vendorListing"%>
<%
	vendorListing vl = (vendorListing) request.getSession().getAttribute("list");

	String zz = vl.getMainCategory() + "&" + vl.getSubCategory() + "&" + vl.getMainImage() + "&"
			+ vl.getSignupPlan() + "&" + vl.getTitle() + "&" + vl.getCompanyName() + "&" + vl.getContactPerson()
			+ "&" + vl.getAddress() + "&" + vl.getPhone() + "&" + vl.getFax() + "&" + vl.getEmail() + "&"
			+ vl.getWebsite() + "&" + vl.getDescription() + "&" + vl.getCity() + "&" + vl.getState() + "&" + vl.getCountry();
	if (vl == null) {
%>
<script>
	$(document).ready(function() {
		window.location.href = "home-slider";
	});
</script>
<%
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
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
	<div>
		<jsp:include page="/front/header.jsp"></jsp:include>
		<section class="listing-detail" id="content" >
		
			<div class="st-pusher" ng-controller="freeVendorCtrl"
				ng-init="listThanks('<%=zz%>')">
					<div class="st-content-inner" id="content" data-scrollable
						data-ng-init="vendorProfile">
						<div class="container-fluid" style="text-align: center;">
							<div class="page-section">
								<h1>Thanks for create your listing</h1>
								<h5>We will send login credentials your email.</h5>
							</div>
						</div>
					</div>
			</div>
		
		</section>
		<jsp:include page="/front/footer.jsp"></jsp:include>
	</div>
</body>
</html>