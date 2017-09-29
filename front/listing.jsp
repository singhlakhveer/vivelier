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
<meta name="description" content="<%=prop.getProperty("list.title")%>">
<meta name="keywords" content="<%=prop.getProperty("list.title")%>">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=seo.getProperty("list.title")%></title>

<!-- Bootstrap -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet"> -->
</head>
<body>
	<div ng-controller="homeCtrl" ng-init="getListing();getMainCategories();getCity();getState();getCountry();">
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="container">
		<section class="listing-list col-sm-12 col-xs-12 col-md-12">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-default" data-open="true">
					<div class="panel-heading panel-collapse-trigger">
						<h4 class="panel-title"><%=prop.getProperty("filterBy")%></h4>
					</div>
					<div class="panel-body">
						<form name="form" >
							<div class="form-group"><label><%=prop.getProperty("mainCategory")%></label>
								<select style="width: 100%;" data-toggle="select2" required
									name="mCategory" ng-model="search.category">
									<option ng-repeat="c in categoriez" ng-value="c.categoryName"
										ng-bind="c.categoryName"></option>
								</select>
							</div>
							<div class="form-group"><label><%=prop.getProperty("city")%></label>
								<select style="width: 100%;" data-toggle="select2" required
									name="city" ng-model="search.city" >
									<option ng-repeat="cz in citz" ng-bind="cz.city"
													ng-value="cz.city"></option>
								</select>
							</div>
							<div class="form-group"><label><%=prop.getProperty("state")%></label>
								<select style="width: 100%;" data-toggle="select2" required
									name="state" ng-model="search.state" >
									<option ng-repeat="c in state"
													ng-value="c.state" ng-bind="c.state"></option>
								</select>
							</div>
							<div class="form-group"><label><%=prop.getProperty("country")%></label>
								<select style="width: 100%;" data-toggle="select2" required
									name="city" ng-model="search.country" >
									<option ng-repeat="adder in country" ng-bind="adder.country"
													ng-value="adder.country"></option>
								</select>
							</div>
							<div class="row filter-btn">
								<div class="col-xs-6">
								<input type="submit" ng-click="filterCategories();" value="<%=prop.getProperty("filterButton")%>" class="vendor-btn">
								</div>
							</div>
						</form>
					</div>
				</div>
				<br />
			</div>
			<div class="col-md-9">
				<div ng-bind-html="error"></div>
				<div id="listing">					
					<script id="some-template" type="text/x-handlebars-template">
					{{#users}}
					<div class="panel panel-default">
					<div class="panel-body">
						<div class="media media-clearfix-xs media-clearfix-sm">
							<div class="media-left">
								<p>
<!--href="list?id={{id}}"-->
									<a href="list/{{title}}"> <img
										src="images/vendor/listing/{{mainImage}}" alt="property"
										width="150" class="media-object" />
									</a>
								</p>
							</div>
							<div class="media-body">
								<h4 class="media-heading margin-v-0-10">
									<a href="list/{{title}}"> {{title1}}</a> <span
										class="label label-primary">in {{categoryName}}</span>
								</h4>
								<span class="margin-none">{{description}}</span>
								<p>
									<span class="bold"><%=prop.getProperty("mobile")%> : </span> <span>{{phone}}</span>
									<br> <span class="bold"><%=prop.getProperty("website")%> : </span><span> <a href="{{website}}"
										target="_blank">{{website}}</a></span>
								</p>
							</div>
						</div>
					</div>
				</div>
				{{/users}}
				</script>
				</div>
				
				</div>
				<div class="pagination pull-right" ng-hide="!err"
					style="margin-bottom: 40px;">
					<ul class="pagination">
						<li ng-class="{disabled: currentPage == 0}"><a href
							ng-click="prevPage()">&laquo; <%=prop.getProperty("prev")%></a></li>
						<li
							ng-repeat="n in range(pagedItems.length, currentPage, currentPage + gap) "
							ng-class="{active: n == currentPage}" ng-click="setPage()"><a
							href ng-bind="n + 1">1</a></li>
						<li ng-class="{disabled: (currentPage) == pagedItems.length - 1}"><a
							href ng-click="nextPage()"><%=prop.getProperty("next")%> &raquo;</a></li>
					</ul>
				</div>
			</div>
		</section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>