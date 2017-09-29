<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
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
	<div  ng-controller="homeCtrl">
		<jsp:include page="header.jsp"></jsp:include>
		<section class="listing-detail" id="content" >
		<div class="container">
			<div class="row">
			<div class="col-md-12" ng-show="suc">
					<div class="alert alert-success" style="text-align: center;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
						<%=prop.getProperty("successfullyAddRating")%>
					</div>
				</div>
				<div class="col-md-3">
					<div class="panel panel-default" data-open="true">
					<div class="panel-heading panel-collapse-trigger">
						<h4><%=prop.getProperty("makeReviews")%></h4>
					</div>
					<div class="panel-body">
						<h4><%=prop.getProperty("heading1")%></h4>
						<p><%=prop.getProperty("desc1")%></p> <br>
						<h4><%=prop.getProperty("heading2")%></h4>
						<p><%=prop.getProperty("desc2")%></p><br>
						<h4><%=prop.getProperty("heading3")%></h4>
						<p><%=prop.getProperty("desc3")%></p>
					</div>
				</div>
				</div>
				<div class="col-md-9 panel panel-default" style="padding: 10px;">
					<form ng-submit="addReview()" name="form" novalidate>	
									
						<label><%=prop.getProperty("rating")%> <span class="error">*</span></label>
						<div class="form-group">
							<fieldset class="rating">
							    <input type="radio" id="star5" name="rating" ng-model="review.rating" ng-value="5" /><label for="star5" title="Rocks!">5 stars</label>
							    <input type="radio" id="star4" name="rating" ng-model="review.rating" ng-value="4" /><label for="star4" title="Pretty good">4 stars</label>
							    <input type="radio" id="star3" name="rating" ng-model="review.rating" ng-value="3" /><label for="star3" title="Meh">3 stars</label>
							    <input type="radio" id="star2" name="rating" ng-model="review.rating" ng-value="2" /><label for="star2" title="Kinda bad">2 stars</label>
							    <input type="radio" id="star1" name="rating" ng-model="review.rating" ng-value="1" /><label for="star1" title="Sucks big time">1 star</label>
							</fieldset><br>
							<span class="error" ng-show="rating"><%=prop.getProperty("selectStars")%></span>
							<br>
						</div>
						<div class="form-group">
							<label class="title"><%=prop.getProperty("title")%> <span class="error">*</span></label> 
							<input type="text" name="title" autocomplete="off" ng-model="review.title" class="form-control" required="required" />
							<span class="error" ng-show="title"><%=prop.getProperty("validTitle")%></span>
						</div>
						<div class="form-group">
							<label><%=prop.getProperty("description")%> <span class="error">*</span></label>
							<textarea name="description" ng-model="review.description" class="form-control" required="required"></textarea>
							<span class="error" ng-show="description"><%=prop.getProperty("validDescription")%></span>
						</div>
						<div class="form-group">
							<input type="submit" class="vendor-btn" ng-disabled="!form.$valid" value="<%=prop.getProperty("addReview")%>" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>