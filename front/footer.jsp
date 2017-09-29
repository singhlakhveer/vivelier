<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
%>
<section class="Newsletter" ng-controller="homeCtrl">		
		<div class="container">
				<div class="row">
					<div class="col-md-12">
					<div ng-bind-html="msg" class="sub-msg"></div>
					    <h2>Newsletter</h2>
						<div class="border"></div>
						<form class="form-inline" name="form" ng-submit="subscribeEmail();" novalidate>
						  <div class="form-group">
							<input type="text" ng-model="sub.name" name="email" autocomplete="off" required="required" class="form-control" id="exampleInputEmail2" placeholder="<%=prop.getProperty("validName")%>">
						  </div>
						  <div class="form-group">
							<input type="email" ng-model="sub.email" name="email" autocomplete="off" required="required" class="form-control" id="exampleInputEmail3" placeholder="<%=prop.getProperty("enterEmail")%>">
						  </div>
						  
						  <button type="submit" class="btn btn-default subscribe"><%=prop.getProperty("subscribe")%></button>
						  <span ng-show="form.email.$error.email" class="error subscribeError"><%=prop.getProperty("validEmail")%></span>
						</form>
					</div>					
				</div>
		</div>
	</section>
	<a id="backTop" class="red" style="right: 40px; bottom: 40px; position: fixed; display: inline;"></a>
	<footer class="footerSec">
		<div class="container">
			<div class="row" data-ng-controller="homeCtrl"
				ng-init="getAboutDataInFront();">
				<div class="col-md-4 col-xs-12 col-sm-4" ng-bind-html="bindAboutData | limitTo: 250">
				</div>
				<div class="col-md-4 col-xs-6 col-sm-4 text-center">
				<h3>Corporate</h3>
				<div class="border"></div>
					  <ul class="nav footer-nav ">					
						<li><a href="aboutus"><%=prop.getProperty("aboutCompany")%></a></li>
						<li><a href="#"><%=prop.getProperty("partners")%></a></li>
						<li><a href="terms-conditions"><%=prop.getProperty("terms")%></a></li>
						<li><a href="privacy-policy"><%=prop.getProperty("privacy")%></a></li>
						<li><a href="contactus"><%=prop.getProperty("contactus")%></a></li>
					  </ul>
				</div>
				<div class="col-md-4 col-xs-6 col-sm-4">
				<h3>Follow Us</h3>
				<div class="border"></div>
				<div class="social text-center">
				<a href="#"><img src="images/images/fb.png"></a>
				<a href="#"><img src="images/images/twitter.png"></a>
				<a href="#"><img src="images/images/google.png"></a>
				<a href="#"><img src="images/images/insta.png"></a>
				</div>
				</div>
			</div>					
		</div>	
	</footer>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- <script src="js/bootstrap.min.js"></script> -->
	<!-- <script src="js/jquery.backTop.min.js"></script> -->
	<script>	
	$(document).ready( function() {
		/* $('#backTop').backTop({
			'position' : 500,
			'speed' : 500,
			'color' : 'red',
		}); */
		$(".center").slick({
	        infinite: true,
	        centerMode: true,
	        slidesToShow: 3,
	        slidesToScroll: 3
	      });
	});
</script>