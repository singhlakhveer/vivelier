<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	String z = (String) request.getSession().getAttribute("vmail");
	Properties prop = propertyConfig.getLangProperties(request,response);
%>
<header class="top-bar"  ng-controller="homeCtrl">
		<div class="container">
			<nav class="navbar">
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				  <a class="logo" href="#" ui-sref="home-slider"><img src="images/images/logo.png"></a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">     
				  <ul class="nav navbar-nav navbar-right">
				  <li class="login"><a href="#" ui-sref="home-slider"><%=prop.getProperty("home")%></a></li>
					<li class="login"><a href="listing/" ><%=prop.getProperty("vendorsList")%></a></li>
					<li class="login"><a href="#" ui-sref="services"><%=prop.getProperty("service")%></a></li>
					<li class="login"><a href="#" ui-sref="contactus"><%=prop.getProperty("contactus")%></a></li>
					<li class="create-listing"><a href="#" ui-sref="freeVendors.createListing"><%=prop.getProperty("createFeaturedList")%></a></li>
					<li class="create-listing"><a href="#" ui-sref="login"><%=prop.getProperty("hoteldirectory")%></a></li>					
					<li class="social"><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
					<li class="social twitter"><a href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
					<li class="social g-plus"><a href="#"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>
					<li class="dropdown">
					  <a href="#" class="dropdown-toggle translate" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="images/images/6.png"><span class="caret"></span></a>
					  <ul class="dropdown-menu">
						<li onclick="f('en')"><a href="#"><img src="images/images/5.png">EN</a></li>
						<li onclick="f('ch')"><a href="#"><img src="images/images/2.png">CH</a></li>
						<li onclick="f('it')"><a href="#"><img src="images/images/3.png">IT</a></li>
						<li onclick="f('nr')"><a href="#"><img src="images/images/4.png">NR</a></li>
						<li onclick="f('sp')"><a href="#"><img src="images/images/1.png">SP</a></li>
						<li onclick="f('fr')"><a href="#"><img src="images/images/7.png">FR</a></li>
					  </ul>
					</li>
				  </ul>
				  <div class="col-sm-6"></div>
					<div class="col-sm-4 pull-right" style="margin-bottom : 10px; ">
						  <form ng-submit="keywordSearch();" name="form">
						    <input list="keyword" name="keyword" ng-model="keyword" ng-keyup="getKeywords();" class="form-control keyword" 
						    placeholder="search keywords for listing" type="text" autocomplete="off"> 
							  <datalist id="keyword">
							  </datalist>
						  <input value="search" class="vendor-btn" style="float: right;" type="submit">
						</form>
					</div>
				</div><!-- /.navbar-collapse -->
			</nav>
		</div>
	  </header>  
	  <script>
		var url='';
			function f(e){
				url = window.location.href;
				if(e != ""){
					document.cookie = "lang="+e+";path=/realestate/";
				} else {
					var userLang = navigator.language || navigator.userLanguage; 
					 if(userLang == "en-US"){
						 document.cookie = "lang=en;path=/realestate/";	 
					 } else if(userLang == "zh-CN"){
						 document.cookie = "lang=ch;path=/realestate/";	 
					 } else if(userLang == "nn-NO"){
						 document.cookie = "lang=nr;path=/realestate/";	 
					 } else if(userLang == "it-IT"){
						 document.cookie = "lang=it;path=/realestate/";	 
					 } else if(userLang == "es-ES"){
						 document.cookie = "lang=sp;path=/realestate/";	 
					 } else if(userLang == "fr-FR"){
						 document.cookie = "lang=fr;path=/realestate/";	 
					 } else {
						 document.cookie = "lang=en;path=/realestate/";
					 }
				}
				window.location=url;
			}
</script>