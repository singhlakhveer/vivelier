<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
Properties seo = propertyConfig.getSEOProperty();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta name="description" content="<%=prop.getProperty("sl.title")%>">
	<meta name="keywords" content="<%=prop.getProperty("sl.title")%>">
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%=seo.getProperty("sl.title")%></title>
    <script src="js/facebook.js"></script>
	<script src="js/google.js"></script>
  </head>
  <body>
  <div ng-controller="homeCtrl" ng-init="getSingleListData();getSingleListReviews();">
  <div id="fb-root"></div>
	  <jsp:include page="header.jsp"></jsp:include>
	<section class="listing-detail" id="content" >
		<div class="container">
			<div class="row">
				<div class="col-md-7 img-section" ng-bind-html="listImg">
					<img src="images/images/banner.jpg">
				</div>
				<div class="col-md-5 listing-info">
					<h3 ng-bind="listData.title"></h3>
					<small>in <strong ng-bind="listData.categoryName"></strong></small>
					<span class="review-rating">Rating <i id="stars"></i> <i id="avg"></i>
					<!--<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star-half-o" aria-hidden="true"></i> -->
					</span><br>
					<i><%=prop.getProperty("name")%> : </i> &nbsp; <i ng-bind="listData.contactPerson"></i>
					<div class="clearfix"></div>
					<i><%=prop.getProperty("url")%> :  </i> &nbsp; <i ng-bind-html="website"></i>
					<div class="clearfix"></div>
					<i><%=prop.getProperty("email")%> : </i> &nbsp; <i ng-bind-html="email1"></i>
					<div class="clearfix"></div>
					<i><%=prop.getProperty("phone")%> : </i> &nbsp; <i ng-bind="listData.phone"></i>
					<div class="clearfix"></div>
					<i><%=prop.getProperty("address")%> : </i> &nbsp; <i ng-bind="listData.address"></i>, <i ng-bind="listData.city"></i>, 
					<i ng-bind="listData.state"></i>, <i ng-bind="listData.country"></i>
				</div>					
			</div>	
			<div class="row">
				<div class="col-md-7 description">
					<h3><%=prop.getProperty("description")%></h3>
					<p class="datail-des" ng-bind="listData.description"></p>
					<div class="share">
					<!-- <script>
						 $(document).ready(function(){
							$("#furl").append('data-href="'+window.location.href+'"');
						}); 
						</script>
				       <div class="fb-share-button" id="furl"  data-layout="button" data-size="small" data-mobile-iframe="true">
						    <a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">Share</a>
						</div>
						 <a href="https://twitter.com/share" class="twitter-share-button" data-show-count="true">Tweet</a><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script> -->
						 <div ng-bind-html="share"></div>
					</div>
				</div>
				<div class="col-md-5">
				<form class="contact-vendor" ng-submit="contactVendor();" name="form" novalidate>
				<div class="col-md-12" ng-show="suc">
					<div class="alert alert-success" style="text-align: center;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<%=prop.getProperty("contactVendorMailSent")%>
					</div>
				</div>
					<h3><%=prop.getProperty("contactVendor")%></h3>
					  <div class="form-group">
					  	<input type="hidden" name="email" ng-model="listData.email" />
						<input type="hidden" name="listId" ng-model="listData.id" />
						<label for="exampleInputPassword1"><%=prop.getProperty("name")%> <span class="error">*</span></label>
						<input type="text" autocomplete="off" ng-model="contact.name" required="required" class="form-control" id="exampleInputPassword1" placeholder="<%=prop.getProperty("name")%>">
						<span class="error" ng-show="name"><%=prop.getProperty("validName")%></span>
					  </div>
					  <div class="form-group">
						<label for="exampleInputEmail1"><%=prop.getProperty("email")%> <span class="error">*</span></label>
						<input type="email" autocomplete="off" ng-model="contact.email" required="required" class="form-control" id="exampleInputEmail1" placeholder="<%=prop.getProperty("email")%>">
						<span ng-show="form.email.$error.email" class="error"><%=prop.getProperty("validEmail")%></span>
					  </div>
					   <div class="form-group">
						<label for="exampleInputPassword1"><%=prop.getProperty("title")%> <span class="error">*</span></label>
						<input type="text" autocomplete="off" ng-model="contact.title" required="required" class="form-control" id="exampleInputPassword1" placeholder="<%=prop.getProperty("title")%>">
						<span class="error" ng-show="title"><%=prop.getProperty("validTitle")%></span>
					  </div>
					   <div class="form-group">
						<label for="exampleInputPassword1"><%=prop.getProperty("description")%> <span class="error">*</span></label>
						<textarea autocomplete="off" ng-model="contact.description" required="required" class="form-control" id="exampleInputPassword1" placeholder="<%=prop.getProperty("description")%>"></textarea>
						<span class="error" ng-show="description"><%=prop.getProperty("validDescription")%></span>
					  </div>
					  <input type="submit" ng-disabled="!form.$valid" class="vendor-btn" value="<%=prop.getProperty("send")%>">
					</form>
				</div>					
			</div>	
		</div>	
	</section>
	<section class="reviewSec">
		<div class="container">
		<div class="row">
				 <div class="col-md-8 review-title">
					<h3><%=prop.getProperty("reviews")%></h3>
					<div class="border-blue"></div>
				</div>
				<div class="col-md-4">
					<button data-toggle="modal" 
					<% String z = (String) request.getSession().getAttribute("vmail");
						if(z == null){
							%> data-target="#myModal" <%
						} else {
							%> ng-click="addReviewBySession();" <%	
						}
					%> class="vendor-btn write-review"><%=prop.getProperty("writeReview")%></button>
				</div>				
			</div>
			<div class="media review-part" ng-if="comments == 0">
			  <div class="media-left">
			  </div>
			  <div class="media-body" >
				<h5><%=prop.getProperty("noComment")%></h5>
			  </div>
			</div> 
			<div class="media review-part" ng-show="comments.length > 0" ng-repeat="c in  pagedItems[currentPage]">
			  <div class="media-left">
			  </div>
			  <div class="media-body">
			  	<span ng-bind="c.title"></span><br>
				<span class="review-rating"><i class="fa fa-star" aria-hidden="true" ng-repeat="z in getNumber(c.rating)"></i>
				</span>
				<small>By <strong ng-bind="c.vmail"></strong></small>
				<p ng-bind="c.description"></p>
			  </div>
			</div>
			<div class="review-pagination pull-right" ng-show="comments.length > 0">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
				<li ng-class="{disabled: currentPage == 0}"><a href
					ng-click="prevPage()">&laquo; <%=prop.getProperty("prev")%></a></li>
				<li
					ng-repeat="n in range(pagedItems.length, currentPage, currentPage + gap) "
					ng-class="{active: n == currentPage}" ng-click="setPage()"><a
					href ng-bind="n + 1">1</a></li>
				<li
					ng-class="{disabled: (currentPage) == pagedItems.length - 1}"><a
					href ng-click="nextPage()"><%=prop.getProperty("next")%> &raquo;</a></li>
			</ul>
			</nav>
		</div><br>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm loginpopup">
			<div class="modal-content form-wrap">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title"><%=prop.getProperty("login")%></h3>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger" ng-hide="!inval">
						<%=prop.getProperty("inval")%>
					</div>
					<div class="alert alert-danger" ng-hide="!deactive">
						<%=prop.getProperty("deactivate")%>
					</div>
					
					<div class="row" style="text-align:center;">
					  <button class="btn" onclick="fb_login();" style="background: #3B5998;color:#fff;"><i style="color:#fff;" class="fa fa-facebook"></i></button>
					  <button class="btn" ng-click="twitterOAth();" style="background: #428bca;color:#fff;"><i style="color:#fff;" class="fa fa-twitter"></i></button>
					  <button class="btn btn-danger" onclick="login()" style="color:#fff;"><i style="color:#fff;" class="fa fa-google"></i></button>
					    
					  <hr class="omb_hrOr">
						<span class="omb_spanOr"><%=prop.getProperty("or")%></span>
					</div>
					
					<form name="form1" ng-submit="reviewLogin();" novalidate>
						<div class="form-group">
							<label>Email <span class="error">*</span></label> <input
								class="form-control" type="email" ng-model="login.email" autocomplete="off"
								name="email" required="required"> <span
								ng-show="form1.email.$error.email" class="error"><%=prop.getProperty("invalEmail")%></span>
						</div>
						<div class="form-group">
							<label><%=prop.getProperty("password")%> <span class="error">*</span></label> <input
								class="form-control" type="password"
								ng-model="login.password" name="password" required="required">
						</div>
						<div class="form-group">
							<input class="btn btn-primary form-control review-login"
								ng-disabled="!form1.$valid" value="<%=prop.getProperty("login").toUpperCase()%>" type="submit">
						</div>
					</form>
					<div class="form-group">
						<input class="btn btn-danger form-control" ng-click="reviewSignUp();" value="<%=prop.getProperty("signup").toUpperCase()%>"
							type="button">
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
  </body>
</html>