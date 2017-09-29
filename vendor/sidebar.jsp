<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
String vendor = (String)request.getSession().getAttribute("vmail");
if(vendor != null) {
%>
<div data-scrollable>
	<%
		String z = (String) request.getSession().getAttribute("vPlan");
		if (z.equals("Basic") || z.equals("Pro") || z.equals("Preimum")) {
	%>
	<!-- paid vendor sidebar  -->
	<ul
		class="sidebar-menu sm-icons-block sm-icons-right sm-active-item-bg">
		<li ng-class="{ 'active': $state.is('vendor.dashboard') }"><a
			ui-sref="vendor.dashboard"><i class="fa fa-tachometer"></i><span><%=prop.getProperty("dashboard")%></span></a></li>
		<li ng-click="updatePlan();"
			ng-class="{ 'active': $state.is('vendor.updatePlan') }"><a
			ui-sref="vendor.updatePlan"><i class="fa fa-refresh"></i><span><%=prop.getProperty("updatePlan")%></span></a></li>
		<%-- <li ng-click="hotelList();" ng-if="paymentStatus == 'Active' "
			ng-class="{ 'active': $state.is('vendor.search') }"><a
			ui-sref="vendor.search"><i class="fa fa-search"></i><span><%=prop.getProperty("searchHotels")%></span></a></li> --%>
		<li ng-if="paymentStatus == 'Active' "
			ng-class="{ 'active': $state.is('vendor.advanceSearch') }"><a
			ui-sref="vendor.advanceSearch"><i class="fa fa-search"></i><span><%=prop.getProperty("advanceSearch")%></span></a></li>
	</ul>
	<!-- //paid vendor sidebar  -->

	<%
		} else if (z.equals("Free")) {
	%>
	<!-- free vendor sidebar  -->

	<ul
		class="sidebar-menu sm-icons-block sm-icons-right sm-active-item-bg">
		<li ng-class="{ 'active': $state.is('vendor.dashboard') }"><a
			ui-sref="vendor.dashboard"><i class="fa fa-tachometer"></i><span><%=prop.getProperty("dashboard")%></span></a></li>
		<li ng-click="updatePlan();"
			ng-class="{ 'active': $state.is('vendor.updatePlan') }"><a
			ui-sref="vendor.updatePlan"><i class="fa fa-refresh"></i><span><%=prop.getProperty("updatePlan")%></span></a></li>
		<li ng-class="{ 'active': $state.is('freeVendors.createAd') }"><a
			ui-sref="freeVendors.createAd"><i class="fa fa-plus"></i><span><%=prop.getProperty("newAd")%></span></a></li>
		<li ng-class="{ 'active': $state.is('freeVendors.AdsListing') }"><a
			ui-sref="freeVendors.AdsListing"><i class="fa fa-list"></i><span><%=prop.getProperty("adList")%></span></a></li>
	</ul>
	<!-- //free vendor sidebar  -->
	<%
		} else if (z.equals("Standard 1 Yr") || z.equals("Standard 3 Yr") || z.equals("Featured 1 Yr")
				|| z.equals("Free List")) {
	%>
	<!-- Listing Vendors -->
	<ul
		class="sidebar-menu sm-icons-block sm-icons-right sm-active-item-bg">
		<li ng-class="{ 'active': $state.is('vendor.dashboard') }"><a
			ui-sref="vendor.dashboard"><i class="fa fa-tachometer"></i><span><%=prop.getProperty("dashboard")%></span></a></li>
		<li ng-click="updatePlan();"
			ng-class="{ 'active': $state.is('vendor.updatePlan') }"><a
			ui-sref="vendor.updatePlan"><i class="fa fa-refresh"></i><span><%=prop.getProperty("updatePlan")%></span></a></li>
		<li ng-if="vendor.vendorPaymentStatus == 'Active'" ng-class="{ 'active': $state.is('vlisting.newList') }"><a
			ui-sref="vlisting.newList"><i class="fa fa-plus"></i><span><%=prop.getProperty("createList")%></span></a></li>
		<li ng-if="vendor.vendorPaymentStatus == 'Active'" ng-class="{ 'active': $state.is('vlisting.listing') }"><a
			ui-sref="vlisting.listing"><i class="fa fa-list"></i><span><%=prop.getProperty("yourListing")%></span></a></li>
	</ul>
	<!-- Listing Vendors -->
	<%
		}
	%>
</div>
<%
}
%>