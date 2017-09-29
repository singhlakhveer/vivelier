<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>

<%
	Properties prop = propertyConfig.getLangProperties(request, response);
%>
<%
	String z = (String) request.getSession().getAttribute("email");
	if (z == null) {
%>
<script type="text/javascript">
$(document).ready(function() {
  window.location.href = "admin/login";
});
</script>
<%
	}
%>

<div class="st-container" data-ng-controller="adminLoginCtrl"
	data-ng-init="adminProfile('<%=z%>');getAboutData();">

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"admin/header.jsp"'></nav>
	<!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"admin/sidebar.jsp"'>
	</aside>
	<!-- sidebar effects OUTSIDE of st-pusher: -->
	<!-- st-effect-1, st-effect-2, st-effect-4, st-effect-5, st-effect-9, st-effect-10, st-effect-11, st-effect-12, st-effect-13 -->
	<!-- content push wrapper -->
	<div class="st-pusher">
		<!-- sidebar effects INSIDE of st-pusher: -->
		<!-- st-effect-3, st-effect-6, st-effect-7, st-effect-8, st-effect-14 -->
		<!-- this is the wrapper for the content -->
		<div class="st-content">
			<!-- extra div for emulating position:fixed of the menu -->
			<div class="st-content-inner" id="content" data-scrollable
				data-ng-init="vendorProfile">
				<div class="container-fluid">
					<div class="profile-image">
						<div class="container">
							<div class="row">
								<div class="col-md-10">
									<div class="alert alert-success about-success">
										 About Us <strong>content Successfully</strong> updated.
									</div>
									<div class="form-group">
										<form class="form-horizontal" name="form" enctype="application/x-www-form-urlencoded" >
											<div class="form-group">
												<textarea name="about" ng-model="about" id="about" ></textarea>
											</div>
											<div class="form-group">
												<input type="submit" id="aboutUs" value="Update"
													class="btn btn-primary pull-right">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /st-content-inner -->
	</div>
	<!-- /st-content -->
	<!-- /st-pusher -->

	<!-- Footer -->
	<footer class="footer">
		<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
	</footer>
	<!-- // Footer -->
	<script type="text/javascript">
		var data = CKEDITOR.replace('about');
		$(".about-success").hide();
		$("#aboutUs").click(function(){
			var value = data.getData();
			$.ajax({
		           type: "POST",
		           url: 'webapi/admin/updateAboutUs',
		           data: {about : value}, // serializes the form's elements.
		           encode : true,
		           success: function(data)
		           {
		        	   $(".about-success").show();
		           }
		         });
		});
		
	</script>
</div>