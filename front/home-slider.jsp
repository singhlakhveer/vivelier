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

<meta name="description" content="<%=prop.getProperty("home.title")%>">
<meta name="keywords" content="<%=prop.getProperty("home.title")%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=seo.getProperty("home.title")%></title>

<!-- Bootstrap -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet"> -->
</head>
<body>
	<div ng-controller="homeCtrl"
		ng-init="getList(); getMainCategoriez();getMainCategories();getCity();getState();getCountry();">
		<jsp:include page="header.jsp"></jsp:include>

		<section class="banner">
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div class="slider-inner-item">
								<div class="img-outer">
									<img class="img-responsive" src="images/images/5.jpg"
										alt="banner">
								</div>
								<div class="caption-outer">
									<h4 class="ccaption">List your Business for FREE for 1st
										year</h4>
								</div>
							</div>
						</div>
						<div class="item ">
							<div class="slider-inner-item">
								<div class="img-outer">
									<img class="img-responsive" src="images/images/6.jpg"
										alt="banner">
								</div>
								<div class="caption-outer">
									<h4 class="ccaption">Find LUXURY hotel suppliers, products
										and events</h4>
								</div>
							</div>
						</div>
						<div class="item ">
							<div class="slider-inner-item">
								<div class="img-outer">
									<img class="img-responsive" src="images/images/7.jpg"
										alt="banner">
								</div>
								<div class="caption-outer">
									<h4 class="ccaption">Get deals from top hotel vendors</h4>
								</div>
							</div>
						</div>
						<div class="item ">
							<div class="slider-inner-item">
								<div class="img-outer">
									<img class="img-responsive" src="images/images/2.jpg"
										alt="banner">
								</div>
								<div class="caption-outer">
									<h4 class="ccaption">Get deals from top hotel vendors</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
		</section>
		<section class="search-f">
			<div class="container">
				<div class="row">
					<div class="search-center">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<form class="form-horizontal" ng-submit="searchList();" name="form">
								<div class="form-group">
									<div class="col-md-12 col-sm-12">
										<div class="col-md-6 col-sm-5 padding-none1">
											<!-- <input class="form-control" id="exampleInputName2" placeholder="Search By Category" type="text"> -->
											<label class="label search-label"><%=prop.getProperty("mainCategory")%></label> <select
												style="width: 100%;" data-toggle="select2" required
												name="category" ng-model="search.category">
												<option ng-repeat="c in categoriez"
													ng-value="c.categoryName" ng-bind="c.categoryName"></option>
											</select>
										</div>
										<div class="col-md-5 col-sm-5 padding-none1">
											<!-- <input class="form-control" id="exampleInputName2" placeholder="Search By Category" type="text"> -->
											<label class="label search-label"><%=prop.getProperty("city")%></label> <select
												style="width: 100%;" data-toggle="select2" required
												name="city" ng-model="search.city">
												<option ng-repeat="cz in citz" ng-bind="cz.city"
													ng-value="cz.city"></option>
											</select>
										</div>
									</div>
									<div class="col-md-12 col-sm-12 home-search">
										<div class="col-md-6 col-sm-5 padding-none1">
											<!-- <input class="form-control" id="exampleInputName2" placeholder="Search By Category" type="text"> -->
											<label class="label search-label"><%=prop.getProperty("state")%></label> <select
												style="width: 100%;" data-toggle="select2" required
												name="state" ng-model="search.state">
												<option ng-repeat="c in state"
													ng-value="c.state" ng-bind="c.state"></option>
											</select>
										</div>
										<div class="col-md-5 col-sm-5 padding-none1">
											<!-- <input class="form-control" id="exampleInputName2" placeholder="Search By Category" type="text"> -->
											<label class="label search-label"><%=prop.getProperty("country")%></label> <select
												style="width: 100%;" data-toggle="select2" required
												name="country" ng-model="search.country">
												<option ng-repeat="adder in country" ng-bind="adder.country"
													ng-value="adder.country"></option>
											</select>
										</div>
										<div class="col-md-1 col-sm-2 padding-none1">
											<button type="submit" class="btn btn-default">
												<img src="images/images/search.png">
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="f-vendors">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="text-center"><%=prop.getProperty("featuredBusiness")%></h2>
						<div class="border-blue"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="slick-basic slick-slider" data-items="5"
							data-items-lg="3" data-items-md="2" data-items-sm="2"
							data-items-xs="1" id="listImg"></div>
					</div>
				</div>
			</div>
		</section>

		<section class="category-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="text-center"><%=prop.getProperty("featuredBusinessCategoryList")%></h2>
						<div class="border-blue"></div>
					</div>
				</div>
				<div id="categoryList"></div>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>