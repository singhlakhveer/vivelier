<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<style>
.hotelImg {
	max-height: 404px;
	/* width: 100%; */
}
</style>
<!-- Wrapper required for sidebar transitions -->
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
<div class="st-container" data-ng-controller="adminLoginCtrl" data-ng-init="adminProfile('<%=z%>');hotelById();getHotelGallery();">
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
								<div class="col-sm-6">
									<div class="col-sm-12">
										<div class="col-md-12" ng-show="valid">
											<div class="alert alert-success">
												<a href="#" class="close" data-dismiss="alert"
													aria-label="close">&times;</a> <%=prop.getProperty("updateHotelMsg")%>
											</div>
										</div>
									</div>
									<h3>Hotel Details</h3>

									<form name="form" novalidate ng-submit="updateHotel();">

										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-sm-3 control-label"><%=prop.getProperty("hotelName")%> <span
													class="error">*</span></label>
												<div class="col-sm-9">
													<input type="hidden" class="form-control" name="id"
														ng-model="hotel.id">
													<!-- hotel id -->
													<input type="text" class="form-control" name="hotelName"
														ng-model="hotel.hotelName" required="required"> <span
														ng-show="form.hotelName.$touched && form.hotelName.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("enterHotel")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("address")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="address"
														ng-model="hotel.address" required="required"> <span
														ng-show="form.address.$touched && form.address.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validAddress")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("city")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="city"
														ng-model="hotel.city" required="required"> <span
														ng-show="form.city.$touched && form.city.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validCity")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("state")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="state"
														ng-model="hotel.state" required="required"> <span
														ng-show="form.state.$touched && form.state.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validState")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("country")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="country"
														ng-model="hotel.country" required="required"> <span
														ng-show="form.country.$touched && form.country.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validCountry")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("zip")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="zip"
														ng-model="hotel.zip" required="required"> <span
														ng-show="form.zip.$touched && form.zip.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validZip")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("website")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="website"
														ng-model="hotel.website" required="required"> <span
														ng-show="form.website.$touched && form.website.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("validWebsite")%>
														Link</span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("email")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<input type="email" class="form-control" name="email1"
														ng-model="hotel.email1" required="required"> <span
														ng-show="form.email1.$touched && form.email1.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("enterEmail")%></span> <span
														ng-show="form.email1.$error.email" style="color: #ca0707;"><%=prop.getProperty("validEmail")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12" ng-if="hotel.email2 != '' ">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("email")%>
													<%=prop.getProperty("emailOptional")%></label>
												<div class="col-sm-9">
													<input type="email" class="form-control" name="email2"
														ng-model="hotel.email2" required="required"> <span
														ng-show="form.email2.$touched && form.email2.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("enterEmail")%></span> <span
														ng-show="form.email2.$error.email" style="color: #ca0707;"><%=prop.getProperty("validEmail")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("phone")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="telephone1"
														ng-model="hotel.telephone1" required="required"> <span
														ng-show="form.telephone1.$touched && form.telephone1.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("enterPhone")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12" ng-if="hotel.telephone2 != '' ">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("phone")%>
													<%=prop.getProperty("phoneOptional")%></label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="telephone2"
														ng-model="hotel.telephone2" required="required"> <span
														ng-show="form.telephone2.$touched && form.telephone2.$error.required"
														style="color: #ca0707;"><%=prop.getProperty("enterPhone")%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<br> <label class="col-sm-3 control-label"><%=prop.getProperty("remarks")%>
													<span class="error">*</span>
												</label>
												<div class="col-sm-9">
													<textarea ng-model="hotel.remarks" name="remarks"
														class="form-control"></textarea>
												</div>
											</div>
										</div>
										<div class="col-sm-12" style="padding-bottom: 30px;">
											<div class="form-group">
												<br> <label class="col-sm-2 control-label"></label>
												<div class="col-sm-6">
													<input type="Submit" class="btn btn-primary" value="<%=prop.getProperty("update")%>"
														ng-disabled="!form.$valid">
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="col-sm-5">
									<div class="col-sm-12">
										<div class="col-md-12" ng-show="validGallery">
											<div class="alert alert-success">
												<a href="#" class="close" data-dismiss="alert"
													aria-label="close">&times;</a> <%=prop.getProperty("uploadGalleryImgsMsg")%>
											</div>
										</div>
										<h3><%=prop.getProperty("uploadGalleryPics")%></h3>
										<form name="form" novalidate ng-submit="addGallery();"
											enctype="multipart/form-data">
											<div class="col-sm-12">
												<div class="form-group">
													<br> <label class="col-sm-4 control-label"><%=prop.getProperty("selectGalleryPics")%></label>
													<div class="col-sm-8">
														<input type="file" name="file" multiple="multiple"
															onchange="angular.element(this).scope().uploadGalleryImages(this.files)"
															ng-model="hotel.file"> <br>
													</div>
												</div>
											</div>
											<div class="col-sm-12">
												<div class="form-group">
													<br> <label class="col-sm-3 control-label">
														<%=prop.getProperty("galleryUrl")%></label>
													<div class="col-sm-8">
														<input type="hidden" ng-model="hotel.id" /> <input
															type="text" name="url" class="form-control"
															ng-model="hotel.url"> <br> <input
															type="submit" value="<%=prop.getProperty("addHotelImg")%>" class="btn btn-primary" />
													</div>
												</div>
											</div>
										</form>
										<div class="col-sm-12" ng-show="images.length > 0">
											<h3><%=prop.getProperty("hotelsImg")%></h3>
											<div id="hotelimg123">
												<ul id="hotelimg">
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /st-content-inner -->
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div id="myCarousel" class="carousel slide imgWidth"
								data-ride="carousel">
								<!-- Wrapper for slides -->
								<div class="carousel-inner itm" role="listbox" id="hotelimg1">
								</div>
								<a class="left carousel-control" href="#myCarousel"
									role="button" data-slide="prev"> <span class="icon-prev"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#myCarousel"
									role="button" data-slide="next"> <span class="icon-next"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /st-content -->
		</div>
		<!-- /st-pusher -->
		<!-- Footer -->
		<footer class="footer">
			<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
		</footer>
		<!-- // Footer -->
	</div>